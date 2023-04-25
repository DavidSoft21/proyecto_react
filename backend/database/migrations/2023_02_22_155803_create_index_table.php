<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('index', function (Blueprint $table) {
            $table->id();
            $table->string('year',4);
            $table->string('consecutive');
            $table->string('title',125);
            $table->foreignId('user_id',20);
            $table->foreignId('state_id');
            $table->foreignId('type_index_id');
            $table->string('prev_consecutive');
            $table->string('next_consecutive');
            $table->int('parent_index_id');
            $table->timestamps();
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('empresa_id')->references('id')->on('empresa');
            $table->foreign('state_id')->references('id')->on('states');
            $table->foreign('type_index_id')->references('id')->on('type_index');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('index');
    }
};
