import 'package:flutter/material.dart';
import 'colors_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // App Bar Theme
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorManager.white),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    ),

    // Text Field Theme
    inputDecorationTheme: InputDecorationTheme(
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
    ),
  );
}

//
// ThemeData getApplicationTheme() {
//   return ThemeData(
//     // main colors
//     primaryColor: ColorManager.primary,
//     primaryColorLight: ColorManager.lightPrimary,
//     primaryColorDark: ColorManager.darkPrimary,
//     disabledColor: ColorManager.grey1,
//     splashColor: ColorManager.lightPrimary, // ripple effect color
//     // cardview theme
//     cardTheme: CardTheme(
//       color: ColorManager.white,
//       shadowColor: ColorManager.grey,
//       elevation: AppSize.s4,
//     ),
//
//     // app bar theme
//     appBarTheme: AppBarTheme(
//       centerTitle: true,
//       color: ColorManager.primary,
//       elevation: AppSize.s4,
//       shadowColor: ColorManager.lightPrimary,
//       titleTextStyle: getRegularStyle(
//         fontSize: FontSize.s16,
//         color: ColorManager.white,
//       ),
//     ),
//
//     // button theme
//     buttonTheme: ButtonThemeData(
//       shape: const StadiumBorder(),
//       disabledColor: ColorManager.grey1,
//       buttonColor: ColorManager.primary,
//       splashColor: ColorManager.lightPrimary,
//     ),
//
//     // elevated button theme
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         textStyle: getRegularStyle(
//           color: ColorManager.white,
//           fontSize: FontSize.s17,
//         ),
//         backgroundColor: ColorManager.primary, ////
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSize.s12),
//         ),
//       ),
//     ),
//
//     // text theme
//     textTheme: TextTheme(
//       displayLarge: getSemiBoldStyle(
//         color: ColorManager.darkGrey,
//         fontSize: FontSize.s16,
//       ),
//
//       headlineLarge: getSemiBoldStyle(
//         color: ColorManager.darkGrey,
//         fontSize: FontSize.s16,
//       ),
//
//       headlineMedium: getRegularStyle(
//         color: ColorManager.darkGrey,
//         fontSize: FontSize.s14,
//       ),
//
//       titleMedium: getMediumStyle(
//         color: ColorManager.primary,
//         fontSize: FontSize.s16,
//       ),
//
//       bodyLarge: getRegularStyle(color: ColorManager.grey1),
//
//       bodySmall: getRegularStyle(color: ColorManager.grey),
//     ),
//
//     // input decoration theme (text form field)
//     inputDecorationTheme: InputDecorationTheme(
//       // content padding
//       contentPadding: const EdgeInsets.all(AppPadding.p8),
//
//       // hint style
//       hintStyle: getRegularStyle(
//         color: ColorManager.grey,
//         fontSize: FontSize.s14,
//       ),
//
//       // label style
//       labelStyle: getMediumStyle(
//         color: ColorManager.grey,
//         fontSize: FontSize.s14,
//       ),
//
//       errorStyle: getRegularStyle(color: ColorManager.error),
//
//       // enabled border style
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.primary,
//           width: AppSize.s1_5,
//         ),
//         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//
//       // focused border style
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
//         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//
//       // error border style
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
//         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//
//       // focused error border style
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.primary,
//           width: AppSize.s1_5,
//         ),
//         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//     ),
//   );
// }
