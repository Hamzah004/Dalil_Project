import 'package:dalil_project/core/screens/passed_courses/passed_courses_view.dart';
import 'package:dalil_project/resources/strings_manager.dart';
import 'package:dalil_project/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SignupViewModel2 {
  static validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return AppStrings.passwordCannotBeEmpty;
    } else if (password.length < AppSize.s6) {
      return AppStrings.passwordMustBeAtLeast6Characters;
    }
    return null;
  }

  static validatePasswordConfirm(
    String? password,
    TextEditingController passwordController,
  ) {
    if (password == null || password.isEmpty) {
      return AppStrings.confirmPasswordCanNotBeEmpty;
    } else if (password != passwordController.text) {
      return AppStrings.passwordDoNotMatch;
    }
    return null;
  }

  static nextButtonOnPressed(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PassedCoursesView()),
    );
  }
}
