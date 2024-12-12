<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Server extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'url',
        'protocol',
        'status',
    ];

    public function requests(){
        return $this->hasMany(Request::class);
    }
}
