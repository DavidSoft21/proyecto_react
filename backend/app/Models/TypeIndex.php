<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class TypeIndex extends Model
{
    use HasFactory;

    protected $table = 'type_index';
    protected $fillable = [
        'name'
    ];

    protected $hidden = [
        "created_at",
        "updated_at"
    ];



    /**
     * Get the index for the type_index.
     */
    public function index(): HasMany
    {
        return $this->hasMany(Index::class);
    }


}
