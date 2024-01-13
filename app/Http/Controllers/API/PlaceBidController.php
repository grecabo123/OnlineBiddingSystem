<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\BiddingItem;
use App\Models\BiddingPost;
use App\Models\BidHistory;
use Illuminate\Http\Request;

class PlaceBidController extends Controller
{
    //

    public function PlaceBid(Request $request){

        $biditem = BiddingItem::where('uniq_key',$request->key)->first();
        $placebid = BiddingPost::where('bidding_amt_fk',$biditem->id)->first();
        
        if($placebid){

            $placebid->amount_bidding = $request->amount;
            $placebid->update();

            $bidhisotry = new BidHistory;
            $bidhisotry->tbl_biddingitem_fk = $biditem->id;
            $bidhisotry->tbl_biddingprice_fk = $request->amount;
            $bidhisotry->comment = $request->description;
            $bidhisotry->user_fk = $request->user_fk;
            $bidhisotry->save();



            return response()->json([
                "status"            =>          200,
            ]);
        }
        else{
            return response()->json([
                "status"            =>          504,
            ]);
        }
    


        // $biditem = BiddingItem::where('uniq_key',$request->key)->first();

        // // $placebid = BiddingPost::where('bidding_amt_fk',$biditem->id)->first();
    
        // $placebid = new BiddingPost;
        // $placebid->bidding_amt_fk = $biditem->id;
        // $placebid->amount_bidding = $request->amount;
        // $placebid->bidding_item_user_fk = $request->user_fk;
        // $placebid->save();

        // $bidhisotry = new BidHistory;
        // $bidhisotry->tbl_biddingitem_fk = $biditem->id;
        // $bidhisotry->tbl_biddingprice_fk = $request->amount;
        // $bidhisotry->user_fk = $request->user_fk;
        // $bidhisotry->save();

        // return response()->json([
        //     "status"            =>          200,
        // ]);
    }
        // else{
        //     return response()->json([
        //         "status"            =>          504,
        //     ]);
        // }
    // }



}
