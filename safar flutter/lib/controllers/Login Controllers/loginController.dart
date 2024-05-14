import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import 'package:safar_project/Routes/app_pages.dart';class LoginController extends GetxController{
  bool showPassword = false;

 Future<void> login(String username, String password) async {
    try {
      
      // Make API request to login
      var response = await http.post(
        Uri.parse('http://192.168.7.197:3000/api/users/login'),
        body: jsonEncode({
            'email': username,
            'password': password,

          }),
          headers: {'Content-Type': 'application/json'}
      );

      print(username);
      print(password);
      print(response.statusCode);

      // Check if login was successful (you may need to adjust this based on your API response)
      if (response.statusCode == 200) {
        // Navigate to the dashboard screen
        Get.offAllNamed(AppRoute.dashboard);
      } else {
        // Show error message
        Get.snackbar(
          'Login Failed',
          'Invalid username or password. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
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

