// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:dalil_project/core/errors/methods.dart';
import 'package:dalil_project/core/network/network_info.dart';
import 'package:dalil_project/core/strings.dart';
import 'package:equatable/equatable.dart';

import 'package:dalil_project/features/faculty/domain/entities/faculty.dart';
import 'package:dalil_project/features/faculty/domain/usecase/get_all_faculties_by_university_id.dart';
import 'package:dalil_project/features/faculty/domain/usecase/get_faculty_by_student_id.dart';

part 'faculty_event.dart';
part 'faculty_state.dart';

class FacultyBloc extends Bloc<FacultyEvent, FacultyState> {
  GetFacultiesByUniversityIdUseCase getFacultiesByUniversityIdUseCase;
  GetFacultyByStudentIdUseCase getFacultyByStudentIdUseCase;
  NetworkInfo networkInfo;

  FacultyBloc(
    this.getFacultiesByUniversityIdUseCase,
    this.getFacultyByStudentIdUseCase,
    this.networkInfo,
  ) : super(FacultyInitial()) {
    on<GetFacultiesByUniversityIdEvent>(_onGetFacultiesByUniversityId);
    on<GetFacultyByStudentIdEvent>(_onGetFacultyByStudentId);
  }

  void _onGetFacultiesByUniversityId(
    GetFacultiesByUniversityIdEvent event,
    Emitter<FacultyState> emit,
  ) async {
    if (await networkInfo.isConnected) {
      emit(LoadingFacultyState());

      final result = await getFacultiesByUniversityIdUseCase(
        event.universityId,
      );
      result.fold(
        (failure) =>
            emit(ErrorFacultyState(message: mapFailureToMessage(failure))),
        (faculties){
          if(faculties.isEmpty){
            emit(EmptyFacultyState());
          } else {
            emit(LoadedFacultiesState(faculties: faculties));
          }
        }
      );
    } else {
      emit(ErrorFacultyState(message: OFFLINE_FAILURE_MESSAGE));
    }
  }

  void _onGetFacultyByStudentId(
    GetFacultyByStudentIdEvent event,
    Emitter<FacultyState> emit,
  ) async {
    emit(LoadingFacultyState());

    final result = await getFacultyByStudentIdUseCase(event.studentId);
    result.fold(
      (failure) =>
          emit(ErrorFacultyState(message: mapFailureToMessage(failure))),
      (faculty) => emit(LoadedFacultyState(faculty: faculty)),
    );
  }
}
