import 'package:dalil_project/core/widgets/ai_botton_sheet.dart';
import 'package:dalil_project/resources/colors_manager.dart';
import 'package:dalil_project/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class AIDialogBox {
  static void getAIBialogBox(BuildContext context) {
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
        AiBottonSheet.getAIButtonSheet(context);
      },
      child: Text(AppStrings.ok, style: TextStyle(color: ColorManager.white)),
    );
  }

  static Widget _buildCancelButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        AppStrings.cancel,
        style: TextStyle(color: ColorManager.primaryColor),
      ),
    );
  }

  static _buildShape() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  }

  static Decoration? _buildBoxDecoration() {
    return BoxDecoration(
      color: ColorManager.white,
      border: Border.all(color: ColorManager.primaryColor, width: 2),
      borderRadius: BorderRadius.circular(20),
    );
  }

  static _buildIcon() {
    return CircleAvatar(
      radius: 30,
      backgroundColor: ColorManager.primaryColor,
      child: Icon(Icons.memory, color: Colors.white, size: 50),
    );
  }

  static _buildTitleText() {
    return Text(
      AppStrings.aiCanHelpYouCreateACourseScheduleForYourNextSemester,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorManager.primaryColor,
      ),
    );
  }
}
