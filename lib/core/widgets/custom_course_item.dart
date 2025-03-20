import 'package:dalil_project/resources/colors_manager.dart';
import 'package:dalil_project/resources/fonts_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CurstomCourseItem extends StatefulWidget {
  bool isSelected;
  String course;
  int index;
  void Function(int index, bool isSelected) onTap;

  CurstomCourseItem({
    super.key,
    required this.isSelected,
    required this.course,
    required this.index,
    required this.onTap,
  });

  @override
  State<CurstomCourseItem> createState() => _CurstomCourseItemState();
}

class _CurstomCourseItemState extends State<CurstomCourseItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.index, widget.isSelected);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: widget.isSelected ? ColorManager.primaryColor : Colors.white,
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
          widget.course,
          style: GoogleFonts.faustina(
            fontSize: 19.sp,
            fontWeight: FontWeightManager.regular,
            letterSpacing: 3.sp,
            color: widget.isSelected ? Colors.white : ColorManager.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
