<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;

class Personne extends Model
{
    use HasFactory;

    protected $table = "personne";
    protected $primaryKey = 'id_personne';
    public $timestamps = false;
    
    public function verify_pass($mail,$pass){
        $verify = Personne::where("email",$mail)->where("pass",$pass)->first();
        if($verify){
            // echo"true";
            session(['personne' => $verify]);
            return true;
        }else{
            // echo'false';
            return false;
        }
    }  
    
    public function register($mail,$pass,$nom){

    $personne = new Personne();
    $personne->email = $mail;
    $personne->pass = $pass;
    $personne->nom = $nom;
    $personne->isadmin = 0; 
    $id = $personne->save();
        if($id != null){
            $sess = Personne::where('id_personne',$id)->first();
            session(['personne' => $sess]);
            return true;
        }else{
            return false;
        }
    }

}
