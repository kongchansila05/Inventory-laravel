<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\API\CollectionController;
use App\Models\CollectionModel;
use App\Models\CalculationModel;
use App\Models\TransactionModel;
use App\Models\PaymentModel;
use Carbon\Carbon;
use App\Http\Controllers\API\UnitController;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\ProductController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/TotalCollection',function(Request $request){

    $reason = CollectionModel::where('Id_co',Request('id'))->count();
    $collet = CollectionModel::where('Id_co',Request('id'))->sum('plan');
    if(Request('id')){ 
        $response =[
       'TotalClient' => "$reason",
       'TotalCollet' => number_format($collet,0, '.', ','),
        ];
        $data = [
            'status'  => true,
            'message' => 'TotalCollection',
            'data'    => $response
        ];
    }
    else{
        $data = [
            'status' => false,
            'message' => 'TotalCollection',
            'data' => null
        ];
    }
    return response()->json($data, 200);
});
Route::post('/history_detail',function(Request $request){
    
    $cos_province =   DB::table('cos')
    ->groupBy('province_id')
    ->where('Id_co', Request('id'))
    ->selectRaw('province_id as province');
    if(Request('province_id')){
       $cos_province->where('province_id', Request('province_id'));
    }

$kongchansila=$cos_province->get();
foreach( $kongchansila as $key => $cos_provincevalue){
$cos_district =   DB::table('cos')
    ->groupBy('district_id')
    ->where('Id_co', Request('id'))
    ->where('province_id', $kongchansila[$key]->province)
    ->selectRaw('district_id')
    ->get();
    foreach( $cos_district as $key1 => $cos_districtvalue){
       $cos_commune =   DB::table('cos')
                       ->groupBy('commune_id')
                       ->where('Id_co', Request('id'))
                       ->where('district_id', $cos_districtvalue->district_id)
                       ->selectRaw('commune_id')
                       ->get();
                       foreach( $cos_commune as $key2 => $cos_communevalue){
                           $cos_village =   DB::table('cos')
                           ->groupBy('village_id')
                           ->where('Id_co', Request('id'))
                           ->where('commune_id', $cos_communevalue->commune_id)
                           ->selectRaw('village_id')
                           ->get();
                           $cos_commune[$key2]->village = $cos_village;
                       }
                       $cos_district[$key1]->commune =$cos_commune ;
       }
    $kongchansila[$key]->district =$cos_district ;

  } 
  //
        $provinces = DB::table('cos') ->select('cos.*','sila.collect as collect')
        ->where('cos.Id_co', Request('id'))
        ->leftjoin(DB::raw('(SELECT co_id, SUM(collects) as collect FROM transaction_co GROUP BY co_id) as sila'),
            function($join)
            {
                $join->on('sila.co_id', '=', 'cos.id');
            });
            // SUM(collects) as collect FROM calculation_co GROUP BY co_id) as sila'
            if(Request('province_id')){
            $provinces->where('cos.province_id', Request('province_id'));
            }
            if(Request('district_id')){
                $provinces->where('cos.district_id', Request('district_id'));
                }
            if(Request('commune_id')){
                    $provinces->where('cos.commune_id', Request('commune_id'));
                }
            if(Request('village_id')){
                $provinces->where('cos.village_id', Request('village_id'));
                }
            if(Request('date')){
                $provinces->where(DB::raw("(DATE_FORMAT(cos.co_pay_date,'%Y-%m-%d'))"), "=", Request('date'));
                }
        $dataIem = $provinces->get();
    //

    $co_name  = DB::table('cos')->select('id', 'clients','remaining','deposit','collect' ,'plan',DB::raw(" IF(cos.payment_status = 'yes' , TRUE , FALSE) AS status"))
    ->where('id_co',Request('id'));

    if(Request('date')){
        $co_name  = DB::table('cos')->select('id', 'clients','remaining','deposit','collect' ,'plan' ,DB::raw(" IF(cos.payment_status = 'yes' , TRUE , FALSE) AS status"))->where(DB::raw("(DATE_FORMAT(created_at,'%Y-%m-%d'))"), "=", Request('date'));
    }
    if(Request('province_id')){
        $co_name->where('cos.province_id', Request('province_id'));
    }
    if(Request('district_id')){
        $co_name->where('cos.district_id', Request('district_id'));
        }
    if(Request('commune_id')){
            $co_name->where('cos.commune_id', Request('commune_id'));
        }
    if(Request('village_id')){
        $co_name->where('cos.village_id', Request('village_id'));
        }
        if(!$co_name){ 
         $response = [
             'status' => false,
             'message' => 'wrong co id',    
             'data' => null
         ];
        }
            elseif($co_name =='[]'){
                $response = [
                'status' => false,
                'message' => 'History_Detail False',
                'data' => null
            ];
        }
         elseif($co_name != NULL){
              $response = [
                 'status' => true,
                 'message' => 'History_Detail',
                 'province' => $kongchansila,
                 'data' => $dataIem,
             ];
         }else{
              $response = [
                 'status' => false,
                 'message' => 'History_Detail False',
                 'data' => null
             ];
         }
     return response()->json($response, 200);
});
Route::post('/Collection',function(Request $request){
    $old_name = DB::table('cos')
    ->where('Id_co', Request('Id_co'))
    ->get()->first();

    $old_province = DB::table('cos')
    ->where('Id_co', Request('Id_co'))
    ->where('province_id', Request('province_id'))
    ->get()->first();

    $cos_province =   DB::table('cos')
                 ->groupBy('province_id')
                 ->where('close_date', '1')
                 ->where('Id_co', Request('Id_co'))
                 ->selectRaw('province_id as province');
                 if(Request('province_id')){
                    $cos_province->where('province_id', Request('province_id'));
                 }

        $kongchansila=$cos_province->get();
   foreach( $kongchansila as $key => $cos_provincevalue){
    $cos_district =   DB::table('cos')
                 ->groupBy('district_id')
                 ->where('Id_co', Request('Id_co'))
                 ->where('province_id', $kongchansila[$key]->province)
                 ->selectRaw('district_id')
                 ->get();
                 foreach( $cos_district as $key1 => $cos_districtvalue){
                    $cos_commune =   DB::table('cos')
                                    ->groupBy('commune_id')
                                    ->where('Id_co', Request('Id_co'))
                                    ->where('district_id', $cos_districtvalue->district_id)
                                    ->selectRaw('commune_id')
                                    ->get();
                                    foreach( $cos_commune as $key2 => $cos_communevalue){
                                        $cos_village =   DB::table('cos')
                                        ->groupBy('village_id')
                                        ->where('Id_co', Request('Id_co'))
                                        ->where('commune_id', $cos_communevalue->commune_id)
                                        ->selectRaw('village_id')
                                        ->get();
                                        $cos_commune[$key2]->village = $cos_village;
                                    }
                                    $cos_district[$key1]->commune =$cos_commune ;
                    }
                 $kongchansila[$key]->district =$cos_district ;

    } 

    if($old_name && Request('Id_co')){
        $provinces = DB::table('cos') ->select('cos.*','sila.collect as collect')
            ->where('cos.close_date', '1')
            ->where('cos.Id_co', Request('Id_co'))
            ->leftjoin(DB::raw('(SELECT co_id, SUM(collects) as collect FROM transaction_co GROUP BY co_id) as sila'),
                function($join)
                {
                    $join->on('sila.co_id', '=', 'cos.id');
                });
                // SUM(collects) as collect FROM calculation_co GROUP BY co_id) as sila'
                if(Request('province_id')){
                $provinces->where('cos.province_id', Request('province_id'));
                }
                if(Request('district_id')){
                    $provinces->where('cos.district_id', Request('district_id'));
                    }
                if(Request('commune_id')){
                        $provinces->where('cos.commune_id', Request('commune_id'));
                    }
                if(Request('village_id')){
                    $provinces->where('cos.village_id', Request('village_id'));
                    }
                if(Request('date')){
                    $provinces->where(DB::raw("(DATE_FORMAT(cos.co_pay_date,'%Y-%m-%d'))"), "=", Request('date'));
                    }
                    $provinces->where(function($query){
                        $query->where('cos.status', NULL)->orwhere('cos.status', '=','OD');
                    });
            $dataIem = $provinces->get();
     //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxHeand
    //---------------------------------------------------------------Reason            

    $reason = CollectionModel::
    where('close_date', '1')
    ->where('Id_co',Request('Id_co')
);
    $reason->where(function($query){
        $query->where('status', NULL)->orwhere('status', '=','OD');
    });

    if(Request('province_id')){
        $reason->where('province_id', Request('province_id'));
        }
    if(Request('district_id')){
        $reason->where('district_id', Request('district_id'));
        }
    if(Request('commune_id')){
            $reason->where('commune_id', Request('commune_id'));
        }
    if(Request('village_id')){
        $reason->where('village_id', Request('village_id'));
        }
    if(Request('date')){
        $reason->where(DB::raw("(DATE_FORMAT(co_pay_date,'%Y-%m-%d'))"), "=", Request('date'));
        }
    //---------------------------------------------------------------Collet            
        $collet = CollectionModel::where('close_date', '1')->where('Id_co',Request('Id_co'));
        $collet->where(function($query){
            $query->where('status', NULL)->orwhere('status', '=','OD');
        });
    

        if(Request('province_id')){
            $collet->where('province_id', Request('province_id'));
            }
        if(Request('district_id')){
            $collet->where('district_id', Request('district_id'));
            }
        if(Request('commune_id')){
            $collet->where('commune_id', Request('commune_id'));
            }
        if(Request('village_id')){
            $collet->where('village_id', Request('village_id'));
            }
        if(Request('date')){
            $collet->where(DB::raw("(DATE_FORMAT(co_pay_date,'%Y-%m-%d'))"), "=", Request('date'));
            }
        
            $reason_pendding = CollectionModel::
            where('close_date', '1')
            ->where('Id_co',Request('Id_co'));
            $reason_pendding->where(function($query){
                $query->where('status', 'P')->orwhere('status', '=','PO');
            });;

            if(Request('province_id')){
                $reason_pendding->where('province_id', Request('province_id'));
                }
            if(Request('district_id')){
                $reason_pendding->where('district_id', Request('district_id'));
                }
            if(Request('commune_id')){
                    $reason_pendding->where('commune_id', Request('commune_id'));
                }
            if(Request('village_id')){
                $reason_pendding->where('village_id', Request('village_id'));
                }
            if(Request('date')){
                $reason_pendding->where(DB::raw("(DATE_FORMAT(co_pay_date,'%Y-%m-%d'))"), "=", Request('date'));
                }
    //---------------------------------------------------------------Collet_pedding            
            $collet_pedding = CollectionModel::where('close_date', '1')->where('Id_co',Request('Id_co'));
            $collet_pedding->where(function($query){
                $query->where('status', 'P')->orwhere('status', '=','PO');
            });;

            if(Request('province_id')){
                $collet_pedding->where('province_id', Request('province_id'));
                }
            if(Request('district_id')){
                $collet_pedding->where('district_id', Request('district_id'));
                }
            if(Request('commune_id')){
                $collet_pedding->where('commune_id', Request('commune_id'));
                }
            if(Request('village_id')){
                $collet_pedding->where('village_id', Request('village_id'));
                }
            if(Request('date')){
                $collet_pedding->where(DB::raw("(DATE_FORMAT(co_pay_date,'%Y-%m-%d'))"), "=", Request('date'));
                }

        if(Request('Id_co')){ 
            $datasadasd =[
           'TotalClient' => $reason->count(),
           'TotalCollet' => number_format($collet->sum('plan'),0, '.', ','),

           'Client' => $reason_pendding->count(),
           'Collet' => number_format($collet_pedding->sum('plan'),0, '.', ','),

            ];
        }
        
        $data = [
            'status' => true,
            'message' => 'co have ',
            'heand' => $datasadasd,
            'province' => $kongchansila,
            'village' => $cos_village,
            'data' =>  $dataIem
        ];
    }
    else{
        $data = [
            'status' => false,
            'message' => 'not have province ',
        ];
    }
    return response()->json($data, 200);
});
Route::post('/Calculation',function(Request $request){
    $old_name = DB::table('cos')
    ->where('Id_co', Request('Id_co'))
    ->get()->first();

    $old_province = DB::table('cos')
    ->where('Id_co', Request('Id_co'))
    ->where('province_id', Request('province_id'))
    ->get()->first();

    $cos_province =   DB::table('cos')
                 ->groupBy('province_id')
                 ->where('close_date', '1')
                 ->where('Id_co', Request('Id_co'))
                 ->selectRaw('province_id as province');
                 if(Request('province_id')){
                    $cos_province->where('province_id', Request('province_id'));
                 }

        $kongchansila=$cos_province->get();
   foreach( $kongchansila as $key => $cos_provincevalue){
    $cos_district =   DB::table('cos')
                 ->groupBy('district_id')
                 ->where('Id_co', Request('Id_co'))
                 ->where('province_id', $kongchansila[$key]->province)
                 ->selectRaw('district_id')
                 ->get();
                 foreach( $cos_district as $key1 => $cos_districtvalue){
                    $cos_commune =   DB::table('cos')
                                    ->groupBy('commune_id')
                                    ->where('Id_co', Request('Id_co'))
                                    ->where('district_id', $cos_districtvalue->district_id)
                                    ->selectRaw('commune_id')
                                    ->get();
                                    foreach( $cos_commune as $key2 => $cos_communevalue){
                                        $cos_village =   DB::table('cos')
                                        ->groupBy('village_id')
                                        ->where('Id_co', Request('Id_co'))
                                        ->where('commune_id', $cos_communevalue->commune_id)
                                        ->selectRaw('village_id')
                                        ->get();
                                        $cos_commune[$key2]->village = $cos_village;
                                    }
                                    $cos_district[$key1]->commune =$cos_commune ;
                    }
                 $kongchansila[$key]->district =$cos_district ;

    } 

    if($old_name && Request('Id_co')){
        $provinces = DB::table('cos') ->select('cos.*','sila.collect as collect')
            ->where('cos.close_date', '1')
            ->where('cos.Id_co', Request('Id_co'))
            ->leftjoin(DB::raw('(SELECT co_id, SUM(collects) as collect FROM calculation_co GROUP BY co_id) as sila'),
                function($join)
                {
                    $join->on('sila.co_id', '=', 'cos.id');
                });
                if(Request('province_id')){
                $provinces->where('cos.province_id', Request('province_id'));
                }
                if(Request('district_id')){
                    $provinces->where('cos.district_id', Request('district_id'));
                    }
                if(Request('commune_id')){
                        $provinces->where('cos.commune_id', Request('commune_id'));
                    }
                if(Request('village_id')){
                    $provinces->where('cos.village_id', Request('village_id'));
                    }
                if(Request('date')){
                    $provinces->where(DB::raw("(DATE_FORMAT(cos.ca_pay_date,'%Y-%m-%d'))"), "=", Request('date'));
                    }
                    $provinces->where(function($query){
                        $query->where('cos.status', NULL)->orwhere('cos.status', '=','OD');
                    });
            $dataIem = $provinces->get();
     //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxHeand
    //---------------------------------------------------------------Reason            
    $reason = CollectionModel::
    where('close_date', '1')
    ->where('Id_co',Request('Id_co'));
    if(Request('province_id')){
        $reason->where('province_id', Request('province_id'));
        }
    if(Request('district_id')){
        $reason->where('district_id', Request('district_id'));
        }
    if(Request('commune_id')){
            $reason->where('commune_id', Request('commune_id'));
        }
    if(Request('village_id')){
        $reason->where('village_id', Request('village_id'));
        }
    if(Request('date')){
        $reason->where(DB::raw("(DATE_FORMAT(ca_pay_date,'%Y-%m-%d'))"), "=", Request('date'));
        }
    //---------------------------------------------------------------Collet            
        $collet = CollectionModel::where('close_date', '1')->where('Id_co',Request('Id_co'));
        if(Request('province_id')){
            $collet->where('province_id', Request('province_id'));
            }
        if(Request('district_id')){
            $collet->where('district_id', Request('district_id'));
            }
        if(Request('commune_id')){
            $collet->where('commune_id', Request('commune_id'));
            }
        if(Request('village_id')){
            $collet->where('village_id', Request('village_id'));
            }
        if(Request('date')){
            $collet->where(DB::raw("(DATE_FORMAT(ca_pay_date,'%Y-%m-%d'))"), "=", Request('date'));
            }
        if(Request('Id_co')){ 
            $datasadasd =[
           'TotalClient' => $reason->count(),
           'TotalCollet' => number_format($collet->sum('plan'),0, '.', ','),
            ];
        }
        
        $data = [
            'status' => true,
            'message' => 'co have ',
            // 'heand' => $dataToday,
            'province' => $kongchansila,
            'village' => $cos_village,
            'data' =>  $dataIem
        ];
    }
    else{
        $data = [
            'status' => false,
            'message' => 'not have province ',
        ];
    }
    return response()->json($data, 200);
});
Route::post('/CollectionOfPayment',function(Request $request){

    $provinces = DB::table('cos')->where('id', Request('id'))->first();
    DB::table('transaction_co')->insert([
        'co_id'   => Request('id'),
        'co_name_transacton'   => $provinces->co_name,
        'village' => $provinces->village_id,
        'id_co'   => $provinces->Id_co,
        'collects'=> Request('amount'),
        'status'  => Request('status'),
        'reason'  => Request('reason'),
        'date'    => Request('date'),
    ]);
    $cos = DB::table('cos')->where('id', Request('id'))
              ->update([
                'status'  => Request('status'),
                'collect' => $provinces->collect + Request('amount'),
                'co_pay_date'    => Request('date'),
              ]);
    $new = DB::table('cos')->where('id', Request('id'))->first();

        $data = [
        'status' => true,
        'message' => $new,
    ];
    return response()->json($data, 200);
});
Route::post('/CalculationOfPayment',function(Request $request){
                 $provinces = DB::table('cos')->where('id', Request('id'))->first();
    DB::table('calculation_co')->insert([
        'co_id'   => Request('id'),
        'co_name_transacton'   => $provinces->co_name,
        'village' => $provinces->village_id,
        'id_co'   => $provinces->Id_co,
        'collects'=> Request('amount'),
        'status'  => Request('status'),
        'reason'  => Request('reason'),
        'date'    => Request('date'),
    ]);
    $cos = DB::table('cos')->where('id', Request('id'))
    ->update([
      'ca_pay_date'    => Request('date'),
    ]);
    $last = DB::table('cos')->where('id', Request('id'))->first();

        $data = [
        'status' => true,
        'message' => 'Calculation Of Payment',
        'data' => $last,
    ];
    return response()->json($data, 200);
});
Route::post('/HeaderCalculation',function(Request $request){
    $co_name  = CollectionModel::where('Id_co',Request('id'))->get()->first();
    $village  = CollectionModel::where('Id_co',Request('id'))->where('close_date', '1')->distinct()->count('village_id');
    $client   = CollectionModel::where('Id_co',Request('id'))->where('close_date', '1')->count('clients');
    $collect  = CalculationModel::where('Id_co',Request('id'))->where('close', '!=','1')->sum('collects');
    $plan     = CollectionModel::where('Id_co',Request('id'))->where('close_date', '1')->sum('plan');
    $remaining= CollectionModel::where('Id_co',Request('id'))->where('close_date', '1')->sum('remaining');
    // $collect_paid  = TransactionModel::where('id_co',Request('id'))->where('status','P')->Orwhere('status','PO')->get();

    $reason_pendding = CalculationModel::
    where('close', '0')
    ->where('Id_co',Request('id'));
    $reason_pendding->where(function($query){
        $query->where('status', 'P')->orwhere('status', '=','PO');
    });
        if(!$co_name){
         $response = [
             'status' => false,
             'message' => 'wrong co id',
             'data' => null
         ];
        }
         elseif($village != NULL){
             $dataToday=[
                 'co_name'    => $co_name->co_name,
                 'village'    => "$village",
                 'client'     => "$client",
                 'collect'    => number_format($collect,0, '.', ','),
                 'client_paid'=> $reason_pendding->count(),
                 'plan'       => number_format($plan,0, '.', ','),
                 'remaining'  => number_format($plan - $collect,0, '.', ','),
                 '%'          => number_format((($plan - $collect)/ $plan*100),2, '.', ','),
             ];
              $response = [
                 'status' => true,
                 'message' => 'HeaderCalculation',
                 'data' =>  $dataToday
             ];
         }else{
              $response = [
                 'status' => false,
                 'message' => 'HeaderCalculation false',
                 'data' => null
             ];
         }
     return response()->json($response, 200);
 });
