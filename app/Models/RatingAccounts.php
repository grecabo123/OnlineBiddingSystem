<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RatingAccounts extends Model
{
    use HasFactory;

    protected $table = "tbl_rating";
    protected $fillable = [
        "user_rating_fk",
        "rating_num",
    ];
}
