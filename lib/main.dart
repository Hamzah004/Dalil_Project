import 'package:dalil_project/core/screens/passed_courses/passed_courses_view.dart';
import 'package:dalil_project/features/study_resource/presentation/bloc/study_resource_bloc.dart';
import 'package:dalil_project/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create:
              (context) =>
          di.sl<StudyResourceBloc>()
            ..add(GetStudyRecoursesByCourseIdEvent(courseId: '1')),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: getApplicationTheme(),
            home: PassedCoursesView(),
          ),
        );
      },

    );
  }
}
