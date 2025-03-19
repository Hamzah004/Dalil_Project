// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/core/errors/methods.dart';
import 'package:dalil_project/core/network/network_info.dart';
import 'package:dalil_project/core/strings.dart';
import 'package:dalil_project/features/study_resource/domain/entities/study_resource.dart';
import 'package:dalil_project/features/study_resource/domain/usecase/get_recourses_by_course_id.dart';

part 'study_resource_event.dart';
part 'study_resource_state.dart';

class StudyResourceBloc extends Bloc<StudyResourceEvent, StudyResourceState> {
  GetStudyRecoursesByCourseIdUseCase getStudy;
  NetworkInfo networkInfo;

  StudyResourceBloc(
    this.getStudy,
    this.networkInfo,
  ) : super(StudyResourceInitial()) {
    on<GetStudyRecoursesByCourseIdEvent>(_ongetStudyRecoursesByCourseIdEvent);
  }

  void _ongetStudyRecoursesByCourseIdEvent(event, emit) async {
    if(await networkInfo.isConnected){
      emit(LoadingStudyResourceState());

      final result = await getStudy(event.courseId);

      result.fold(
        (failure) =>
            emit(ErrorStudyResourceState(message: mapFailureToMessage(failure))),
        (recourses){
          if(recourses.isEmpty){
            emit(EmptyStudyResourceState());
          } else {
            emit(LoadedStudyResourceState(studyResources: recourses));
          }
        }
      );
    } else {
      emit(ErrorStudyResourceState(message: OFFLINE_FAILURE_MESSAGE));
    }
  }
}
