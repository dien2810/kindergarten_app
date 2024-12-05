import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

import '../../../../../common_widgets/authentication_background_widget/authentication_background_widget.dart';
import '../../../../../common_widgets/logo_widgets/logo_login_page.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/forgot_password_email_controller.dart';
import '../../login_screen/login_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(ForgotPasswordEmailController());
    return SafeArea(
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              const AuthenticationBackgroundWidget(),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(t20Size),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const LogoWidget(),
                      SizedBox(height: t40Size),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    tForgotPassword,
                                    style: TextStyle(
                                        color: tDarkBlue,
                                        fontSize: 24,
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: t15Size),
                                  TextFormField(
                                    controller: controller.emailOrPhone,
                                    decoration: InputDecoration(
                                        hintStyle: const TextStyle(fontSize: 16, fontFamily: "Outfit"),
                                        hintText: tEnterEmail,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(t40Size)
                                        )
                                    ),
                                  ),
                                  SizedBox(height: t5Size),
                                  Align(
                                    alignment: Alignment.center,
                                    child: TextButton(
                                        onPressed: (){
                                          Get.off(()=>const LoginScreen());
                                        },
                                        child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            tBackToSignIn,
                                            style: TextStyle(
                                                fontFamily: 'Mulish',
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF39647F)
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                  SizedBox(height: t20Size),
                                  SizedBox(
                                    width: double.infinity,
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
                                        onPressed: () {
                                          Get.to(()=>const OTPScreen());
                                        },
                                        child: const Text(
                                          tSendVerification,
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
                                  SizedBox(height: t20Size),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                        tDontHaveAccount,
                                        style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff39647F)
                                        )
                                    ),
                                  ),
                                  SizedBox(height: t20Size),
                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: SizedBox(
                                  //     width: t10Size*20,
                                  //     child: ElevatedButton(
                                  //       style: ElevatedButton.styleFrom(
                                  //           backgroundColor: tLightBlue,
                                  //           shape: RoundedRectangleBorder(
                                  //               borderRadius: BorderRadius.circular(t40Size)
                                  //           )
                                  //       ),
                                  //       onPressed: () {
                                  //         Get.off(()=>const SignupScreen());
                                  //       },
                                  //       child: const Text(
                                  //         tSignup,
                                  //         style: TextStyle(
                                  //             fontWeight: FontWeight.bold,
                                  //             fontSize: 20,
                                  //             fontFamily: "Outfit",
                                  //             color: tWhiteColor
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
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
