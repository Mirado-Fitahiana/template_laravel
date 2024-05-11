<?php

namespace App\Http\Controllers;
use App\Models\Recherche;
use Illuminate\Support\Facades\DB;
use App\Models\Liste;
use App\Models\Personne;
use Illuminate\Http\Request;
use Intervention\Image\Laravel\Facades\Image;

class InitController extends Controller
 {
   
    public function verifyLogin(Request $request){
        $request->validate([
            'email'=> 'required|string|email|max:255',
            'pass'=> 'required|string|max:255'
        ]);

        $mail = $request->email;
        $pass = $request->pass;

        $personne = new Personne();
        $verify = $personne->verify_pass($mail,$pass);
      
        if ($verify === true) {
            return view('component.composant');  
        }else{
            return back()->with('message','Verifiez vos identifiants')->withInput();
        }
    }

    public function register(Request $request){
        $request->validate([
                'email' => 'required|email|unique:personne,email',
                'pass1' => 'required|min:6',
                'pass2' => 'required|min:6',
                'nom' => 'required|string|max:255',
            ]);
        

        if($request->pass1 != $request->pass2) {
            return back()->with('message','les mot de passe ne corresponde pas')->withInput();
        }

        $verify = Personne::where('email',$request->email)->first();
        if($verify){
            return back()->with('message','e-mail déjà present');
        }

        $personne = new Personne();
        $nom = $request->nom;
        $email = $request->email;
        $pass = $request->pass1;
        $personne->register($email,$pass,$nom);

        if ($personne == false) {
            return back()->with('message','Verifiez vos information')->withInput();
        }else{
            return view('component.composant');
        }
    }

    public function store_liste(Request $request) {
        $request->validate([
            'nom' => 'required|string|max:255',
            'image' => 'required|mimes:png,jpg,gif|max:2048'
        ]);
    
        $imageName = time() . '-' . $request->file('image')->getClientOriginalName();
        // $destinationPath = public_path('images/');

        $image = Image::read($request->file('image'));
        $image->resize(300, 300, function ($constraint) {
            $constraint->aspectRatio();
        })->save(public_path('images/' . $imageName));
        $imageName = 'images/'.$imageName;
    
        $nom = $request->nom;
        $liste = new Liste();
    
        if ($path = $liste->insert_liste($nom, $imageName)) {
            return back()->with('success', 'Enregistrement réussi')->with('path', $path);
        } else {
            return back()->with('error', 'Erreur lors de l\'enregistrement')->withInput();
        }
    }

    public function show_list(Request $request)
    {
        if ($request->ajax()) {
            $users = Liste::select('*')->get();
            return datatables()->of($users)->toJson(); 
        }
        return view('component.form_liste');
    }

    public function search_simple($table, $column, $value)
    {
        $search = trim($value);
        $results = DB::table($table)
            ->where($column, 'LIKE', '%' . $search . '%')
            ->get();
        return $results;
    }
    
    // need modification 
    public function search_full_text($value){
        $search = trim($value);
        $results = Recherche::select('*')
        ->whereRaw("search @@ websearch_to_tsquery('french', ?)", [$search]);
        
        return $results;
    } 

    public function search_min_max($min,$max,$table,$colonne){
        $min = trim($min);
        $max = trim($max);
        $min = $min ?? 0;
        $max = $max ?? PHP_INT_MAX;

        $results = DB::table($table)
        ->select('*')
        ->where($colonne,">" ,$min)
        ->where($colonne,"<",$max)
        ->get();

        return($results);
    }

    public function search_multi_critere(Request $request){
        $request->validate([
            'nom' => 'string|max:255',
            'marque' => 'string|max:255',
            'min' => 'numeric|nullable',
            'max' => 'numeric|nullable'
        ]);  
        
        $nom = '%' . $request->input('nom') . '%';
        $marque = '%' . $request->input('marque') . '%';
        $min = $request->input('min');
        $max = $request->input('max');
        
        if($nom === null || $nom === ''){
            $nom = '';
        }
        if ($marque === null || $marque === '' ) {
            $marque = '';
        }
        if ($min === null || $min === ''){
            $min = 0;
        }
        if ($max === null || $max === ''){
            $max = 9999999999999;
        }
    
        $query = Recherche::select('*');
    
        if ($nom !== '%%') {
            $query->where('nom_voiture', 'like', $nom);
        }
    
        if ($marque !== '%%') {
            $query->where('marque_voiture', 'like', $marque);
        }
    
        if ($min !== null && $max !== null && $min <= $max) {
            $query->whereBetween('min', [$min, $max]);
        } elseif ($min !== null) {
            $query->where('min', '>=', $min);
        } elseif ($max !== null) {
            $query->where('min', '<=', $max);
        }
    
        $results = $query->paginate(5)->appends($request->all());
        $data = [
            'result' => $results,
        ];
    
        return view('component.result', $data);
    }
    

    public function full_search(Request $request){
        $request->validate([
            'search' => 'required|string|max:255',
        ]);
    
        $search = trim($request->input("search"));
        $data = null;
    
        if($search === '' || $search === null){
            $tab = Recherche::select("*")->paginate(10);
        }else{
            $results = $this->search_full_text($search);
            $tab = $results->paginate(5)->appends(['search' => $search]);
        }
    
        $data = [
            'result' => $tab,
        ];
    
        return view('component.result', $data);
    } 


}




