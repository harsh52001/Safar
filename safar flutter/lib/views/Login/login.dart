import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_project/Routes/app_pages.dart';
import 'package:safar_project/controllers/Login%20Controllers/loginController.dart';
import 'package:safar_project/helper/colors%20and%20style/sizedBox.dart';


final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                      tag: "login",
                      child: Image.asset("assets/images/car_pool.jpg")),
                  const Text(
                    "Login to continue",
                    style: TextStyle(fontSize: 20, fontFamily: "mon"),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        CupertinoIcons.person,
                        color: Colors.blue,
                      ),
                      hintText: "Username",
                      hintStyle: const TextStyle(
                          fontFamily: "mon", fontSize: 14, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  GetBuilder<LoginController>(builder: (_) {
                    return TextField(
                      controller: passwordController,
                      obscureText: !controller.showPassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          CupertinoIcons.lock,
                          color: Colors.blue,
                        ),
                        suffixIcon: InkWell(
                            onTap: () {
                              controller.showPassword =
                                  !controller.showPassword;
                              controller.update();
                            },
                            child: controller.showPassword
                                ? const Icon(
                                    CupertinoIcons.eye_slash,
                                    color: Colors.blue,
                                  )
                                : const Icon(
                                    CupertinoIcons.eye,
                                    color: Colors.blue,
                                  )),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            fontFamily: "mon",
                            fontSize: 14,
                            color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        isDense: true,
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      controller.login(usernameController.text, passwordController.text);
                     // Get.offAllNamed(AppRoute.dashboard);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "mon",
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  sizedboxh10w0,
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.registerScreen);
                        },
                        child: const Text("Don't have account? Sign Up")),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
