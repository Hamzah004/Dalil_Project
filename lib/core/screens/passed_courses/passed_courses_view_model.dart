import 'package:dalil_project/core/screens/passed_courses/passed_courses_view.dart';
import 'package:flutter/material.dart';

class PassedCoursesViewModel {
  static List<String> getPassedCourses(BuildContext context) {
    return [];
  }

  static onTextButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PassedCoursesView()),
    );
  }
}
