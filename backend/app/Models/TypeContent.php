<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class TypeContent extends Model
{
    use HasFactory;
    protected $table = 'type_content';
    protected $fillable = [
        'name'
    ];

    protected $hidden = [
        "created_at",
        "updated_at"
    ];



    /**
     * Get the content for the type_content.
     */
    public function contents(): HasMany
    {
        return $this->hasMany(Content::class);
    }
}
