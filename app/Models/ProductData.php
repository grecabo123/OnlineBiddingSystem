<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductData extends Model
{
    use HasFactory;

    protected $table = "tbl_productanme_tbl";

    protected $fillable = [
        "product_name",
        "product_price",
        "type_of_quantity",
        "product_color_code",
    ];

    
}
