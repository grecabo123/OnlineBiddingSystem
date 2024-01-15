<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblAcknowledgeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_acknowledge', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('seller_fk');
            $table->foreign('seller_fk')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            $table->unsignedBigInteger('buyer_fk');
            $table->foreign('buyer_fk')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            $table->string('product_key');
            $table->double('amout_bid',30,2);
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
        Schema::dropIfExists('tbl_acknowledge');
    }
}
