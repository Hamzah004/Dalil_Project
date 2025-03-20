import 'package:dalil_project/resources/assets_manager.dart';
import 'package:dalil_project/resources/fonts_manager.dart';
import 'package:dalil_project/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elastic_list_view/flutter_elastic_list_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/values_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late MotionTabBarController _motionTabBarController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(length: 5, vsync: this);
  }

  void _onTabSelected(int index) {
    // Handle tab selection logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(),
      appBar: _appBarBuilder(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Expanded(
              child: ElasticListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return _buildCourseCard(
                    courses[index]["name"],
                    courses[index]["type"],
                    courses[index]["hours"],
                    courses[index]["icon"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        motionTabBarController: _motionTabBarController,
        onTabItemSelected: _onTabSelected,
      ),
      floatingActionButton: _floatingActionButtonBuild(),
    );
  }

  Widget _buildDrawerItem(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        padding: EdgeInsets.all(1.5.h),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Text(
          title,
          style: GoogleFonts.faustina(
            fontSize: FontSize.s19,
            fontWeight: FontWeightManager.medium,
            color: ColorManager.primaryColor,
            letterSpacing: 3.sp,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 20.h,
            width: double.infinity,
            color: ColorManager.primaryColor,
            padding: EdgeInsets.only(left: 2.w, bottom: 4.h),
            child: Row(
              children: [
                Container(
                  width: AppSize.s18.w,
                  height: AppSize.s9.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.primaryColor),
                    color: ColorManager.profileBackground,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Icon(
                    Icons.person_rounded,
                    size: AppSize.s28.sp,
                    color: ColorManager.primaryColor,
                  ),
                ),
                SizedBox(width: 1.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Amr Hamed Alali",
                      style: GoogleFonts.faustina(
                        fontSize: FontSize.s19,
                        fontWeight: FontWeightManager.semiBold,
                        color: ColorManager.white,
                      ),
                    ),
                    Text(
                      "Computer Science",
                      style: GoogleFonts.faustina(
                        fontSize: FontSize.s14,
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: ColorManager.primaryColor),
              child: ListView(
                children: [
                  _buildDrawerItem("Ongoing Courses", () {}),
                  _buildDrawerItem("Pending Courses", () {}),
                  _buildDrawerItem("Completed Courses", () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Course Card Widget
  Widget _buildCourseCard(
    String courseName,
    String type,
    int hours,
    IconData icon,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.primaryColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          // Left Square with Circle and Icon
          Container(
            width: 12.w,
            height: 12.w,
            decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Container(
                width: 7.w,
                height: 7.w,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: ColorManager.primaryColor,
                  size: 20.sp,
                ),
              ),
            ),
          ),
          SizedBox(width: 4.w), // Space between icon and text
          // Course Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseName,
                style: GoogleFonts.faustina(
                  fontSize: 18.sp,
                  fontWeight: FontWeightManager.semiBold,
                  color: ColorManager.primaryColor,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                "$type • $hours hours",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeightManager.medium,
                  color: ColorManager.mediumGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBarBuilder() {
    return PreferredSize(
      preferredSize: Size.fromHeight(20.h),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                ImageAssets.homePageAppBar,
                fit: BoxFit.cover,
                width: 75.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.w, bottom: 4.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  child: Container(
                    width: AppSize.s18.w,
                    height: AppSize.s9.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.primaryColor),
                      color: ColorManager.profileBackground,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: AppSize.s28.sp,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: 1.w),
                GestureDetector(
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Amr Hamed Alali",
                        style: GoogleFonts.faustina(
                          fontSize: FontSize.s19,
                          fontWeight: FontWeightManager.semiBold,
                          color: ColorManager.white,
                        ),
                      ),
                      Text(
                        "Computer Science",
                        style: TextStyle(
                          fontSize: FontSize.s14,
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.medium,
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

  Widget _floatingActionButtonBuild() {
    return Transform.translate(
      offset: Offset(0, -25),
      child: FloatingActionButton(
        backgroundColor: ColorManager.transparent,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(ImageAssets.aiButton),
        ),
        onPressed: () {
          AIDialogBox.getAIDialogBox(context);
        },
      ),
    );
  }
}

// Sample Course Data
List<Map<String, dynamic>> courses = [
  {
    "name": "Intro to Programming",
    "type": "Optional",
    "hours": 3,
    "icon": Icons.code,
  },
  {
    "name": "Calculus 1",
    "type": "Required",
    "hours": 4,
    "icon": Icons.calculate,
  },
  {
    "name": "English 101",
    "type": "Optional",
    "hours": 2,
    "icon": Icons.menu_book,
  },
  {
    "name": "English 101",
    "type": "Optional",
    "hours": 2,
    "icon": Icons.menu_book,
  },
  {
    "name": "English 101",
    "type": "Optional",
    "hours": 2,
    "icon": Icons.menu_book,
  },
  {
    "name": "English 101",
    "type": "Optional",
    "hours": 2,
    "icon": Icons.menu_book,
  },
  {
    "name": "English 101",
    "type": "Optional",
    "hours": 2,
    "icon": Icons.menu_book,
  },
  {
    "name": "English 101",
    "type": "Optional",
    "hours": 2,
    "icon": Icons.menu_book,
  },

];

class CustomBottomNavigationBar extends StatefulWidget {
  final MotionTabBarController? motionTabBarController;
  final void Function(int) onTabItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.motionTabBarController,
    required this.onTabItemSelected,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return MotionTabBar(
      controller: widget.motionTabBarController,
      initialSelectedTab: "All Courses",
      useSafeArea: true,
      labels: const ["Ongoing", "Later", "All Courses", "Pending", "Completed"],
      icons: const [
        Icons.hourglass_top,
        Icons.double_arrow_sharp,
        Icons.home,
        Icons.lock,
        Icons.check_circle,
      ],
      tabSize: 12.w,
      tabBarHeight: 6.5.h,
      textStyle: TextStyle(
        fontSize: FontSize.s13,
        color: Colors.black,
        fontWeight: FontWeightManager.medium,
      ),
      tabIconColor: ColorManager.primaryColor,
      tabIconSize: 8.w,
      // Keep size consistent
      tabIconSelectedSize: 8.w,
      // Make selected slightly larger
      tabSelectedColor: ColorManager.primaryColor,
      tabIconSelectedColor: ColorManager.white,
      tabBarColor: ColorManager.white,
      onTabItemSelected: widget.onTabItemSelected,
    );
  }
}

class AIDialogBox {
  static void getAIDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: _buildShape(),

          child: Container(
            decoration: _buildBoxDecoration(),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildIcon(),

                SizedBox(height: 10),
                _buildTitleText(),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCancelButton(context),
                    SizedBox(width: 10),
                    _buildOkButton(context),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildOkButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        AiBottomSheet.getAIButtonSheet(context);
      },
      child: Text(
        AppStrings.ok,
        style: GoogleFonts.faustina(
          color: ColorManager.white,
          fontWeight: FontWeightManager.regular,
          fontSize: FontSize.s18,
        ),
      ),
    );
  }

  static Widget _buildCancelButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        AppStrings.cancel,
        style: GoogleFonts.faustina(
        color: ColorManager.primaryColor,
        fontWeight: FontWeightManager.regular,
        fontSize: FontSize.s18,
      ),
      ),
    );
  }

  static _buildShape() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
  }

  static Decoration? _buildBoxDecoration() {
    return BoxDecoration(
      color: ColorManager.white,
      border: Border.all(color: ColorManager.primaryColor, width: 1),
      borderRadius: BorderRadius.circular(5),
    );
  }

  static _buildIcon() {
    return CircleAvatar(
      radius: 30,
      backgroundColor: ColorManager.primaryColor,
      child: Icon(Icons.memory, color: Colors.white, size: 12.w),
    );
  }

  static _buildTitleText() {
    return Text(
      AppStrings.aiCanHelpYouCreateACourseScheduleForYourNextSemester,
      textAlign: TextAlign.center,
      style: GoogleFonts.faustina(
      color: ColorManager.primaryColor,
      fontWeight: FontWeightManager.regular,
      fontSize: FontSize.s18,
    ),
    );
  }
}

class AiBottomSheet {
  static void getAIButtonSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
      ),
      builder:
          (context) => SizedBox(
            width: 100.w,
            height: 40.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close'),
                ),
              ],
            ),
          ),
    );
  }
}
