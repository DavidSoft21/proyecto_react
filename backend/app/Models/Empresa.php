<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Empresa extends Model
{
    use HasFactory;


    protected $table = 'empresa';
    protected $fillable = [
        'empresa',
    ];

    protected $hidden = [
        "created_at",
        "updated_at"
    ];

    /**
     * Get the index for the empresa.
     */
    public function index(): HasOne
    {
        return $this->HasOne(TypeContent::class);
    }





}
