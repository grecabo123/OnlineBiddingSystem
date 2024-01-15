<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AcknowledgeMent extends Model
{
    use HasFactory;
    protected $table = "tbl_acknowledge";

    protected $fillable = [
        "seller_fk",
        "buyer_fk",
        "product_key",
        "amout_bid",
    ];
}
