<?php

namespace App\Http\Controllers\API;

use App\Models\BarangayData;
use App\Models\Municipality;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BarangayController extends Controller
{
    //

    public function ListBarangay(){

        $data = BarangayData::select('*')->orderBy('brgy_name','ASC')->get();

        return response()->json([
            "status"        =>      200,
            "brgy"          =>      $data,
        ]);
    }

    public function Muninicaplity (){
        $data = Municipality::select('*')->orderBy('municipality','ASC')->get();

        return response()->json([
            "status"        =>      200,
            "municipality"          =>      $data,
        ]);
    }
}
