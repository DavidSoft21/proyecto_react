<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Mail\Mailables\Content;

class Index extends Model
{
    use HasFactory;

    protected $table = 'index';
    protected $fillable = [
        'year',
        'password',
        'title',
        'user_id',
        'state_id',
        'type_index_id',
        'parent_index_id'
    ];

    protected $hidden = [
        'prev_index_id',
        'next_index_id',
        "created_at",
        "updated_at"
    ];


    /**
     * Get the content for the Index.
     */
    public function contents(): HasMany
    {
        return $this->hasMany(TypeIndex::class);
    }

    /**
     * Get the users for the Index.
     */
    public function users(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the type_index for the Index.
     */
    public function type_index(): BelongsTo
    {
        return $this->belongsTo(TypeIndex::class);
    }

    /**
     * Get the state for the Index.
     */
    public function state(): BelongsTo
    {
        return $this->belongsTo(State::class);
    }

    /**
     * Get the prev_index for the Index.
     */
    public function prev_index(): HasOne
    {
        return $this->hasOne(Index::class, 'prev_index_id');
    }

    /**
     * Get the next_index for the Index.
     */
    public function next_index(): HasOne
    {
        return $this->hasOne(Index::class, 'next_index_id');
    }

    /**
     * Get the empresa for the index.
     */
    public function empresas(): BelongsTo
    {
        return $this->BelongsTo(TypeContent::class);
    }
}
