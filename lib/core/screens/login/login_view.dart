import 'package:dalil_project/core/screens/login/login_view_model.dart';
import 'package:dalil_project/core/widgets/custom_divider.dart';
import 'package:dalil_project/resources/assets_manager.dart';
import 'package:dalil_project/resources/colors_manager.dart';
import 'package:dalil_project/resources/fonts_manager.dart';
import 'package:dalil_project/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(23.5.h),
        child: _buildAppBar(),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildWelcomeText(),

              _buildSignInToYourAccountText(),

              CustomDivider(),

              _buildEmailTextField(),

              _buildPasswordTextField(),

              _buildForgotPasswordButton(),

              _buildLoginButton(),

              _buildDoNotHaveAccountButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFFDC47E),
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(ImageAssets.appBarImage, fit: BoxFit.cover),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Row(
                    children: [
                      Text(
                        'Dalil',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeightManager.regular,
                          color: ColorManager.white,
                          fontFamily: 'MaShanZheng',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7.h),
                        child: Text(
                          'دليل',
                          style: TextStyle(
                            fontSize: 34.5.sp,
                            color: ColorManager.white,
                            fontFamily: FontConstants.arabicFontFamily,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Padding(
      padding: EdgeInsets.only(top: 6.h),
      child: Text(
        AppStrings.welcome,
        style: GoogleFonts.faustina(
          fontSize: 27.sp,
          fontWeight: FontWeightManager.medium,
          letterSpacing: 0.54.sp,
        ),
      ),
    );
  }

  Widget _buildSignInToYourAccountText() {
    return Text(
      AppStrings.signIntoYourAccount,
      style: GoogleFonts.faustina(
        fontSize: 21.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.32.sp,
        color: ColorManager.mediumGray,
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 5.h, left: 3.62.w, right: 3.62.w),
      child: TextFormField(
        key: _formKey,
        style: GoogleFonts.faustina(
          fontSize: 18.sp,
          color: ColorManager.mediumGray,
        ),
        autocorrect: true,
        autofocus: false,
        controller: _emailController,
        cursorHeight: 25,
        cursorColor: ColorManager.mediumGray,
        focusNode: _emailFocusNode,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: AppStrings.email,
          labelStyle: GoogleFonts.faustina(
            fontSize: 16.sp,
            fontWeight: FontWeightManager.semiBold,
            letterSpacing: 0.32.sp,
            color: ColorManager.mediumGray,
          ),
          suffixIcon: Icon(Icons.email_outlined),
          suffixIconColor: ColorManager.mediumGray,
        ),
        validator: LoginViewModel.emailValidator,
        autovalidateMode: AutovalidateMode.onUnfocus,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h, left: 3.62.w, right: 3.62.w),
      child: TextFormField(
        keyboardType: TextInputType.text,
        enableSuggestions: true,
        style: GoogleFonts.faustina(
          fontSize: 18.sp,
          color: ColorManager.mediumGray,
        ),
        autocorrect: false,
        obscureText: !_isPasswordVisible,
        controller: _passwordController,
        cursorHeight: 25,
        cursorColor: ColorManager.mediumGray,
        decoration: InputDecoration(
          labelText: AppStrings.password,
          labelStyle: GoogleFonts.faustina(
            fontSize: 16.sp,
            fontWeight: FontWeightManager.semiBold,
            letterSpacing: 0.32.sp,
            color: ColorManager.mediumGray,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: onPasswordVisibilityPressed,
          ),
          suffixIconColor: ColorManager.mediumGray,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Password cannot be empty";
          } else if (value.length < 6) {
            return "Password must be at least 6 characters";
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUnfocus,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: EdgeInsets.only(top: 6.h),
      child: SizedBox(
        height: 6.h,
        width: 60.w,
        child: ElevatedButton(
          onPressed: LoginViewModel.loginButtonOnPressed,
          child: Text(
            AppStrings.login,
            style: GoogleFonts.faustina(
              color: ColorManager.white,
              fontSize: 20.sp,
              letterSpacing: 7.sp,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Padding(
      padding: EdgeInsets.only(left: 65.w),
      child: Text(
        AppStrings.forgotPassword,
        style: GoogleFonts.faustina(
          fontSize: 16.sp,
          fontWeight: FontWeightManager.semiBold,
          letterSpacing: 0.28.sp,
          color: ColorManager.primaryColor,
        ),
      ),
    );
  }

  Widget _buildDoNotHaveAccountButton() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h),
      child: RichText(
        text: TextSpan(
          text: AppStrings.donotHaveAnAccount,
          style: GoogleFonts.faustina(
            color: ColorManager.mediumGray,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.28.sp,
          ),
          children: <TextSpan>[
            TextSpan(
              text: AppStrings.signUp,
              style: GoogleFonts.faustina(
                color: ColorManager.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.28.sp,
                decoration: TextDecoration.underline,
              ),
              recognizer: LoginViewModel.buildTapGestureRecognizer(context),
            ),
          ],
        ),
      ),
    );
  }

  void onPasswordVisibilityPressed() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
}
