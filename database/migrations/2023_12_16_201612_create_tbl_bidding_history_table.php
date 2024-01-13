<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblBiddingHistoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_bidding_history', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tbl_biddingitem_fk');
            $table->foreign('tbl_biddingitem_fk')->references('id')->on('tbl_biddingitem')->onDelete('cascade')->onUpdate('cascade');
            $table->double('tbl_biddingprice_fk',10,2);
            $table->string('schedule');
            $table->string('comment');
            $table->integer('status')->default(0); // 0 not in the list     1 // naa siya sa list
            $table->unsignedBigInteger('user_fk');
            $table->foreign('user_fk')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('tbl_bidding_history');
    }
}
