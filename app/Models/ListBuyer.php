<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ListBuyer extends Model
{
    use HasFactory;

    protected $table = "tbl_buyerlist";

    protected $fillable = [
        "user_buyer_fk",
        "schedule_visit",
        "price_bid_user",
    ];
}
