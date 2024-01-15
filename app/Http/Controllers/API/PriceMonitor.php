<?php

namespace App\Http\Controllers\API;

use App\Models\BiddingItem;
use App\Models\Transaction;
use App\Models\User;
use App\Models\BiddingInfo;
use App\Models\PriceUpdate;
use App\Models\ProductData;
use Illuminate\Http\Request;
use App\Models\AcitivityLogs;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class PriceMonitor extends Controller
{
    public function index($id){
        
        $data = PriceUpdate::select('*')->where('name_tag_int',$id)->orderBy('created_at','DESC')->get();

        return response()->json([
            "status"        =>      200,
            "data"          =>      $data,
        ]);
    }
    public function register(Request $request){

        $validator = Validator::make($request->all(), [
            "new_price"         =>      "required",
        ]);

        if($validator->fails()){
            return response()->json([
                "error"         =>      $validator->messages(), 
            ]);
        }
        else{
            $data = new PriceUpdate;
            $data->current_price = $request->current;
            $data->new_price = $request->new_price;
            $data->name_tag_int = $request->name;
            $data->save();

            $logs = new AcitivityLogs;
            $logs->activity = "Copras Changed Price to". " ".$request->new_price;
            $logs->user_logs_fk = $request->id;
            $logs->save();

            return response()->json([
                "status"            =>      200,
                "message"           =>      "Price Updated"
            ]);
        }
    }
    public function remove($id){

        $data = PriceUpdate::find($id);
        if($data) {
            $data->delete();
            return response()->json([
                "status"            =>          200,
            ]);
        }
    }

    public function AllProductsTotal($id){
        $total = BiddingInfo::where('user_info_fk',$id)->get();
        $whole = PriceUpdate::select('*')->whereIn('name_tag_int',[2])->orderBy('created_at','DESC')->get()->first();
        $user = User::where('id',$id)->first();
        $sold = BiddingInfo::join('tbl_biddingitem','tbl_biddingitem.id','=','tbl_biddinginfo.bidding_item_fk')
            ->selectRaw('tbl_biddingitem.price_status')
                ->where('tbl_biddingitem.price_status',1)
                    ->where('tbl_biddinginfo.user_info_fk',$id)
                    ->get();

        $pending = BiddingInfo::join('tbl_biddingitem','tbl_biddingitem.id','=','tbl_biddinginfo.bidding_item_fk')
            ->selectRaw('tbl_biddingitem.price_status')
                ->where('tbl_biddingitem.price_status',0)
                    ->get();
        $totalincome = Transaction::where('user_seller_fk',$id)
            ->selectRaw('sum(total) as total')
        ->get();

        return response()->json([
            "status"            =>          200,
            "overall"           =>          $total->count(),
            "whole"             =>          $whole,
            "name"              =>          $user,
            "income"            =>          $totalincome,
            "sold"              =>          $sold->count(),
            "pending"           =>          $pending->count(),
        ]);
    }

    public function PriceData(){
        $data = ProductData::where('status',1)->orderBy('product_name','ASC')->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
        
    }

    public function MostSells(){
        $data = BiddingItem::selectRaw('name, count(name) as total')
        ->groupBy('name')
        ->orderBy('total','DESC')
        ->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
        
    }
}
