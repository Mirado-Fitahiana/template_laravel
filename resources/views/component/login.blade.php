@include('template.css')
{{-- @extends('template.main')
    @section('titre','se connecter')
    @section('loader')
    @section('contenu') --}}
    <div class="auth-wrapper d-flex no-block justify-content-center align-items-center bg-dark">
        <div class="auth-box bg-dark border-top border-secondary">
            <div id="loginform">
                <div class="text-center p-t-20 p-b-20">
                    <span class="db"><img src="assets/images/logo.png" alt="logo" /></span>
                </div>
                <!-- Form -->
                <form class="form-horizontal m-t-20" id="loginform" action="{{url('/verify')}}" method="post">
                    @csrf
                    <div class="row p-b-30">
                        <div class="col-12">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-success text-white" id="basic-addon1"><i class="ti-user"></i></span>
                                </div>
                                <input type="text" value="{{ old('email') }}" name="email" class="form-control form-control-lg" placeholder="E-mail" aria-label="E-mail" aria-describedby="basic-addon1" required="">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-warning text-white" id="basic-addon2"><i class="ti-pencil"></i></span>
                                </div>
                                <input type="password" value="{{ old('pass') }}" name="pass" class="form-control form-control-lg" placeholder="Mot de passe" aria-label="Mot de passe" aria-describedby="basic-addon1" required="">
                            </div>
                        </div>
                    </div>
                    <div class="row border-top border-secondary">
                        <div class="col-12">
                            <div class="form-group">
                                <div class="p-t-20">
                                    <button class="btn btn-info" id="to-recover" type="button"><i class="fa fa-book m-r-5"></i> Inscription</button>
                                    <button class="btn btn-success float-right" type="submit">Se connecter</button>
                                </div>
                            </div>
                        </div>
                        @if (session('message'))
                            <center><p style="color: red">{{ session('message') }}</p></center>
                        @endif
                    </div>
                </form>
            </div>
            <div id="recoverform">
                <div class="auth-box bg-dark border-top border-secondary">
                    <div>
                        <div class="text-center p-t-20 p-b-20">
                            <span class="db"><img src="assets/images/logo.png" alt="logo" /></span>
                        </div>
                        <!-- Form -->
                        <form class="form-horizontal m-t-20" action="{{url('/register')}}" method="post">
                            @csrf
                            <div class="row p-b-30">
                                <div class="col-12">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-success text-white" id="basic-addon1"><i class="ti-user"></i></span>
                                        </div> 
                                        <input type="text" value="{{ old('nom') }}" name="nom" class="form-control form-control-lg" placeholder="Nom utilisateur" aria-label="Nom utilisateur" aria-describedby="basic-addon1" required>
                                    </div>
                                    <!-- email -->
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-danger text-white" id="basic-addon1"><i class="ti-email"></i></span>
                                        </div>
                                        <input type="text" value="{{ old('email') }}" name="email" class="form-control form-control-lg" placeholder="E-Mail" aria-label="Username" aria-describedby="basic-addon1" required>
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-warning text-white" id="basic-addon2"><i class="ti-pencil"></i></span>
                                        </div>
                                        <input type="password" name="pass2" class="form-control form-control-lg" placeholder="Mot de passe" aria-label="Password" aria-describedby="basic-addon1" required>

                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-info text-white" id="basic-addon2"><i class="ti-pencil"></i></span>
                                        </div>
                                        <input type="password" name="pass1" class="form-control form-control-lg" placeholder=" Confirmer votre mot de passe" aria-label="Password" aria-describedby="basic-addon1" required>
                                        <div id="password-error" style="display: none; color: red;">Les mots de passe ne correspondent pas.</div>
                                    </div>
                                </div>
                                @if ($errors->any())
                                <div class="alert alert-danger">
                                        @foreach ($errors->all() as $error)
                                       <p> {{ $error }}</p>
                                        @endforeach
                                </div>
                            @endif
                            </div>
                            <div class="row m-t-20 p-t-20 border-top border-secondary">
                                <div class="col-12">
                                    <a class="btn btn-success" href="#" id="to-login" name="action">Se connecter</a>
                                    <button class="btn btn-info float-right" type="submit" id="register"  name="action">S'enregistrer</button>
                                </div>
                               
                            </div>
                           
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="{{asset('assets/libs/jquery/dist/jquery.min.js')}}"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="{{asset('assets/libs/popper.js/dist/umd/popper.min.js')}}"></script>
<script src="{{asset('assets/libs/bootstrap/dist/js/bootstrap.min.js')}}"></script>
<!-- ============================================================== -->
<!-- This page plugin js -->
<!-- ============================================================== -->
<script>

document.addEventListener('DOMContentLoaded', function () {
        var pass1Input = document.querySelector('input[name="pass1"]');
        var pass2Input = document.querySelector('input[name="pass2"]');
        var registerButton = document.getElementById('register');
        var errorMessage = document.getElementById('password-error');

        function checkPasswords() {
            if (pass1Input.value !== pass2Input.value) {
                registerButton.disabled = true;
                errorMessage.style.display = 'block';
            } else {
                registerButton.disabled = false;
                errorMessage.style.display = 'none';
            }
        }

        pass1Input.addEventListener('input', checkPasswords);
        pass2Input.addEventListener('input', checkPasswords);
    });

$('[data-toggle="tooltip"]').tooltip();
$(".preloader").fadeOut();
// ============================================================== 
// Login and Recover Password 
// ============================================================== 
$('#to-recover').on("click", function() {
    $("#loginform").slideUp();
    $("#recoverform").fadeIn();
});
$('#to-login').click(function(){
    
    $("#recoverform").hide();
    $("#loginform").fadeIn();
});

 

</script>
{{-- @include('template.footer') --}}