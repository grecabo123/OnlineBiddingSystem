<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblBuyerlistTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_buyerlist', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_buyer_fk');
            $table->foreign('user_buyer_fk')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            $table->string('schedule_visit');
            $table->double('price_bid_user',20,2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_buyerlist');
    }
}
