import 'package:dalil_project/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

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
      initialSelectedTab: "All",
      useSafeArea: true,
      labels: const [
        "Ongoing",
        "Later",
        "All",
        "Pending",
        "Completed",
      ],
      icons: const [
        Icons.hourglass_top,
        Icons.double_arrow_sharp,
        Icons.home,
        Icons.lock,
        Icons.check_circle,
      ],
      tabSize: 50,
      tabBarHeight: 55,
      textStyle: const TextStyle(        
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      tabIconColor: ColorManager.primaryColor,
      tabIconSize: 26.0, // Keep size consistent
      tabIconSelectedSize: 28.0, // Make selected slightly larger
      tabSelectedColor: ColorManager.primaryColor,
      tabIconSelectedColor: Colors.white,
      tabBarColor: Colors.white,
      onTabItemSelected: widget.onTabItemSelected,
    );
  }
}
