<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Note extends Model
{
    protected $guarded = [];
    protected $casts = [
        'tags' => 'array',
    ];    
}
