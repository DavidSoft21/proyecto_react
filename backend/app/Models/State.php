<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;


class State extends Model
{
    use HasFactory;
    protected $table = 'states';
    protected $fillable = [
        'name'
    ];

    protected $hidden = [
        "created_at",
        "updated_at"
    ];



    /**
     * Get the index for the state.
     */
    public function index(): HasOne
    {
        return $this->hasOne(Index::class);
    }

}
