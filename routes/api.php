<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\SearchItems;
use App\Http\Controllers\API\ActivityLogs;
use App\Http\Controllers\API\AuthControll;
use App\Http\Controllers\API\PriceMonitor;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\AdminController;
use App\Http\Controllers\API\BarangayController;
use App\Http\Controllers\API\PlaceBidController;
use App\Http\Controllers\API\SearchingController;


Route::post('Login',[AuthControll::class, 'Login']);
Route::post('CreateAccount', [AuthControll::class, 'CreateAccount']);
Route::get('BarangayData', [BarangayController::class, 'ListBarangay']);
// Searching Controller
Route::get('AllUsers',[SearchingController::class, 'AllUsers']);
Route::get('Logs/{id}', [ActivityLogs::class, 'Logs']);

Route::post('PlaceBid',[PlaceBidController::class, 'PlaceBid']);


// Search Item
Route::post('SearchItem',[SearchItems::class, 'SearchItem']);
Route::get('SearchItemResults/{id}',[SearchItems::class, 'SearchItemResults']);
Route::get('AllItems',[SearchItems::class, 'AllItems']);
Route::get('Details/{id}',[SearchItems::class, 'Details']);
Route::get('GetCompetetor/{id}/{user_id}',[SearchItems::class, 'GetCompetetor']);

// Bid Post
Route::post('BiddingPost',[SearchItems::class, 'BiddingPost']);

Route::get('CoprasPriceData/{id}',[PriceMonitor::class ,'index']);
Route::post('UpdatePrice',[PriceMonitor::class ,'register']);
Route::delete('removeprice/{id}',[PriceMonitor::class ,'remove']);


// Price Monitor
Route::get('AllProductsTotal/{id}',[PriceMonitor::class ,'AllProductsTotal']);

Route::get('PriceProduct',[PriceMonitor::class, 'PriceData']);


// Admin router
Route::middleware(['auth:sanctum', 'isAPIAdmin'])->group(function () {
    Route::get('/checking',function () {
        return response()->json([
            "status"        =>      200,
            "role"          =>      auth()->user()->role,
        ],200);
    });
    Route::get('registered',[AdminController::class, 'RegisteredAccount']);
    Route::get('nonregistered', [AdminController::class, 'NonRegistered']);
    Route::get('AccountInformation/{id}', [AdminController::class, 'AccountInformation']);
    Route::post('SendMessage', [AdminController::class,  'SendMessage']);
    Route::get('UpdatePrice', [AdminController::class,  'UpdatePrice']);
    Route::post('PostUpdatedPrice', [AdminController::class, 'PostUpdatedPrice']);
    Route::get('TotalCount', [AdminController::class,  'TotalCount']);
    Route::get('ReportIssue',[AdminController::class, 'ReportIssue']); 
    Route::post('CreateProduct', [AdminController::class, 'CreateProduct']);
    Route::get('GetProduct',[AdminController::class, 'GetProduct']); 
    Route::put('UpdateProduct',[AdminController::class, 'UpdateProduct']); 
    Route::delete('DeleteItem/{id}',[AdminController::class, 'DeleteItem']); 
    
        
});


// User Route
Route::middleware(['auth:sanctum', 'isAPIUser'])->group(function () {
    Route::get('/check',function () {
        return response()->json([
            "status"        =>      200,
            "role"          =>      auth()->user()->role,
        ],200);
    });
    Route::post('AddProducts', [UserController::class,  'AddProducts']);
    Route::get('ProductDetails/{id}', [UserController::class,  'ProductDetails']);
    Route::delete('RemoveProducts/{id}', [UserController::class,  'RemoveProducts']);
    Route::get('GetProductUpdate/{id}', [UserController::class, 'GetProductUpdate']);
    Route::get('ProductInformation/{id}', [UserController::class, 'ProductInformation']);
    Route::put('UpdateProductData/{$id}',[UserController::class, 'UpdateProductData']);
    Route::get('ProductDetailsInformation/{id}', [UserController::class,  'ProductDetailsInformation']);
    Route::get('TransactionHistory/{id}', [UserController::class,  'TransactionHistory']);
    Route::get('Notification/{id}', [UserController::class,  'Notification']);
    Route::post('CloseBid',[UserController::class, 'CloseBid']);
    Route::get('AverageKilo/{id}',[UserController::class, 'AverageKilo']);
    Route::get('ProductTransaction/{id}',[UserController::class, 'ProductTransaction']);
});


Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('logout',[AuthControll::class, 'Logout']);
});

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
