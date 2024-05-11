@extends('template.main')

@section('titre','insertion liste')
{{-- @section('loader') --}}
@section('header')
@section('sidebar')
    @section('contenu')
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Resultat</h4> 
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <form action="{{url('/search_multi')}}" method="get">
                        <div class="d-flex justify-content-center align-items-center mb-4">
                            <div class="col-lg-3">
                                <input type="text" value="{{old('nom')}}" class="form-control" placeholder="nom voiture" name="nom">
                            </div>
                            <div class="col-lg-3">
                                <input type="text" value="{{old('marque')}}" class="form-control" placeholder="marque" name="marque">
                            </div>
                            <div class="col-lg-2">
                                <input type="text" value="{{old('min')}}" class="form-control" placeholder="min" name="min">
                            </div>
                            <div class="col-lg-2">
                                <input type="text" value="{{old('max')}}" class="form-control" placeholder="max" name="max">
                            </div>
                            <div class="col-lg-2">
                                <button type="submit" class="btn btn-outline-danger ">Rechercher</button>
                            </div>
                        </div>
                        </form>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>nom voiture</th>
                                    <th>marque voiture</th>
                                    <th>description</th>
                                    <th> prix </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($result as $results)               
                                <tr>
                                    <td>
                                        {{$results->nom_voiture }}
                                    </td>
                                    <td>
                                        {{$results->marque_voiture }}
                                    </td>
                                    <td>
                                        {{$results->description }}
                                    </td>
                                    <td>
                                        {{number_format($results->min,2)}}
                                    </td>
                                    
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                                <ul class="pagination">
                                    {{$result->links()}}
                                </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endsection