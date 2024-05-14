import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_project/Routes/app_pages.dart';

class RegisterController extends GetxController {
  List<String> docTypes = [
    "Aadhar Card",
    "PAN Card",
    "Voter-Id Card",
    "Driving Licance"
  ];  
  List<String> veh = [
    "Car",
    "Bike",
    "Camper",
  ];

  List<String> vehicleType = ["Two Wheeler", "Four Wheeler"];

  String docTypeChoosed = "";
  RxInt index = 0.obs;
  bool isUserRegisterDone = false;
  bool isVehicleRegisterDone = false;

  updateIndex() {
    index.value += 1;
    update();
  }

  updaetUserBool(bool res) {
    isUserRegisterDone = res;
    update();
  }

  updaetVehicleBool(bool res) {
    isVehicleRegisterDone = res;
    update();
  }
  Future<void> register(String username, String password,String phoneno,String Documentid) async {
    try {
      
      // Make API request to login
      var response = await http.post(
        Uri.parse('http://192.168.218.197:3000/api/users/register'),
        body: jsonEncode({
            'email': username,
            'password': password,
            "adharCardNumber":Documentid,
            "phoneNumber":phoneno

          }),
          headers: {'Content-Type': 'application/json'}
      );

      print(username);
      print(password);
      print(response.statusCode);

      // Check if login was successful (you may need to adjust this based on your API response)
      if (response.statusCode == 200) {
        // Navigate to the dashboard screen
       // Get.offAllNamed(AppRoute.dashboard);
        Get.snackbar(
          'User Registration Succesfully',
          '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        // Show error message
        // Get.snackbar(
        //   'User Registration Failed',
        //   'Please try again.',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.red,
        //   colorText: Colors.white,
        // );
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

