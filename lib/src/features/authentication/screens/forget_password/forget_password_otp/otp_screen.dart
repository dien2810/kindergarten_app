import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';

import '../../../../../common_widgets/authentication_background_widget/authentication_background_widget.dart';
import '../../../../../common_widgets/logo_widgets/logo_login_page.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp;
    final otpController = Get.put(OTPController());
    return SafeArea(
      child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              const AuthenticationBackgroundWidget(),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(t5Size),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const LogoWidget(),
                      SizedBox(height: t5Size),
                      Container(
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
                            borderRadius: BorderRadius.circular(t40Size),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  tEnterVerificationCode,
                                  style: TextStyle(
                                      color: tDarkBlue,
                                      fontSize: 24,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: t30Size),
                              OtpTextField(
                                  numberOfFields: 6,
                                  filled: true,
                                  fillColor: const Color(0xFFCAF0F8),
                                  borderRadius: BorderRadius.circular(40),
                                  onSubmit: (code){
                                    otp = code;
                                    otpController.verifyOTP(otp);
                                  }
                              ),
                              SizedBox(height: t10Size),
                              TextButton(
                                  onPressed: (){},
                                  child: Text.rich(
                                      TextSpan(
                                          children: [
                                            TextSpan(
                                                text: tDidntReceiveCode,
                                                style: Theme.of(context).textTheme.bodyLarge
                                            ),
                                            const TextSpan(
                                                text: tResend,
                                                style: TextStyle(
                                                    color: Colors.blue
                                                )
                                            )
                                          ]
                                      )
                                  )
                              ),
                              SizedBox(height: t30Size),
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
                                    onPressed: () {
                                      otpController.verifyOTP(otp);
                                      //Get.to(()=>const ChangePasswordScreen());
                                    },
                                    child: const Text(
                                      tSend,
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
                              const Text(
                                  tDontHaveAccount,
                                  style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff39647F)
                                  )
                              ),
                              SizedBox(height: t20Size),
                              // SizedBox(
                              //   width: t10Size*20,
                              //   child: ElevatedButton(
                              //     style: ElevatedButton.styleFrom(
                              //         backgroundColor: tLightBlue,
                              //         shape: RoundedRectangleBorder(
                              //             borderRadius: BorderRadius.circular(t40Size)
                              //         )
                              //     ),
                              //     onPressed: () {
                              //       Get.off(()=>const SignupScreen());
                              //     },
                              //     child: const Text(
                              //       tSignup,
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 20,
                              //           fontFamily: "Outfit",
                              //           color: tWhiteColor
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        )
                      )
                    ]
                  )
                ),
              )
            ],
          )
      ),
    );
  }
}
