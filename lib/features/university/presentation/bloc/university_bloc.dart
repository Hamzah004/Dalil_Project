// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dalil_project/core/errors/methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dalil_project/features/university/domain/use_cases/get_university_by_student_id.dart';
import 'package:equatable/equatable.dart';

import 'package:dalil_project/features/university/domain/entities/university.dart';
import 'package:dalil_project/features/university/domain/use_cases/get_all_universities.dart';

part 'university_event.dart';
part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  final GetAllUniversitiesUseCase getAllUniversitiesUseCase;
  final GetUniversityByIdUseCase getUniversityByStudentIdUseCase;

  UniversityBloc(
    this.getAllUniversitiesUseCase,
    this.getUniversityByStudentIdUseCase,
  ) : super(UniversityInitial()) {
    on<GetAllUniversitiesEvent>(_onGetAllUniversities);
    on<GetUniversityByStudentIdEvent>(_onGetUniversityByStudentId);
  }

  Future<void> _onGetAllUniversities(
    GetAllUniversitiesEvent event,
    Emitter<UniversityState> emit,
  ) async {
    emit(LoadingUniversityState());

    final result = await getAllUniversitiesUseCase();
    result.fold(
      (failure) =>
          emit(ErrorUniversityState(message: mapFailureToMessage(failure))),
      (universities){
        if(universities.isEmpty){
          emit(EmptyUniversityState());
        } else {
          emit(LoadedUniversitiesState(universities: universities));
        }
      }
    );
  }

  Future<void> _onGetUniversityByStudentId(
    GetUniversityByStudentIdEvent event,
    Emitter<UniversityState> emit,
  ) async {
    emit(LoadingUniversityState());

    final result = await getUniversityByStudentIdUseCase(event.studentId);
    result.fold(
      (failure) =>
          emit(ErrorUniversityState(message: mapFailureToMessage(failure))),
      (university) => emit(LoadedUniversityState(university: university)),
    );
  }
}
