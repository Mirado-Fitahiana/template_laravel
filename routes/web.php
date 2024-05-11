<?php

use App\Http\Controllers\InitController;
use App\Http\Middleware\SessionAdmin;
use App\Http\Middleware\SessionValidation;
use Illuminate\Support\Facades\Route;

Route::get('/',function ()  {
   return view('component.composant'); 
});
Route::get('/login',function ()  {
   // session()->invalidate();
   return view('component.login'); 
});
Route::post('/verify', [InitController::class,'verifyLogin'])->name('verify_login');
Route::post('/register', [InitController::class,'register'])->name('register');

Route::middleware([SessionValidation::class])->group(function () {
   Route::get('/disconnect', function () {
      session()->invalidate();
      return view('component.composant'); 
   });

   Route::get('/liste',[InitController::class,'show_list'])->name('liste');
   Route::post('/liste', [InitController::class,'store_liste']);
   Route::get('/resultat',[InitController::class,'full_search']);
   Route::get('/search_multi',[InitController::class,'search_multi_critere']);
});
