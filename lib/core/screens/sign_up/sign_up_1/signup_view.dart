import 'package:dalil_project/core/screens/sign_up/sign_up_1/signup_view_model.dart';
import 'package:dalil_project/core/widgets/custom_app_bar.dart';
import 'package:dalil_project/core/widgets/custom_divider.dart';
import 'package:dalil_project/resources/colors_manager.dart';
import 'package:dalil_project/resources/fonts_manager.dart';
import 'package:dalil_project/resources/strings_manager.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildCreateAccountText(),

              CustomDivider(),
              SizedBox(height: .5.h),

              SizedBox(
                width: double.infinity,
                height: 36.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildArabicNameTextField(),

                      _buildEnglishNameTextField(),

                      _buildEmailTextField(),

                      _buildUniversities(),

                      _buildFaculties(),

                      _buildMajors(),
                    ],
                  ),
                ),
              ),

              SizedBox(height: .5.h),
              _buildNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAccountText() {
    return Padding(
      padding: EdgeInsets.only(top: 6.h),
      child: Text(
        AppStrings.createYourAccount,
        style: GoogleFonts.faustina(
          fontSize: 21.sp,
          fontWeight: FontWeightManager.medium,
          letterSpacing: 0.54.sp,
          color: ColorManager.mediumGray,
        ),
      ),
    );
  }

  Widget _buildArabicNameTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, left: 3.62.w, right: 3.62.w),
      child: TextFormField(
        textDirection: TextDirection.rtl,
        key: _formKey,
        style: GoogleFonts.faustina(
          fontSize: 16.sp,
          color: ColorManager.mediumGray,
        ),
        autocorrect: true,
        autofocus: false,
        controller: _arabicNameController,
        validator: (arabicName) {
          return SignUpViewModel.isValidArabicName(arabicName);
        },
        cursorHeight: 25,
        cursorColor: ColorManager.mediumGray,
        focusNode: _emailFocusNode,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: AppStrings.arabicName,
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
    );
  }

  Widget _buildEnglishNameTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h, left: 3.62.w, right: 3.62.w),
      child: TextFormField(
        keyboardType: TextInputType.text,
        enableSuggestions: true,
        controller: _englishNameController,
        validator: (value) {
          return SignUpViewModel.isValidEnglishName(value);
        },
        style: GoogleFonts.faustina(
          fontSize: 16.sp,
          color: ColorManager.mediumGray,
        ),
        autocorrect: false,
        cursorHeight: 25,
        cursorColor: ColorManager.mediumGray,
        decoration: InputDecoration(
          labelText: AppStrings.englishName,
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
    );
  }

  Widget _buildEmailTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h, left: 3.62.w, right: 3.62.w),
      child: TextFormField(
        keyboardType: TextInputType.text,
        enableSuggestions: true,
        controller: _emailController,
        validator: (email) {
          return SignUpViewModel.emailValidator(email);
        },

        style: GoogleFonts.faustina(
          fontSize: 16.sp,
          color: ColorManager.mediumGray,
        ),
        autocorrect: false,
        cursorHeight: 25,
        cursorColor: ColorManager.mediumGray,
        decoration: InputDecoration(
          labelText: AppStrings.email,
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
    );
  }

  void _onUniversityDropDownChanged(value) {
    setState(() {
      _selectedUniversity = value;
      _isUniversitySelected = value != null;
      _selectedFacility = null;
      _isFacilitySelected = false;
    });
  }

  void _onFacultyDropDownChanged(value) {
    setState(() {
      _selectedFacility = value;
      _isFacilitySelected = value != null;
      _selectedMajor = null;
    });
  }

  void _onMajorDropDownChanged(value) {
    setState(() {
      _selectedMajor = value;
    });
  }

  Widget _buildUniversities() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h, left: 3.62.w, right: 3.62.w),
      child: DropdownButtonFormField(
        value: _selectedUniversity,
        items: _buildDropList(SignUpViewModel.getUniversities()),
        onChanged: (value) {
          _onUniversityDropDownChanged(value);
        },
        decoration: InputDecoration(
          labelText: AppStrings.university,
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
          return SignUpViewModel.universityDropDownValidator(value);
        },
      ),
    );
  }

  Widget _buildFaculties() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h, left: 3.62.w, right: 3.62.w),
      child: DropdownButtonFormField<String>(
        value: _selectedFacility,
        items:
            _isUniversitySelected
                ? _buildDropList(SignUpViewModel.getFaculities())
                : [],
        onChanged: _isUniversitySelected ? _onFacultyDropDownChanged : null,
        decoration: InputDecoration(
          labelText: AppStrings.faculty,
          labelStyle: GoogleFonts.faustina(
            fontSize: 16.sp,
            fontWeight: FontWeightManager.semiBold,
            letterSpacing: 0.32.sp,
            color: ColorManager.mediumGray,
          ),
          isDense: true,
        ),
        validator: (value) {
          return SignUpViewModel.facultyDropDownValidator(value);
        },
        autovalidateMode: AutovalidateMode.onUnfocus,
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropList(List<String> items) {
    return items
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
        .toList();
  }

  Widget _buildMajors() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h, left: 3.62.w, right: 3.62.w),
      child: DropdownButtonFormField<String>(
        value: _selectedMajor,
        items:
            _isFacilitySelected
                ? _buildDropList(SignUpViewModel.getMajors())
                : [],
        onChanged:
            _isFacilitySelected
                ? (value) {
                  _onMajorDropDownChanged(value);
                }
                : null,
        decoration: InputDecoration(
          labelText: AppStrings.major,
          labelStyle: GoogleFonts.faustina(
            fontSize: 16.sp,
            fontWeight: FontWeightManager.semiBold,
            letterSpacing: 0.32.sp,
            color: ColorManager.mediumGray,
          ),
          isDense: true,
        ),
        validator: (value) {
          return SignUpViewModel.majorDropDownValidator(value);
        },
        autovalidateMode: AutovalidateMode.onUnfocus,
      ),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: SizedBox(
        height: 6.h,
        width: 60.w,
        child: ElevatedButton(
          onPressed: () => SignUpViewModel.nextButtonOnPressed,
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
    );
  }
}
