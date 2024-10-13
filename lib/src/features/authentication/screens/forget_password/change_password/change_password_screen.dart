import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/authentication/controllers/change_password_controller.dart';

import '../../../../../common_widgets/authentication_background_widget/authentication_background_widget.dart';
import '../../../../../common_widgets/logo_widgets/logo_login_page.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../signup_screen/signup_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(ChangePasswordController());
    return SafeArea(
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              const AuthenticationBackgroundWidget(),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(t20Size),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const LogoWidget(),
                      const SizedBox(height: t40Size),
                      Form(
                          key: formKey,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [const Color(0xFFBBE4FF).withOpacity(0.4), const Color(0xFFAB85FF)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(t40Size),
                            ),
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.white.withOpacity(0.4), const Color(0xFFDADFF6)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),                           // Màu nền của container bên trong
                                borderRadius: BorderRadius.circular(t40Size), // Bo tròn tương ứng
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      tEnterNewPassword,
                                      style: TextStyle(
                                          color: tDarkBlue,
                                          fontSize: 24,
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: t15Size),
                                  TextFormField(
                                    controller: controller.password,
                                    decoration: InputDecoration(
                                        hintStyle: const TextStyle(fontSize: 16, fontFamily: "Outfit"),
                                        hintText: tAtLeast8Digits,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(t40Size)
                                        )
                                    ),
                                  ),
                                  const SizedBox(height: t10Size),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      tConfirmPassword,
                                      style: TextStyle(
                                          color: tDarkBlue,
                                          fontSize: 24,
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: t15Size),
                                  TextFormField(
                                    controller: controller.confirmPassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintStyle: const TextStyle(fontSize: 16, fontFamily: "Outfit"),
                                        hintText: tConfirmPassword,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(t40Size)
                                        )
                                    ),
                                  ),
                                  const SizedBox(height: t20Size),
                                  SizedBox(
                                    width: t10Size*20,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [Color(0xFF03045E), Color(0xFF0608C4)],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.circular(t50Size),
                                      ),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          tConfirm,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              fontFamily: "Outfit",
                                              color: tWhiteColor
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: t20Size),
                                  const Text(
                                    tDontHaveAccount,
                                    style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff39647F)
                                    )
                                  ),
                                  const SizedBox(height: t20Size),
                                  SizedBox(
                                    width: t10Size*20,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: tLightBlue,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(t40Size)
                                          )
                                      ),
                                      onPressed: () {
                                        Get.off(()=>const SignupScreen());
                                      },
                                      child: const Text(
                                        tSignup,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: "Outfit",
                                            color: tWhiteColor
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
