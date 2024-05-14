import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:safar_project/controllers/Ride_screens_controllers/giveRideController.dart';
import 'package:safar_project/helper/colors%20and%20style/sizedBox.dart';

class GiveRideScreen extends StatelessWidget {
   GiveRideScreen({super.key});

  final controller = Get.put(TakeRideController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text(
          "Create Ride",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: const Offset(4, 4))
                    ],
                    image: const DecorationImage(
                        image: AssetImage("assets/images/background.jpg"),
                        fit: BoxFit.cover)),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 7),
                margin: const EdgeInsets.all(7),
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create a ride",
                      style: TextStyle(
                        fontFamily: "mon",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Share a ride with\npeople Save money",
                      style: TextStyle(
                          fontFamily: "mon",
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Colors.grey),
                    ),
                    sizedboxh5w0
                  ],
                ),
              ),
              sizedboxh10w0,
              const Text(
                "Select Starting location",
                style: TextStyle(
                    fontFamily: "mon",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              sizedboxh5w0,
              TextField(
                onChanged: (value) {
                  controller.mapSting['origin'] = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.grey)),
                  isDense: true,
                  hintText: "Enter Starting Location",
                ),
              ),
              sizedboxh10w0,
              const Text(
                "Select End location",
                style: TextStyle(
                    fontFamily: "mon",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              sizedboxh5w0,
              TextField(
                onChanged: (value) {
                  controller.mapSting['destination'] = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.grey)),
                  isDense: true,
                  hintText: "Enter End Location",
                ),
              ),          
                  sizedboxh10w0,
              const Text(
                "Select Capacity",
                style: TextStyle(
                    fontFamily: "mon",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              sizedboxh5w0,
              TextField(
                onChanged: (value) {
                  controller.mapSting['availableCapacity`'] = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.grey)),
                  isDense: true,
                  hintText: "Enter capacity ",
                ),
              ),    
             
              ElevatedButton(onPressed: () {
                controller.createRide();
              }, child: const Text("Create Ride"))
            ],
          ),
        ),
      ),
    );
  }
}
