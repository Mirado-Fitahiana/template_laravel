<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Recherche extends Model
{
    use HasFactory;
    protected $table = "recherche";
    protected $primaryKey = "id_recherche";
    public $timestamps = false;

    
}