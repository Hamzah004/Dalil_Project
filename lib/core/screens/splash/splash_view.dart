import 'package:dalil_project/core/screens/splash/splash_view_model.dart';
import 'package:dalil_project/resources/colors_manager.dart';
import 'package:dalil_project/resources/fonts_manager.dart';
import 'package:dalil_project/resources/strings_manager.dart';
import 'package:dalil_project/resources/style_manager.dart';
import 'package:dalil_project/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../login/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool hasAnimated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        hasAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildEnglishTitle(),
            _buildArabicTitle(),
            _buildSignUButton(),
            _buildLogInButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEnglishTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SplashViewModel.buildFirstCharInDalilAnimation(
          hasAnimated: hasAnimated,
          widget: Text(
            AppStrings.firstCharInDalil,
            style: getRegularStyle(
              color: ColorManager.primaryColor,
              fontSize: FontSize.s60,
              fontFamily: FontConstants.englishFontFamily,
            ),
          ),
        ),

        SizedBox(height: AppSize.hs20),

        SplashViewModel.buildRestOfDalilAnimation(
          widget: Text(
            AppStrings.restOfDalil,
            style: getRegularStyle(
              color: ColorManager.primaryColor,
              fontFamily: FontConstants.englishFontFamily,
              fontSize: FontSize.s43,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildArabicTitle() {
    return SplashViewModel.buildArabicDalilAnimation(
      widget: Text(
        AppStrings.arabicDalil,
        style: getRegularStyle(
          color: ColorManager.primaryColor,
          fontSize: FontSize.s37,
          fontFamily: FontConstants.arabicFontFamily,
        ),
      ),
    );
  }

  Widget _buildSignUButton() {
    return Padding(
      padding: EdgeInsets.only(top: AppPadding.p120),
      child: SplashViewModel.buildSignUpButtonAnimation(
        widget: SizedBox(
          height: AppSize.hs8,
          width: AppSize.ws90,
          child: ElevatedButton(
            onPressed: () {
              SplashViewModel.onSignUpButtonPressed(context);
            },
            child: Text(
              AppStrings.singUp,
              style: GoogleFonts.faustina(
                color: ColorManager.white,
                fontSize: FontSize.s21,
                letterSpacing: 1.w,
                fontWeight: FontWeightManager.semiBold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogInButton() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => LoginView()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          width: 60.w,
          height: 5.h,
          child: SplashViewModel.buildLogInButtonAnimation(
            widget: Center(
              child: Text(
                AppStrings.logInWithAccount,
                style: GoogleFonts.faustina(
                  color: ColorManager.primaryColor,
                  fontSize: FontSize.s16,
                  letterSpacing: 3.sp,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
