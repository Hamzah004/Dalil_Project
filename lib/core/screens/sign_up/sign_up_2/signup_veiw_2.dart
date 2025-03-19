import 'dart:io';
import 'package:dalil_project/core/screens/sign_up/sign_up_2/signup_view_model_2.dart';
import 'package:dalil_project/resources/assets_manager.dart';
import 'package:dalil_project/resources/colors_manager.dart';
import 'package:dalil_project/resources/fonts_manager.dart';
import 'package:dalil_project/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/strings_manager.dart';

class SignupView2 extends StatefulWidget {
  const SignupView2({super.key});

  @override
  State<SignupView2> createState() => _SignupView2State();
}

class _SignupView2State extends State<SignupView2> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildProfileImage(),

              _buildPasswordTextField(),

              _buildPasswordConfirmTextField(),

              _buildNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(23.5.h),
      child: SafeArea(
        child: AppBar(
          backgroundColor: ColorManager.appBarBackgroundColor,
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
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.s2.h),
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          width: AppSize.s30.w,
          height: AppSize.s14.h,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.primaryColor),
            color: ColorManager.profileBackground,
            borderRadius: BorderRadius.circular(60),
          ),
          child:
              _image == null
                  ? Icon(
                    Icons.person_rounded,
                    size: AppSize.s40.sp,
                    color: ColorManager.primaryColor,
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.s60),
                    child: Image.file(_image!, fit: BoxFit.cover),
                  ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Padding(
      padding: EdgeInsets.only(
        top: AppSize.s9.h,
        left: AppSize.s3_62.w,
        right: AppSize.s3_62.w,
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        enableSuggestions: true,
        style: GoogleFonts.faustina(
          fontSize: AppSize.s18.sp,
          color: ColorManager.mediumGray,
        ),
        autocorrect: false,
        obscureText: !_isPasswordVisible,
        controller: _passwordController,
        cursorHeight: AppSize.s25,
        cursorColor: ColorManager.mediumGray,
        decoration: InputDecoration(
          labelText: AppStrings.password,
          labelStyle: GoogleFonts.faustina(
            fontSize: AppSize.s16.sp,
            fontWeight: FontWeightManager.semiBold,
            letterSpacing: AppSize.s0_32.sp,
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
          return SignupViewModel2.validatePassword(value);
        },
        autovalidateMode: AutovalidateMode.onUnfocus,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _buildPasswordConfirmTextField() {
    return Padding(
      padding: EdgeInsets.only(
        top: AppSize.s5.h,
        left: AppSize.s3_62.w,
        right: AppSize.s3_62.w,
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        enableSuggestions: true,
        style: GoogleFonts.faustina(
          fontSize: FontSize.s18.sp,
          color: ColorManager.mediumGray,
        ),
        autocorrect: false,
        obscureText: !_isConfirmPasswordVisible,
        controller: _confirmPasswordController,
        cursorHeight: 25,
        cursorColor: ColorManager.mediumGray,
        decoration: InputDecoration(
          labelText: AppStrings.password,
          labelStyle: GoogleFonts.faustina(
            fontSize: FontSize.s16.sp,
            fontWeight: FontWeightManager.semiBold,
            letterSpacing: AppSize.s0_32.sp,
            color: ColorManager.mediumGray,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isConfirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: onPasswordConfirmVisibilityPressed,
          ),
          suffixIconColor: ColorManager.mediumGray,
        ),
        validator: (value) {
          return SignupViewModel2.validatePasswordConfirm(
            value,
            _passwordController,
          );
        },
        autovalidateMode: AutovalidateMode.onUnfocus,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.s12.h),
      child: SizedBox(
        height: AppSize.s6.h,
        width: AppSize.s60.w,
        child: ElevatedButton(
          onPressed: (){
            SignupViewModel2.nextButtonOnPressed(context);
          },
          child: Text(
            AppStrings.next,
            style: GoogleFonts.faustina(
              color: ColorManager.white,
              fontSize: FontSize.s20.sp,
              letterSpacing: AppSize.s7.sp,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
        ),
      ),
    );
  }

  void onPasswordVisibilityPressed() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void onPasswordConfirmVisibilityPressed() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  Future<void> _pickImage() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } else {
      // Check if the widget(the screen) is still mounted before showing the SnackBar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppStrings.persmissionToAccessGalleryIsDenied),
          ),
        );
      }
    }
  }
}
