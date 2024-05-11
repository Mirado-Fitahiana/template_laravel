@extends('template.main')

@section('titre','insertion liste')
@section('loader')
@section('header')
@section('sidebar')
    @section('contenu')
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Insertion Liste</h4> 
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Form Elements</h5>
                        <form action="{{url('/liste')}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group row">
                                <label for="fname" class="col-sm-3 text-right control-label col-form-label">Nom produit</label>
                                <div class="col-sm-9">
                                    <input type="text" value="{{old('nom')}}" name="nom" class="form-control" id="fname" placeholder="Nom produit">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3">Image</label>
                                <div class="col-sm-9">
                                    <div class="custom-file">
                                        <input type="file"  name="image" class="custom-file-input" id="validatedCustomFile" required>
                                        <label class="custom-file-label" for="validatedCustomFile">choisissez une image</label>
                                        <div class="invalid-feedback">Example invalid custom file feedback</div>
                                    </div>
                                </div>
                            </div>
                            <div class="border-top">
                                <div class="card-body">
                                    <button type="submit" class="btn btn-primary">Enregistrement</button>
                                </div>
                                
                            </div>
                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            @if (session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                            @endif

                            @if (session('error'))
                                <div class="alert alert-danger">
                                    {{ session('error') }}
                                </div>
                            @endif
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Liste</h4> 
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                            <div class="p-6">
                                <div class="container">
                                    <table class="table table-bordered" id="y_dataTables">
                                        <thead>
                                        <tr>
                                            <th>nom produit</th>
                                            <th>image</th>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </div>
    <script>
        $(document).ready(function () {
            $('#y_dataTables').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ url('liste') }}",
                columns: [
                    { data: 'nom_produit', name: 'nom_produit' },
                    {
                        // Define a render function for the image column
                        data: 'path_image',
                        name: 'path_image',
                        render: function (data, type, full, meta) {
                            return '<img src="' + data + '" alt="Product Image" style="max-width:100px;max-height:100px;">';
                        }
                    }
                ]
            });
        });
    </script>
      </div>
    @endsection