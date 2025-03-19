import 'package:dalil_project/core/screens/splash/splash_view.dart';
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
            home: SplashView(),
          ),
        );
      },

    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo')),
      body: Center(
        child: BlocBuilder<StudyResourceBloc, StudyResourceState>(
          builder: (context, state) {
            if (state is LoadedStudyResourceState) {
              return Text(state.studyResources[0].descreption);
            }
            if (state is EmptyStudyResourceState) {
              return Text('empty');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
