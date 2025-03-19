part of 'study_resource_bloc.dart';

abstract class StudyResourceEvent extends Equatable {
  const StudyResourceEvent();

  @override
  List<Object> get props => [];
}

class GetStudyRecoursesByCourseIdEvent extends StudyResourceEvent {
  String courseId;

  GetStudyRecoursesByCourseIdEvent({required this.courseId});

  @override
  List<Object> get props => [courseId];
}
