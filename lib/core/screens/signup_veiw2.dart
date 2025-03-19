import 'dart:io';

import 'package:dalil_project/core/screens/courses_passed_view.dart';
import 'package:dalil_project/resources/assets_manager.dart';
import 'package:dalil_project/resources/colors_manager.dart';
import 'package:dalil_project/resources/fonts_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../resources/strings_manager.dart';

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
          SnackBar(content: Text('Permission to access gallery is denied!')),
        );
      }
    }
  }

  // if permissions didn't work use this:
  /*
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 30.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.primaryColor),
                      color: ColorManager.profileBackground,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child:
                        _image == null
                            ? Icon(
                              Icons.person_rounded,
                              size: 40.sp,
                              color: ColorManager.primaryColor,
                            )
                            : ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.file(_image!, fit: BoxFit.cover),
                            ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 9.h, left: 3.62.w, right: 3.62.w),
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
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h, left: 3.62.w, right: 3.62.w),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  style: GoogleFonts.faustina(
                    fontSize: 18.sp,
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
                      fontSize: 16.sp,
                      fontWeight: FontWeightManager.semiBold,
                      letterSpacing: 0.32.sp,
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
                    if (value == null || value.isEmpty) {
                      return "Confirm password cannot be empty";
                    } else if (value != _passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 23.h),
                child: SizedBox(
                  height: 6.h,
                  width: 60.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoursesPassedView(),
                        ),
                      );
                    },
                    child: Text(
                      AppStrings.next,
                      style: GoogleFonts.faustina(
                        color: ColorManager.white,
                        fontSize: 20.sp,
                        letterSpacing: 7.sp,
                        fontWeight: FontWeightManager.semiBold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
}
