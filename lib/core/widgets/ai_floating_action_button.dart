import 'package:dalil_project/core/widgets/ai_dialog_box.dart';
import 'package:dalil_project/resources/assets_manager.dart';
import 'package:dalil_project/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class AIFloatingButton extends StatelessWidget {
  const AIFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
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
          _onFloatingButtonPressed(context);
        },
      ),
    );
  }

  void _onFloatingButtonPressed(BuildContext context) {
    AIDialogBox.getAIBialogBox(context);
  }
}
