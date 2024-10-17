import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/authentication/screens/forget_password/forget_password_phone/forget_password_phone_screen.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_mail/forget_password_mail_screen.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordModalBottomSheet{
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        builder: (context)=>Container(
            padding: const EdgeInsets.all(t10Size),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  tForgetPasswordTitle,
                  style: TextStyle(
                      color: tDarkBlue,
                      fontSize: 24,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  tForgetPasswordSubTitle,
                  style: TextStyle(fontSize: 16, fontFamily: "Outfit"),
                ),
                const SizedBox(height: 30.0),
                ForgetPasswordBtnWidget(
                  onTap: (){
                    Navigator.pop(context);
                    Get.to(()=>const ForgetPasswordMailScreen());
                  },
                  btnIcon: Icons.mail_outline_rounded,
                  title: tEmail,
                  subtitle: tResetViaEMail,
                ),
                const SizedBox(height: 20.0),
                ForgetPasswordBtnWidget(
                  onTap: (){
                    Navigator.pop(context);
                    Get.to(()=>const ForgetPasswordPhoneScreen());
                  },
                  btnIcon: Icons.mobile_friendly_rounded,
                  title: tPhoneNumber,
                  subtitle: tResetViaPhone,
                ),
              ],
            )
        )
    );
  }
}