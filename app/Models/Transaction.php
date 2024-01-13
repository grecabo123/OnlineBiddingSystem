<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;

    protected $table = "tbl_transaction";

    protected $fillable =[ 
        "user_seller_fk",
        "user_buyer_fk",
        "product_fk",
        "total_amount",
        "month",
        "total",
        "price_unit",
        "weight",
        "starting_price",
    ];
}
