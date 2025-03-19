import 'package:dalil_project/core/network/network_info.dart';
import 'package:dalil_project/features/faculty/data/data_sources/faculty_data_base_data_source.dart';
import 'package:dalil_project/features/faculty/data/repositories/faculty_repository_implementation.dart';
import 'package:dalil_project/features/faculty/domain/repositories/faculty_repository.dart';
import 'package:dalil_project/features/faculty/domain/usecase/get_all_faculties_by_university_id.dart';
import 'package:dalil_project/features/faculty/domain/usecase/get_faculty_by_student_id.dart';
import 'package:dalil_project/features/faculty/presentation/bloc/faculty_bloc.dart';
import 'package:dalil_project/features/study_resource/data/repositories/study_recourse_repositories_implementation.dart';
import 'package:dalil_project/features/study_resource/data/study_recourses_data_source/study_resource_data_base_data_source.dart';
import 'package:dalil_project/features/study_resource/domain/repositories/study_recourses_repositories.dart';
import 'package:dalil_project/features/study_resource/domain/usecase/get_recourses_by_course_id.dart';
import 'package:dalil_project/features/study_resource/presentation/bloc/study_resource_bloc.dart';
import 'package:dalil_project/features/university/data/data_sources/university_data_base_data_source.dart';
import 'package:dalil_project/features/university/data/repositories/university_repository_implementstion.dart';
import 'package:dalil_project/features/university/domain/repositories/university_repository.dart';
import 'package:dalil_project/features/university/domain/use_cases/get_all_universities.dart';
import 'package:dalil_project/features/university/domain/use_cases/get_university_by_student_id.dart';
import 'package:dalil_project/features/university/presentation/bloc/university_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // University:
    // UniversityBloc
    sl.registerFactory(() => UniversityBloc(sl(), sl()));

    // Usecases
    sl.registerLazySingleton(() => GetAllUniversitiesUseCase(sl()));
    sl.registerLazySingleton(() => GetUniversityByIdUseCase(sl()));

    // Repository
    sl.registerLazySingleton<UniversityRepository>(() {
      return UniversityRepositoryImplementation(sl(), sl());
    });

    // Datasources
    sl.registerLazySingleton<UniversityDataBaseDataSource>(
      () => UniversityDummyDataSourceImlementation(),
    );

  // Faculty:
    // FacultyBloc
    sl.registerFactory(() => FacultyBloc(sl(), sl(), sl()));

    // Usecases
    sl.registerLazySingleton(() => GetFacultiesByUniversityIdUseCase(sl()));
    sl.registerLazySingleton(() => GetFacultyByStudentIdUseCase(sl()));

    // Repository
    sl.registerLazySingleton<FacultyRepository>(() {
      return FacultyRepositoryImplementation(sl(), sl());
    });

    // Datasources
    sl.registerLazySingleton<FacultyDataBaseDataSource>(
      () => FacultyDummyDataSourceImplementation(),
    );

  // Study Recourse:
    // StudyRecourseBloc
    sl.registerFactory(() => StudyResourceBloc(sl(), sl(),));

    // Usecases
    sl.registerLazySingleton(() => GetStudyRecoursesByCourseIdUseCase(studyRecoursesRepository: sl()));

    // Repository
    sl.registerLazySingleton<StudyRecoursesRepository>(() {
      return StudyRecourseRepositoriesImplementation(sl(), sl());
    });

    // Datasources
    sl.registerLazySingleton<StudyResourceDummyDataSource>(
      () => StudyResourceDataBaseDataSourceImplementation(),
    );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplementation(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
}
