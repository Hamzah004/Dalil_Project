part of 'study_resource_bloc.dart';

abstract class StudyResourceState extends Equatable {
  const StudyResourceState();
  
  @override
  List<Object> get props => [];
}

class StudyResourceInitial extends StudyResourceState {}

class LoadingStudyResourceState extends StudyResourceState {}

class LoadedStudyResourceState extends StudyResourceState {
  final List<StudyResource> studyResources; 

  const LoadedStudyResourceState({required this.studyResources});

  @override
  List<Object> get props => [studyResources];
}

class ErrorStudyResourceState extends StudyResourceState {
  final String message;

  const ErrorStudyResourceState({required this.message});

  @override
  List<Object> get props => [message];
}

class EmptyStudyResourceState extends StudyResourceState {}
