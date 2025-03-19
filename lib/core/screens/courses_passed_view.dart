import 'package:flutter/material.dart';
import 'package:flutter_elastic_list_view/flutter_elastic_list_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/strings_manager.dart';

class CoursesPassedView extends StatefulWidget {
  const CoursesPassedView({super.key});

  @override
  State<CoursesPassedView> createState() => _CoursesPassedViewState();
}

class _CoursesPassedViewState extends State<CoursesPassedView> {
  List<String> courses = [
    "Intro to programming",
    "calculus 1",
    "english 101",
    "arabic 101",
  ];
  Set<int> selectedCourses = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(23.5.h),
        child: _buildAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title Text
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Text(
              "Courses you have passed",
              style: GoogleFonts.faustina(
                fontSize: 22.sp,
                fontWeight: FontWeightManager.semiBold,
                color: ColorManager.primaryColor,
                letterSpacing: 2.sp,
              ),
            ),
          ),
          // Course List
          Expanded(
            child: ElasticListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedCourses.contains(index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedCourses.remove(index);
                      } else {
                        selectedCourses.add(index);
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 1.h,
                    ),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? ColorManager.primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: ColorManager.primaryColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      courses[index],
                      style: GoogleFonts.faustina(
                        fontSize: 19.sp,
                        fontWeight: FontWeightManager.regular,
                        letterSpacing: 3.sp,
                        color:
                            isSelected
                                ? Colors.white
                                : ColorManager.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
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
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
    );
  }
}
