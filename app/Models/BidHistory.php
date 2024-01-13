<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BidHistory extends Model
{
    use HasFactory;

    protected $table = "tbl_bidding_history";

    protected $fillable = [
        "tbl_biddingitem_fk",
        "tbl_biddingprice_fk",
        "schedule",
        "comment",
        "status",
        "user_fk",
    ];

}
