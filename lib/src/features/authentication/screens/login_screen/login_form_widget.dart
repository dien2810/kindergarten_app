import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/authentication/screens/forget_password/forget_password_options/forget_password_modal_bottom_sheet.dart';
import 'package:kindergarten_app/src/features/authentication/screens/signup_screen/signup_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/login_controller.dart';
import 'login_screen.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
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
                  tLogin,
                  style: TextStyle(
                      color: tDarkBlue,
                      fontSize: 24,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: t15Size),
                TextFormField(
                  controller: controller.email,
                  decoration: InputDecoration(
                      hintStyle:
                        const TextStyle(fontSize: 16, fontFamily: "Outfit"),
                      prefixIcon: const Icon(Icons.person_outline_outlined),
                      labelText: tLoginUsername,
                      hintText: tLoginUsername,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(t40Size)
                      )
                  ),
                ),
                const SizedBox(height: t20Size),
                Obx(()=>TextFormField(
                    controller: controller.password,
                    obscureText: controller.obscureText.value,
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(
                            fontSize: 16, fontFamily: "Outfit"
                        ),
                        prefixIcon: const Icon(Icons.fingerprint_outlined),
                        labelText: tPassword,
                        hintText: tPassword,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(t40Size)
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            final obscureStatus = controller.obscureText.value;
                            controller.obscureText.value=!obscureStatus;
                          },
                          icon: const Icon(Icons.remove_red_eye_sharp),
                        )),
                  ),
                ),
                const SizedBox(height: t5Size),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ForgetPasswordModalBottomSheet.buildShowModalBottomSheet(context);
                      //Get.to(()=>const ForgetPasswordPhoneScreen());
                    },
                    child: const Text(
                        tForgotPassword,
                        style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff39647F)
                        )
                    ),
                  ),
                ),
                const SizedBox(height: t5Size),
                Obx(()=> Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RadioListTile<Role>(
                        contentPadding: const EdgeInsets.all(0.0),
                        title: const Text("Guardian"),
                        value: Role.guardian,
                        groupValue: controller.role.value,
                        tileColor: Colors.deepPurple.shade50,
                        onChanged: (val){
                          controller.role.value = val!;
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<Role>(
                        contentPadding: const EdgeInsets.all(0.0),
                        title: const Text("Teacher"),
                        value: Role.teacher,
                        groupValue: controller.role.value,
                        tileColor: Colors.deepPurple.shade50,
                        onChanged: (val){
                          controller.role.value = val!;
                        },
                      ),
                    ),
                  ],
                ),
                ),
                const SizedBox(height: t15Size),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
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
                          //Get.to(()=>const HomepageNews());
                          controller.login();
                        },
                        child: const Text(
                          tLogin,
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
                ),
                const SizedBox(height: t20Size),
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
                const SizedBox(height: t20Size),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: t10Size*20,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: tLightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(t40Size)
                          )
                      ),
                      onPressed: () {
                        Get.to(()=>const SignupScreen());
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
                ),
              ],
            ),
          ),
        ));
  }
}

