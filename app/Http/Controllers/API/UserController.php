<?php

namespace App\Http\Controllers\API;

use App\Models\BiddingInfo;
use App\Models\BiddingItem;
use App\Models\BiddingImage;
use App\Models\BiddingPost;
use App\Models\BidHistory;
use App\Models\ProductData;
use Illuminate\Http\Request;
use App\Models\AcitivityLogs;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class UserController extends Controller
{
    //

    public function AddProducts(Request $request){

        // dd($request->all());

        $validate = Validator::make($request->all(), [
            "productname"           =>          "required",
            "productdetails"        =>          "required",
            // "auctiondate"           =>          "required",
            "producttype"           =>          "required",
            "barangay"              =>          "required",
            // "youtube"                 =>          "required",
            "address"               =>          "required",
            "files"                 =>          "required|mimes:jpg,jpeg,png",
            "startbit"              =>          "required",
            "endbit"                =>          "required",
        ]);


        if($validate->fails()) {
            // if($request->hasFile('files_upload')){
               
            //     foreach($request->files_upload as $files) {
            //         // $count = 0;
            //         $file = $files->file('file');
            //         $extension = $file->getClientOriginalExtension();
            //         $filename = $request->productname.".".$extension;
            //         $file->move('Uploads/Files/',$filename);
            //         $information->file = "Uploads/Files/".$filename;
            //         // $array = array( 
                        
            //         // );


    
            //         // BiddingImage::insert($array);
    
            //     }
            // }
            return response()->json([
                "error"             =>          $validate->messages(),
              
            ]);
        }
        else{

            $product = ProductData::find($request->producttype);

            $biddingitem = new BiddingItem;
            $biddingitem->name = $request->productname;
            $biddingitem->uniq_key = md5(time().$request->productname);
            $biddingitem->description = $request->productdetails;
            $biddingitem->start_date_now = $request->startbit;
            $biddingitem->end_date_now = $request->endbit;
            $biddingitem->milliseconds_data = $request->time_end;
            $biddingitem->save();
    
            $biddinginfo = new BiddingInfo;
            $biddinginfo->product_name =  $request->productname;
            $biddinginfo->product_price =  $product->product_price;
            $biddinginfo->address = $request->address;
            $biddinginfo->bidding_brgy_fk = $request->barangay;
            $biddinginfo->bidding_item_fk = $biddingitem->id;
            $biddinginfo->user_info_fk = $request->user_logs;
            $biddinginfo->save();

            $biddingimg = new BiddingImage;
            $biddingimg->item_fk = $biddingitem->id;
            if($request->hasFile('files')){
                $file = $request->file('files');
                $extension = $file->getClientOriginalExtension();
                $filename = md5(time()).".".$extension;
                $file->move('Uploads/Files/',$filename);
                $biddingimg->image =  "Uploads/Files/".$filename;                
            }
            $biddingimg->save();

            $logs = new AcitivityLogs;
            $logs->activity = "Creating Bidding Item"." ".$request->productname;
            $logs->user_logs_fk = $request->user_logs;
            $logs->save();

            $productprice = new BiddingPost;
            $productprice->bidding_amt_fk = $biddinginfo->id;
            $productprice->amount_bidding = $product->product_price;
            $productprice->bidding_item_user_fk = $request->user_logs;
            $productprice->save();

            $bidding_history = new BidHistory;
            $bidding_history->tbl_bidding_history = $biddingitem->id;
            $bidding_history->tbl_biddingprice_fk = $product->product_price;
            $bidding_history->user_fk = $request->user_logs;
            $bidding_history->save();
    
            return response()->json([
                "status"        =>          200,
                "success"       =>          "Product Has Been Posted",
            ]);

        }
    }

    public function ProductDetails($id){
        $data = DB::table('tbl_biddingitem')
            ->join('tbl_biddinginfo','tbl_biddinginfo.bidding_item_fk','=','tbl_biddingitem.id')
                ->where('tbl_biddinginfo.user_info_fk',$id)
                    ->orderBy('tbl_biddingitem.created_at','DESC')
                        ->get();

        return response()->json([
            "status"            =>          200,
            "product"           =>          $data,
        ]);
    }

    public function ProductDetailsInformation($id){

        $bid = BiddingItem::where('uniq_key',$id)->first();

        $bid_user = BidHistory::join('users','users.id','=','tbl_bidding_history.user_fk')
            ->selectRaw('tbl_bidding_history.tbl_biddingprice_fk,users.name_user')
                ->where('tbl_bidding_history.tbl_biddingitem_fk',$bid->id)
                    ->get();

            $bidwin = BidHistory::join('users','users.id','=','tbl_bidding_history.user_fk')
                ->selectRaw('users.name_user,tbl_bidding_history.tbl_biddingprice_fk,users.id,users.email')
                    ->where('tbl_biddingitem_fk', $bid->id)
                        ->orderBy('tbl_bidding_history.tbl_biddingprice_fk','DESC')
                            ->first();

        $data = DB::table('tbl_biddingitem')
            ->join('tbl_biddinginfo','tbl_biddinginfo.bidding_item_fk','=','tbl_biddingitem.id')
                ->join('tbl_bidding_image','tbl_bidding_image.item_fk','=','tbl_biddingitem.id')
                    ->where('tbl_biddingitem.uniq_key', $id)
                        ->first();

        return response()->json([
            "status"            =>          200,
            "product"           =>          $data,
            "list"              =>          $bid_user,
            "win"               =>          $bidwin,
        ]);
    }

    public function RemoveProducts($id){
        $removeproducts = BiddingItem::select('id')->whereIn('id',explode(",",$id));
        if($removeproducts){
            $removeproducts->delete();
            return response()->json([
                "status"           =>          200,
                "remove"           =>          "Deleted Permanently",
            ]);
        }
    }

    public function Logs($id){

        $logs = AcitivityLogs::where('user_logs_fk',$id)->get();

        return response()->json([
            "status"        =>      200,
            "data"          =>      $logs,
        ]);
    }

    public function ProductInformation($id){
    $data = DB::table('tbl_biddingitem')
            ->join('tbl_biddinginfo','tbl_biddinginfo.bidding_item_fk','=','tbl_biddingitem.id')
                ->where('tbl_biddingitem.id',$id)
                    ->first();

        return response()->json([
            "status"            =>          200,
            "product"           =>          $data,
        ]);

    }

    public function UpdateProductData (Request $request, $id){

        $item = BiddingItem::find($id);

        if($item){

        }
        else{
            
            return response()->json([
                "status"        =>         200,

            ]);
        }
    }
    public function GetProductUpdate(){
        $product = ProductData::orderBy('product_name','ASC')->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $product,
        ]);
    }
}
