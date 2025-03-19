import 'package:dalil_project/core/screens/sign_up/sign_up_1/signup_veiw2.dart';
import 'package:dalil_project/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class SignUpViewModel {
  static bool isValidEmail(String value) {
    String pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool isValidName(String value) {
    String pattern = r'^[a-zA-Z]+ [a-zA-Z]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String? isValidArabicName(String? arabicName) {
    if (arabicName == null || arabicName.isEmpty) {
      return AppStrings.arabicNameCannotBeEmpty;
    }
    return null;
  }

  static String? isValidEnglishName(String? englishName) {
    if (englishName == null || englishName.isEmpty) {
      return AppStrings.englishNameCanNotByEmpty;
    } else if (!SignUpViewModel.isValidName(englishName)) {
      return AppStrings.pleaseEnterYourFirstAndLastName;
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return AppStrings.emailCannotByEmpty;
    } else if (!SignUpViewModel.isValidEmail(email)) {
      return AppStrings.enterAValidEmailAddress;
    }
    return null;
  }

  static List<String> getUniversities() {
    return ['University A', 'University B', 'University C'];
  }

  static universityDropDownValidator(String? value) {
    if (value == null) {
      return AppStrings.pleaseSelectAUniversity;
    }
    return null;
  }

  static facultyDropDownValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseSelectAFaculty;
    }
    return null;
  }

  static majorDropDownValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseSelectAMajor;
    }
    return null;
  }

  static getFaculities() {
    return ['Facility 1', 'Facility 2', 'Facility 3'];
  }

  static getMajors() {
    return ['Major 1', 'Major 2', 'Major 3'];
  }

  static nextButtonOnPressed(BuildContext context) {
    FocusManager.instance.primaryFocus!.unfocus();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SignupView2(),
    ));
  }
}