Route::get('/Reason',function(){
    $reason = DB::table('reasonofpay')
    ->get();
    $data = [
        'status' => true,
        'message' => 'Reason of pay',
        'data' => $reason
    ];
    return response()->json($data, 200);
});
Route::get('/appuser',function(){
    $reason = DB::table('appuser')
    ->get();
    $data = [
        'status' => true,
        'message' => 'appuser of pay',
        'data' => $reason
    ];
    return response()->json($data, 200);
});
Route::get('/province',function(){
    $reason = DB::table('provinces')
    ->get();
    $data = [
        'status' => true,
        'message' => 'Province of pay',
        'data' => $reason
    ];
    return response()->json($data, 200);
});
Route::post('/History_item',function(){
    $id = Request('id');
    $History_item = DB::table('payment_settle_item')
    ->where('id_pay',$id)
    ->get();
    $data = [
        'status' => true,
        'message' => 'item of history',
        'data' => $History_item
    ];
    return response()->json($data, 200);
});
Route::post('/HeaderHistory',function(Request $request){
   $co_name  = CollectionModel::where('Id_co',Request('id'))->get()->first();
   $village  = CollectionModel::where('Id_co',Request('id'))->where('close_date', '1')->distinct()->count('village_id');
   $client   = CollectionModel::where('Id_co',Request('id'))->where('close_date', '1')->count('clients');
   $collect  = TransactionModel::where('id_co',Request('id'))->where('close', '!=','1')->sum('collects');
   $reason_pendding = CollectionModel::
   where('close_date', '1')
   ->where('Id_co',Request('id'));
   $reason_pendding->where(function($query){
       $query->where('status', 'P')->orwhere('status', '=','PO');
   });
   $collect_paid  = TransactionModel::where('id_co',Request('id'))->where('status','P')->Orwhere('status','PO')->get();
   $plan     = CollectionModel::where('Id_co',Request('id'))->where('close_date', '1')->sum('plan');
   $remaining= CollectionModel::where('Id_co',Request('id'))->where('close_date', '1')->sum('remaining');
       if(!$co_name){
        $response = [
            'status' => false,
            'message' => 'wrong co id',
            'data' => null
        ];
       }
        elseif($village != NULL){
            $dataToday=[
                'co_name'    => $co_name->co_name,
                'village'    => "$village",
                'client'     => "$client",
                'client_paid'=> $reason_pendding->count(),
                'collect'    => number_format($collect,0, '.', ','),
                'plan'       => number_format($plan,0, '.', ','),
                'remaining'  => number_format($plan - $collect,0, '.', ','),
                '%'          => number_format((($plan - $collect)/ $plan*100),2, '.', ','),
            ];
             $response = [
                'status' => true,
                'message' => 'HeaderHistory of Today',
                'data' =>  $dataToday
            ];
        }else{
             $response = [
                'status' => false,
                'message' => 'HeaderHistory false',
                'data' => null
            ];
        }
    return response()->json($response, 200);
});
Route::post('/History',function(Request $request){
    if(Request('type')== 'today'&& Request('start_date') && Request('end_date')){
        $id = Request('id');
        $co_name = DB::table('appuser')->select('username')->where('id', '=', $id)->get();
        $date     = Request('start_date');
        $end_date     = Request('end_date');
        $payment    = PaymentModel::
        where('id_co',Request('id'))
        // ->where(DB::raw("(DATE_FORMAT(date,'%Y-%m-%d'))"), "=", $date)
        ->whereBetween('date', [$date, $end_date])
        ->selectRaw("id")
        ->selectRaw("id_co")
        ->selectRaw("status")
        ->selectRaw("payment_village as village")
        ->selectRaw("FORMAT(total_collect,0) as total")
        ->selectRaw("DATE_FORMAT(date,'%Y-%m-%d') as date")
        ->orderBy('id', 'DESC')
        ->get();
          if(!$co_name){
            $response = [
               'status' => false,
               'message' => 'wrong co id',
               'data' => null
           ];
          }
          elseif($payment != NULL){
             if($payment == '[]'){
                 $response = [
                     'status' => false,
                     'message' => 'not data',
                     'data' => null
                 ];
             }
             else{
                 $response = [
                     'status' => true,
                     'message' => 'start date',
                     'data' =>  $payment
                 ];
             }
          }else{
               $response = [
                  'status' => false,
                  'message' => 'History false',
                  'data' => null
              ];
          }
    }
    elseif(Request('type')== 'today'){
        $id = Request('id');
        $co_name = DB::table('appuser')->select('username')->where('id', '=', $id)->get();
        $date     = Request('start_date') ?? date('Y-m-d');
        $payment    = PaymentModel::
        where('id_co',Request('id'))
        ->where(DB::raw("(DATE_FORMAT(date,'%Y-%m-%d'))"), "=", $date)
        ->selectRaw("id")
        ->selectRaw("id_co")
        ->selectRaw("status")
        ->selectRaw("payment_village as village")
        ->selectRaw("FORMAT(total_collect,0) as total")
        ->selectRaw("DATE_FORMAT(date,'%Y-%m-%d') as date")
        ->orderBy('id', 'DESC')
        ->get();
          if(!$co_name){
            $response = [
               'status' => false,
               'message' => 'wrong co id',
               'data' => null
           ];
          }
          elseif($payment != NULL){
             if($payment == '[]'){
                 $response = [
                     'status' => false,
                     'message' => 'not data',
                     'data' => null
                 ];
             }
             else{
                 $response = [
                     'status' => true,
                     'message' => 'History of today',
                     'data' =>  $payment
                 ];
             }
          }else{
               $response = [
                  'status' => false,
                  'message' => 'History false',
                  'data' => null
              ];
          }
    }
    elseif(Request('type')== 'week'){
        $id = Request('id');
        $co_name  = DB::table('appuser')->select('username')->where('id', '=', $id)->get();
        $week    = PaymentModel::where('id_co',$id)
        ->whereBetween('date', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
        ->selectRaw("id")
        ->selectRaw("id_co")
        ->selectRaw("status")
        ->selectRaw("payment_village as village")
        ->selectRaw("FORMAT(total_collect,0) as total")
        ->selectRaw("DATE_FORMAT(date,'%Y-%m-%d') as date")
        ->orderBy('id', 'DESC')
        ->get();
             if(!$co_name){
               $response = [
                  'status' => false,
                  'message' => 'wrong co id',
                  'data' => null
              ];
             }
             elseif($co_name != NULL){
                if($week == '[]'){
                    $response = [
                        'status' => false,
                        'message' => 'not data',
                        'data' => null
                    ];
                }
                else{
                    $response = [
                        'status' => true,
                        'message' => 'History of week',
                        'data' =>  $week
                    ];
                }
             }else{
                  $response = [
                     'status' => false,
                     'message' => 'History false',
                     'data' => null
                 ];
             }
    }
    elseif(Request('type')== 'month'){
        $date     = date('Y-m-d');
        $id = Request('id');
        $co_name  = DB::table('appuser')->select('username')->where('id', '=', $id)->get();
        $month    = PaymentModel::where('id_co',Request('id'))
        ->whereMonth('date', date('m'))
        ->whereYear('date', date('Y'))
        ->selectRaw("id")
        ->selectRaw("id_co")
        ->selectRaw("status")
        ->selectRaw("payment_village as village")
        ->selectRaw("FORMAT(total_collect,0) as total")
        ->selectRaw("DATE_FORMAT(date,'%Y-%m-%d') as date")
        ->orderBy('id', 'DESC')
        ->get();
             if(!$co_name){
               $response = [
                  'status' => false,
                  'message' => 'wrong co id',
                  'data' => null
              ];
             }
             elseif($co_name != NULL){
                if($month == '[]'){
                    $response = [
                        'status' => false,
                        'message' => 'not data',
                        'data' => null
                    ];
                }
                else{
                    $response = [
                        'status' => true,
                        'message' => 'History of month',
                        'data' =>  $month
                    ];
                }
             }else{
                  $response = [
                     'status' => false,
                     'message' => 'History false',
                     'data' => null
                 ];
             }
    }
    elseif(Request('type')== 'last_month'){
        $id = Request('id');
        $dateS = Carbon::now()->subMonth(3);
        $dateE = Carbon::now(); 
        $co_name  = DB::table('appuser')->select('username')->where('id', '=', $id)->get();
        $month    = PaymentModel::where('id_co',Request('id'))
        ->whereBetween('date',[$dateS,$dateE])
        ->selectRaw("id")
        ->selectRaw("id_co")
        ->selectRaw("status")
        ->selectRaw("payment_village as village")
        ->selectRaw("FORMAT(total_collect,0) as total")
        ->selectRaw("DATE_FORMAT(date,'%Y-%m-%d') as date")
        ->orderBy('id', 'DESC')
        ->get();
             if(!$co_name){
               $response = [
                  'status' => false,
                  'message' => 'wrong co id',
                  'data' => null
              ];
             }
             elseif($co_name != NULL){
                if($month == '[]'){
                    $response = [
                        'status' => false,
                        'message' => 'not data',
                        'data' => null
                    ];
                }
                else{
                    $response = [
                        'status' => true,
                        'message' => 'History of last_month',
                        'data' =>  $month
                    ];
                }
             }else{
                  $response = [
                     'status' => false,
                     'message' => 'History false',
                     'data' => null
                 ];
             }
    }
  return response()->json($response, 200);
});
Route::get('/Transaction',function(){
    $reason = DB::table('transaction_co')
    ->get();
    $data = [
        'status' => true,
        'message' => 'transaction_co of pay',
        'data' => $reason
    ];
    return response()->json($data, 200);
});
Route::get('/village',function(){
    $reason = DB::table('villages')
    ->get();
    $data = [
        'status' => true,
        'message' => 'village of pay',
        'data' => $reason
    ];
    return response()->json($data, 200);
});
Route::post('/Payment_Settle',function(Request $request){
    if(Request('id')&& Request('type')){
       if(Request('id')&& Request('type')&& Request('village')){ 
       $datare = Request('village');
       $id     = Request('id');
       $kongchansila = DB::table('transaction_co')->select('co_id')->groupBy('co_id')->where('id_co',$id)->whereIn('village', $datare)->get();
        foreach( $kongchansila as $key => $sila){

            DB::table('cos')->where('id', $sila->co_id)
            ->update([
                'payment_status' => 'yes',
            ]);
        }
     

       $dataupdatedata = DB::table('transaction_co')->where('id_co',$id)->whereIn('village', $datare)->update(array('payment_status' => 'yes'));
       $provinces = DB::table('appuser')->select('username')->where('id', '=', $id)->get();
       $village = count($datare);
       $photo = time() .'-' .$request->photo->getClientOriginalName();
       $request->photo->move('upload/post', $photo);
       $photo1 = time() .'-' .$request->photo1->getClientOriginalName();
       $request->photo1->move('upload/post', $photo1);

      $data_pay = DB::table('payment_settle')->insertGetId([
        'id_co'        => Request('id'),
        'co_names'     => $provinces['0']->username,
        'status'       => 'Pending',
        'total_collect'=> Request('total'),
        'payment_village'=> $village,
        'img1'       => $photo,
        'img2'       => $photo1,
        'date'    => Request('date'),
       ]);

       foreach(Request('total_village') as $key => $value){
       DB::table('payment_settle_item')->insert([
        'id_pay'        => $data_pay,
        'total'         => $value,
        'village'       => Request('village')[$key],
       ]);
        }
        $response = [
            'status' => true,
            'message' => 'Payment',
            'data' => $dataupdatedata
        ];
       }
       else{
        $response = [
            'status' => false,
            'message' => 'Payment false',
            'data' => null
        ];
       }
    }else{
        $co_name = TransactionModel::where('id_co',Request('id'))->get()->first();
        $week    = TransactionModel::where('id_co',Request('id'))
                 ->where(DB::raw("payment_status"), "=", 'no')
                 ->selectRaw("distinct(village) as village")
                 ->selectRaw("SUM(collects) as totalcollects")
                 ->groupBy('village')
                 ->get();
             if(!$co_name){
               $response = [
                  'status' => false,
                  'message' => 'wrong co id',
                  'data' => null
              ];
             }
             elseif($week != NULL){
                if($week == '[]'){
                    $response = [
                        'status' => false,
                        'message' => 'cos not have',
                        'data' => null
                    ];
                }
                else{
                    $response = [
                        'status' => true,
                        'message' => 'Today of village',
                        'data' =>  $week
                    ];
                }
             }else{
                  $response = [
                     'status' => false,
                     'message' => 'History false',
                     'data' => null
                 ];
             }
    }
     return response()->json($response, 200);
 });
Route::post('/map',function(Request $request){

    $data      = DB::table('appuser')->where('id',$request->id)->get()->first();
    if(empty($data)){
        $response  = [
            'status'    => false,
            'message'   => 'User not find',
            'village'   => null,
        ];
    }
    elseif($request->id && $request->village_id){
        $village =  DB::table('contacts')->select('contacts.*','sale_application.village_id')
        ->leftjoin('sale_application','sale_application.id','contacts.sale_id')
        ->where('sale_application.village_id',$request->village_id)
        ->get();
        $response  = [
            'status'    => true,
            'message'   => 'sale_application',
            'village'   => $village,
        ];
        return response()->json($response, 200);
    }
    elseif($data->province_id){
        $province  = explode(',',$data->province_id);
        $provinces = DB::table('provinces')->whereIn('id',$province)->get();
        foreach ($provinces as $key => $value) {
            $province_id[] = "$value->id";
        $village = DB::table('villages')->whereIn('province_id',$province_id)->get();
        }
        $response  = [
            'status'    => true,
            'message'   => 'User',
            // 'data'      => $data,
            // 'provinces' => $provinces,
            'village'   => $village,
        ];
    }
    else{
        $response  = [
            'status'    => false,
            'message'   => 'User not Province',
            'village'   => null,
        ];
    }
        return response()->json($response, 200);
});




//  Route::prefix('unit')->group(function(){
//     Route::get('/',[UnitController::class, 'index']);
//     Route::post('/store',[UnitController::class, 'store']);
//     Route::put('/{id}',[UnitController::class, 'update']);
//     Route::delete('/{id}',[UnitController::class, 'destroy']);

// });
// Route::prefix('category')->group(function(){
//     Route::get('/',[CategoryController::class, 'index']);
//     Route::post('/store',[CategoryController::class, 'store']);
//     Route::put('/{id}',[CategoryController::class, 'update']);
//     Route::delete('/{id}',[CategoryController::class, 'destroy']);

// });
// Route::prefix('product')->group(function(){
//     Route::get('/',[ProductController::class, 'index']);
//     Route::post('/store',[ProductController::class, 'store']);
//     Route::put('/{id}',[ProductController::class, 'update']);
//     Route::delete('/{id}',[ProductController::class, 'destroy']);

// });