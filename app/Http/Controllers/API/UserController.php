<?php

namespace App\Http\Controllers\API;

use App\Models\AcknowledgeMent;
use App\Models\BiddingInfo;
use App\Models\BiddingItem;
use App\Models\BiddingImage;
use App\Models\BiddingPost;
use App\Models\BidHistory;
use App\Models\ProductData;
use App\Models\Transaction;
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
            // "productname"           =>          "required",
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
            return response()->json([
                "error"             =>          $validate->messages(),
              
            ]);
        }
        else{

            $product = ProductData::find($request->producttype);
            // $product_list = ProductData


            $biddingitem = new BiddingItem;
            $biddingitem->name = $product->product_name;
            $biddingitem->uniq_key = md5(time().$request->productname);
            $biddingitem->description = $request->productdetails;
            $biddingitem->start_date_now = $request->startbit;
            $biddingitem->end_date_now = $request->endbit;
            $biddingitem->milliseconds_data = $request->time_end;
            $biddingitem->price_unit = $product->type_of_quantity;
            $biddingitem->save();
    
            $biddinginfo = new BiddingInfo;
            $biddinginfo->product_name =  $request->productname;
            $biddinginfo->product_price =  $product->product_price;
            $biddinginfo->address = $request->address;
            $biddinginfo->bidding_brgy_fk = $request->barangay;
            $biddinginfo->bidding_item_fk = $biddingitem->id;
            $biddinginfo->user_info_fk = $request->user_logs;
            $biddinginfo->tbl_productanme_tbl_fk = $product->id;
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
            $bidding_history->tbl_biddingitem_fk = $biddingitem->id;
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

        $bid = BiddingItem::join('tbl_biddinginfo','tbl_biddinginfo.bidding_item_fk','=','tbl_biddingitem.id')
            ->selectRaw('tbl_biddingitem.id,tbl_biddinginfo.user_info_fk')
            ->where('uniq_key',$id)
                ->first();

        $bid_user = BidHistory::join('users','users.id','=','tbl_bidding_history.user_fk')
            ->join('tbl_contact','tbl_contact.contact_user_fk','=','users.id')
            ->selectRaw('users.id as user_id, tbl_bidding_history.status,tbl_bidding_history.comment,tbl_bidding_history.schedule,tbl_bidding_history.tbl_biddingprice_fk,users.name_user,tbl_contact.contact_number,tbl_bidding_history.created_at')
                ->where('tbl_bidding_history.tbl_biddingitem_fk',$bid->id)
                    ->where('tbl_bidding_history.user_fk','!=',$bid->user_info_fk)
                    ->orderBy('tbl_bidding_history.created_at','DESC')
                    ->get();

            $bidwin = BidHistory::join('users','users.id','=','tbl_bidding_history.user_fk')
                ->selectRaw('users.name_user,tbl_bidding_history.tbl_biddingprice_fk,users.id,users.email')
                    ->where('tbl_biddingitem_fk', $bid->id)
                        ->where('tbl_bidding_history.user_fk', '!=',$bid->user_info_fk)
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
    public function GetProductUpdate($id){
        $product = ProductData::orderBy('product_name','ASC')->get();

        $income = Transaction::selectRaw('month,sum(total) as income')
            ->where('user_seller_fk',$id)
            ->groupBy('month')
                    ->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $product,
            "income"            =>          $income,
        ]);
    }

    public function TransactionHistory ($id) {
        $data = Transaction::join('tbl_biddingitem','tbl_biddingitem.id','=','tbl_transaction.product_fk')
        ->join('users as seller','seller.id','=','tbl_transaction.user_seller_fk')
        ->join('users as buyer','buyer.id','=','tbl_transaction.user_buyer_fk')
        ->join('tbl_biddinginfo','tbl_biddinginfo.bidding_item_fk','=','tbl_biddingitem.id')
        ->where('tbl_transaction.user_seller_fk',$id)
        ->get();

    return response()->json([
        "status"            =>          200,
        "data"              =>          $data,
    ]);
    }

    public function CloseBid (Request $request) {
        $item = BiddingItem::where('uniq_key',$request->uniq)->first();

        if($item) {
            $item->price_status = 1;
            $item->update();
            $price = BidHistory::where('tbl_biddingitem_fk',$item->id)
                ->where('user_fk',$request->id)
                    ->first();
            
            // tbl_biddingpricefk
    
            $history = new Transaction;
            $history->user_seller_fk = $request->from_user;
            $history->user_buyer_fk = $request->id;
            $history->product_fk = $item->id;
            $history->month = $request->month;
            $history->starting_price = $request->starting;
            $history->total_amount = $price->tbl_biddingprice_fk;
            $history->total = $request->total_amt;
            $history->price_unit = $request->unitprice;
            $history->weight = $request->quantity;
            $history->save();
    
            return response()->json([
                "status"            =>              200,
            ]);
        }
    }

    public function Notification ($id) {
        $data = Transaction::join('tbl_biddingitem','tbl_biddingitem.id','=','tbl_transaction.product_fk')
            ->join('users','users.id','=','tbl_transaction.user_seller_fk')
                ->where('user_buyer_fk',$id)->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
    }

    public function AverageKilo($id){

        $data = Transaction::selectRaw('month,sum(weight) as total')
            ->where('user_seller_fk',$id)
                ->groupBy('month')
                    ->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
    }

    public function ProductTransaction($id){

        $data = Transaction::join('tbl_biddingitem','tbl_biddingitem.id','=','tbl_transaction.product_fk')
            ->selectRaw('tbl_biddingitem.name, count(tbl_biddingitem.name) as total')
                ->where('tbl_transaction.user_seller_fk',$id)
                    ->groupBy('tbl_biddingitem.name')
                ->get();

                return response()->json([
                    "status"            =>          200,
                    "data"              =>          $data,
                ]);   
    }

    public function AddedList(Request $request){

        $product = BiddingItem::where('uniq_key',$request->product)->first();
        $data = BidHistory::where('tbl_biddingitem_fk',$product->id)
            ->where('user_fk',$request->user)
                ->first();

        if($data) {

            $data->status = 1;
            $data->update();

            return response()->json([
                "status"            =>          200,
            ]);
        }
    }

    public function Buyerlist ($id) {

        $product = BiddingItem::where('uniq_key',$id)->first();

        $data = BidHistory::join('users','users.id','=','tbl_bidding_history.user_fk')
            ->join('tbl_contact','tbl_contact.contact_user_fk','=','users.id')
            ->where('tbl_bidding_history.tbl_biddingitem_fk',$product->id)
                ->where('tbl_bidding_history.status',1)
                    ->selectRaw('users.name_user,users.email,tbl_bidding_history.status,tbl_bidding_history.comment,tbl_bidding_history.buyer_pick,
                    tbl_bidding_history.schedule,tbl_bidding_history.tbl_biddingprice_fk,tbl_bidding_history.id,tbl_contact.contact_number,tbl_bidding_history.user_fk')
                    ->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
        
    }

    public function Schedule (Request $request) {

        $data = BidHistory::find($request->id);
        $product = BiddingItem::where('uniq_key',$request->product)->first();

        if($data && $product) {
            $product->price_status = 2;
            $product->update();
            $data->schedule = $request->text;
            $data->buyer_pick = 1;   
            $data->update();

            $acknowledge = new AcknowledgeMent;
            $acknowledge->seller_fk = $request->seller_fk;
            $acknowledge->buyer_fk = $request->buyer_fk;
            $acknowledge->product_key = $product->id;
            $acknowledge->amout_bid = $data->tbl_biddingprice_fk;
            $acknowledge->remark = $request->text;
            $acknowledge->save();

            return response()->json([
                "status"            =>          200,
            ]);
        }
    }

    public function RemoveList(Request $request){
        $data = BidHistory::find($request->id);

        $product = BiddingItem::where('uniq_key',$request->product)->first();


        if($data && $product) {
            $data->status = 0;
            $data->buyer_pick = 0;
            $data->update();

            $product->price_status = 0;
            $product->update();
            return response()->json([
                "status"            =>          200,
            ]);
        }
    }

    public function Acknowledge($id) {
        $data = AcknowledgeMent::join('users','users.id','=','tbl_acknowledge.seller_fk')
            ->join('tbl_biddingitem','tbl_biddingitem.id','=','tbl_acknowledge.product_key')
                ->where('buyer_fk',$id)
                    ->get();
        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
    }

    public function ProductFilter($id) {

        $data = ProductData::find($id);


        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
    }
}
