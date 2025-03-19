import 'package:dalil_project/resources/assets_manager.dart';
import 'package:dalil_project/resources/colors_manager.dart';
import 'package:dalil_project/resources/fonts_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupView();
}

class _SignupView extends State<SignupView> {

  final TextEditingController _arabicNameController = TextEditingController();
  final TextEditingController _englishNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  String? _selectedUniversity;
  String? _selectedFacility;
  String? _selectedMajor;

  bool _isUniversitySelected = false;
  bool _isFacilitySelected = false;

  // Data for drop-downs (University, Facility, and Major)
  List<String> universities = ['University A', 'University B', 'University C'];
  List<String> facilities = ['Facility 1', 'Facility 2', 'Facility 3'];
  List<String> majors = ['Major 1', 'Major 2', 'Major 3'];

  // for email validation
  bool isValidEmail(String value) {
    String pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  // Regular expression for name validation
  bool isValidName(String value) {
    String pattern = r'^[a-zA-Z]+ [a-zA-Z]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(23.5.h),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Text(
                  "Create Your Account",
                  style: GoogleFonts.faustina(
                    fontSize: 21.sp,
                    fontWeight: FontWeightManager.medium,
                    letterSpacing: 0.54.sp,
                    color: ColorManager.mediumGray,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Divider(
                  color: Colors.black,
                  thickness: 0.8,
                  indent: 4.w,
                  endIndent: 4.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h, left: 3.62.w, right: 3.62.w),
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  key: _formKey,
                  style: GoogleFonts.faustina(
                    fontSize:16.sp,
                    color: ColorManager.mediumGray,
                  ),
                  autocorrect: true,
                  autofocus: false,
                  controller: _arabicNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Arabic Name cannot be empty";
                    }
                    return null;
                  },
                  cursorHeight: 25,
                  cursorColor: ColorManager.mediumGray,
                  focusNode: _emailFocusNode,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorManager.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.mediumGray),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),  
                    labelText: 'Arabic Name*',
                    labelStyle: GoogleFonts.faustina(
                      fontSize: 16.sp,
                      fontWeight: FontWeightManager.semiBold,
                      letterSpacing: 0.32.sp,
                      color: ColorManager.mediumGray,
                    ),
                    isDense: true,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                ),
              ),
              // Password Field
              Padding(
                padding: EdgeInsets.only(top: 3.h, left: 3.62.w, right: 3.62.w),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  controller: _englishNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "English Name cannot be empty";
                    } else if (!isValidName(value)) {
                      return "Please enter your first and last name";
                    }
                    return null;
                  },
                  style: GoogleFonts.faustina(
                    fontSize:16.sp,
                    color: ColorManager.mediumGray,
                  ),
                  autocorrect: false,
                  cursorHeight: 25,
                  cursorColor: ColorManager.mediumGray,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorManager.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.mediumGray),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),
                    labelText: 'English Name*',
                    labelStyle: GoogleFonts.faustina(
                      fontSize: 16.sp,
                      fontWeight: FontWeightManager.semiBold,
                      letterSpacing: 0.32.sp,
                      color: ColorManager.mediumGray,
                    ),
                    isDense: true,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h, left: 3.62.w, right: 3.62.w),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  controller: _emailController,
                      validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email cannot be empty";
                    } else if (!isValidEmail(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                  style: GoogleFonts.faustina(
                    fontSize: 16.sp,
                    color: ColorManager.mediumGray,
                  ),
                  autocorrect: false,
                  cursorHeight: 25,
                  cursorColor: ColorManager.mediumGray,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorManager.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.mediumGray),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),
                    labelText: 'Email*',
                    labelStyle: GoogleFonts.faustina(
                      fontSize: 16.sp,
                      fontWeight: FontWeightManager.semiBold,
                      letterSpacing: 0.32.sp,
                      color: ColorManager.mediumGray,
                    ),
                    isDense: true,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h, left: 3.62.w, right: 3.62.w),
                child: DropdownButtonFormField(
                  value: _selectedUniversity,
                  items:
                      universities
                          .map(
                            (university) => DropdownMenuItem<String>(
                              value: university,
                              child: Text(
                                university,
                                style: GoogleFonts.faustina(
                                  fontSize: 16.sp,
                                  color: ColorManager.mediumGray,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedUniversity = value;
                      _isUniversitySelected = value != null;
                      _selectedFacility = null;
                      _isFacilitySelected = false;
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorManager.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.mediumGray),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),
                    labelText: 'University*',
                    labelStyle: GoogleFonts.faustina(
                      fontSize: 16.sp,
                      fontWeight: FontWeightManager.semiBold,
                      letterSpacing: 0.32.sp,
                      color: ColorManager.mediumGray,
                    ),
                    isDense: true,
                  ),
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  validator: (value) {
              if (value == null) {
              return "Please select a university";
              }
              return null;
              },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h, left: 3.62.w, right: 3.62.w),
                child: DropdownButtonFormField<String>(
                  value: _selectedFacility,
                  items:
                      _isUniversitySelected
                          ? facilities
                              .map(
                                (facility) => DropdownMenuItem<String>(
                                  value: facility,
                                  child: Text(
                                    facility,
                                    style: GoogleFonts.faustina(
                                      fontSize: 16.sp,
                                      color: ColorManager.mediumGray,
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                          : [],
                  onChanged:
                      _isUniversitySelected
                          ? (value) {
                            setState(() {
                              _selectedFacility = value;
                              _isFacilitySelected = value != null;
                              _selectedMajor = null;
                            });
                          }
                          : null,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorManager.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.mediumGray),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),
                    labelText: 'Facility*',
                    labelStyle: GoogleFonts.faustina(
                      fontSize: 16.sp,
                      fontWeight: FontWeightManager.semiBold,
                      letterSpacing: 0.32.sp,
                      color: ColorManager.mediumGray,
                    ),
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a facility';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUnfocus,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h, left: 3.62.w, right: 3.62.w),
                child: DropdownButtonFormField<String>(
                  value: _selectedMajor,
                  items:
                      _isFacilitySelected
                          ? majors
                              .map(
                                (major) => DropdownMenuItem<String>(
                                  value: major,
                                  child: Text(
                                    major,
                                    style: GoogleFonts.faustina(
                                      fontSize: 16.sp,
                                      color: ColorManager.mediumGray,
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                          : [],
                  onChanged:
                      _isFacilitySelected
                          ? (value) {
                            setState(() {
                              _selectedMajor = value;
                            });
                          }
                          : null,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorManager.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.mediumGray),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManager.red),
                    ),
                    labelText: 'Major*',
                    labelStyle: GoogleFonts.faustina(
                      fontSize: 16.sp,
                      fontWeight: FontWeightManager.semiBold,
                      letterSpacing: 0.32.sp,
                      color: ColorManager.mediumGray,
                    ),
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a major';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUnfocus,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: SizedBox(
                  height: 6.h,
                  width: 60.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    onPressed: () {
                      FocusManager.instance.primaryFocus!.unfocus();
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const GenderScreen(),
                      // ));
                    },
                    child: Text(
                      "NEXT",
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
}
