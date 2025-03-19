import 'package:dalil_project/resources/assets_manager.dart';
import 'package:dalil_project/resources/colors_manager.dart';
import 'package:dalil_project/resources/fonts_manager.dart';
import 'package:dalil_project/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget getCustomAppBar() {
  return PreferredSize(
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
                        AppStrings.dalil,
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
                          AppStrings.arabicDalil,
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
  );
}
