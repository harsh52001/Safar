import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TakeRideController extends GetxController {
  Map<String,dynamic> mapSting = {};

  Future<void> createRide()async{
    mapSting.addAll({"datetime":"2024-05-06","driver":"keshav", "vehicleId":"Rj14CB6556",
    "passengers":[
        "harsh"
    ]});
    var res =  await http.post(Uri.parse("http://192.168.7.197:3000/api/rides/search"),body: json.encode(mapSting));
  if(res.statusCode == 200){
    Get.snackbar("Success", "Ride created successsfully",snackPosition: SnackPosition.BOTTOM);
  }
  }
}
