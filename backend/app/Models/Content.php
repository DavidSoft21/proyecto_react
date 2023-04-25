<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Content extends Model
{
    use HasFactory;

    protected $table = 'contents';
    protected $fillable = [
        'index_id',
        'content_type_id'
    ];

    protected $hidden = [
        "created_at",
        "updated_at"
    ];



    
    /**
     * Get the type_content for the content.
     */
    public function type_content(): BelongsTo
    {
        return $this->BelongsTo(TypeContent::class);
    }


    /**
     * Get the index for the content.
     */
    public function index(): BelongsTo
    {
        return $this->BelongsTo(Index::class);
    }
}
