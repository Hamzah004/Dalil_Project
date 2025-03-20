import 'package:dalil_project/core/screens/passed_courses/passed_courses_view_model.dart';
import 'package:dalil_project/core/widgets/custom_app_bar.dart';
import 'package:dalil_project/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:dalil_project/core/widgets/custom_course_item.dart';
import 'package:dalil_project/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elastic_list_view/flutter_elastic_list_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:sizer/sizer.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/fonts_manager.dart';
import '../../../resources/strings_manager.dart';

class CurrentCoursesView extends StatefulWidget {
  const CurrentCoursesView({super.key});

  @override
  State<CurrentCoursesView> createState() => _CurrentCoursesViewState();
}

class _CurrentCoursesViewState extends State<CurrentCoursesView>
    with TickerProviderStateMixin {
  Set<int> selectedCourses = {};
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();

    _motionTabBarController = MotionTabBarController(
      initialIndex: 2,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: getCustomAppBar(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitleText(),

          SizedBox(height: 2.h),
          _buildCoursesList(['Amro', 'Mohamed', 'Ali', 'Ahmed', 'Khaled']),

          SizedBox(height: 2.h),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildTitleText() {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Text(
        AppStrings.chooseYourCurrentClassSchedule,
        textAlign: TextAlign.center,
        style: GoogleFonts.faustina(
          fontSize: 22.sp,
          fontWeight: FontWeightManager.semiBold,
          color: ColorManager.primaryColor,
          letterSpacing: 2.sp,
        ),
      ),
    );
  }

  Widget _buildCoursesList(List<String> courses) {
    return Expanded(
      child: ElasticListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedCourses.contains(index);

          return CurstomCourseItem(
            isSelected: isSelected,
            course: courses[index],
            index: index,
            onTap: onCourseSelected,
          );
        },
      ),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: SizedBox(
        height: 6.h,
        width: 60.w,
        child: ElevatedButton(
          onPressed: () {
            PassedCoursesViewModel.onTextButtonPressed(context);
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
    );
  }

  void onCourseSelected(int index, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedCourses.remove(index);
      } else {
        selectedCourses.add(index);
      }
    });
  }
}
