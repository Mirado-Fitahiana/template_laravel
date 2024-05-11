<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Liste extends Model
{
    use HasFactory;
    protected $table = "liste";
    protected $primaryKey = 'id_produit';
    public $timestamps = false;

    public function insert_liste($nom, $image) {
        $liste = new Liste();
        $liste->nom_produit = $nom;
        $liste->path_image = $image;
        if ($liste->save()) {
            return $liste->path_image; 
        }
        return null;
    }
}
