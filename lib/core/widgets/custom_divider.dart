import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 7.h),
      child: Divider(
        color: Colors.black,
        thickness: 0.8,
        indent: 4.w,
        endIndent: 4.w,
      ),
    );
  }
}
