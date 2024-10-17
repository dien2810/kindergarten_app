import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/authentication/controllers/signup_controller.dart';

import '../../../../common_widgets/authentication_background_widget/authentication_background_widget.dart';
import '../../../../common_widgets/logo_widgets/logo_login_page.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../login_screen/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(SignupController());
    return SafeArea(
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              const AuthenticationBackgroundWidget(),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(t5Size),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const LogoWidget(),
                      const SizedBox(height: t5Size),
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
                                  tSignup,
                                  style: TextStyle(
                                      color: tDarkBlue,
                                      fontSize: 24,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: t15Size),
                                TextFormField(
                                  controller: controller.fullname,
                                  decoration: InputDecoration(
                                      hintStyle:
                                      const TextStyle(fontSize: 16, fontFamily: "Outfit"),
                                      prefixIcon: const Icon(Icons.person_outline_outlined),
                                      labelText: tFullname,
                                      hintText: tFullname,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(t40Size)
                                      )
                                  ),
                                ),
                                const SizedBox(height: t20Size),
                                TextFormField(
                                  controller: controller.email,
                                  decoration: InputDecoration(
                                      hintStyle: const TextStyle(
                                          fontSize: 16, fontFamily: "Outfit"
                                      ),
                                      prefixIcon: const Icon(Icons.mail_outline_rounded),
                                      labelText: tSignupUsername,
                                      hintText: tSignupUsername,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(t40Size)
                                      )
                                  ),
                                ),
                                const SizedBox(height: t20Size),
                                TextFormField(
                                  controller: controller.phone,
                                  decoration: InputDecoration(
                                      hintStyle: const TextStyle(
                                          fontSize: 16, fontFamily: "Outfit"
                                      ),
                                      prefixIcon: const Icon(Icons.phone_android_outlined),
                                      labelText: tPhoneNumber,
                                      hintText: tPhoneNumber,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(t40Size)
                                      )
                                  ),
                                ),
                                const SizedBox(height: t20Size),
                                TextFormField(
                                  controller: controller.password,
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
                                      suffixIcon: const Icon(Icons.remove_red_eye_sharp)
                                  ),
                                ),
                                const SizedBox(height: t30Size),
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
                                          //Get.to(()=>const Dashboard());
                                          if (formKey.currentState!.validate()){
                                            SignupController.instance.registerUser(
                                                controller.email.text.trim(),
                                                controller.password.text.trim(),
                                                controller.role.value
                                            );
                                          }
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
                                ),
                                const SizedBox(height: t20Size),
                                Align(
                                  alignment: Alignment.center,
                                  child: TextButton(
                                      onPressed: (){
                                        Get.off(()=>const LoginScreen());
                                      },
                                      child: Text.rich(
                                          TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: tAlreadyHaveAcc,
                                                    style: Theme.of(context).textTheme.bodyLarge
                                                ),
                                                const TextSpan(
                                                    text: ' $tLogin',
                                                    style: TextStyle(
                                                        color: Colors.blue
                                                    )
                                                )
                                              ]
                                          )
                                      )
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
        )
    );
  }
}
