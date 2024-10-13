import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';

import '../../../../common_widgets/authentication_background_widget/authentication_background_widget.dart';
import '../../../../common_widgets/logo_widgets/logo_login_page.dart';
import 'login_form_widget.dart';

enum Role{guardian,teacher}
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
                  LoginFormWidget(formKey: formKey)
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}




