import 'package:dalil_project/core/screens/login/login_view.dart';
import 'package:dalil_project/core/screens/sign_up/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';

class SplashViewModel {
  static Widget buildFirstCharInDalilAnimation({
    required Widget widget,
    required bool hasAnimated,
  }) {
    return widget
        .animate(target: hasAnimated ? 1 : 0)
        .move(
          begin: Offset(10.w, 100.h),
          end: Offset(15.w, 20.h),
          curve: Curves.easeOutBack,
          duration: 900.ms,
        )
        .scale(
          delay: 2000.ms,
          begin: Offset(100.w / 100.w, 100.h / 100.h),
          end: Offset(50.w / 100.w, 50.h / 100.h),
          curve: Curves.easeOut,
          duration: 200.ms,
          alignment: Alignment(-0.1.h, 0.05.w),
        );
  }

  static Widget buildRestOfDalilAnimation({required Widget widget}) {
    return widget
        .animate(delay: 2000.ms)
        .fade(duration: 200.ms, curve: Curves.easeIn)
        .then()
        .move(
          begin: Offset(-4.w, 12.h),
          end: Offset(-4.w, 12.h),
          curve: Curves.easeOutBack,
          duration: 400.ms,
        );
  }

  static Widget buildArabicDalilAnimation({required Widget widget}) {
    return widget
        .animate(delay: 2000.ms)
        .move(begin: Offset(0, 100.h), curve: Curves.easeIn, duration: 400.ms);
  }

  static Widget buildSignUpButtonAnimation({required Widget widget}) {
    return widget
        .animate(delay: 2000.ms)
        .fade(duration: 200.ms, curve: Curves.easeIn)
        .then()
        .move(
          begin: Offset(0.w, 2.h),
          end: Offset(0.w, 2.h),
          curve: Curves.easeOutBack,
          duration: 400.ms,
        );
  }

  static Widget buildLogInButtonAnimation({required Widget widget}) {
    return widget
        .animate(delay: 2000.ms)
        .fade(duration: 200.ms, curve: Curves.easeIn)
        .then()
        .move(
          begin: Offset(0.w, 1.h),
          end: Offset(0.w, 2.h),
          curve: Curves.easeOutBack,
          duration: 400.ms,
        );
  }

  static onLoginButtonPressed(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => LoginView()));
  }

  static onSignUpButtonPressed(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const SignupView()));
  }
}
