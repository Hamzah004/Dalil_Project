import 'package:dalil_project/core/screens/sign_up/sign_up_1/signup_view.dart';
import 'package:dalil_project/resources/strings_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginViewModel {
  static bool isValidEmail(String value) {
    String pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emailCannotByEmpty;
    } else if (!LoginViewModel.isValidEmail(value)) {
      return AppStrings.enterAValidEmailAddress;
    }
    return null;
  }

  static TapGestureRecognizer buildTapGestureRecognizer(BuildContext context) {
    return TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const SignupView()));
      };
  }

  static void loginButtonOnPressed() {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
