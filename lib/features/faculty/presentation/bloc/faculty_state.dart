part of 'faculty_bloc.dart';

abstract class FacultyState extends Equatable {
  const FacultyState();

  @override
  List<Object> get props => [];
}

class FacultyInitial extends FacultyState {}

class LoadingFacultyState extends FacultyState {}

class LoadedFacultiesState extends FacultyState {
  final List<Faculty> faculties;
  const LoadedFacultiesState({required this.faculties});

  @override
  List<Object> get props => [faculties];
}

class LoadedFacultyState extends FacultyState {
  final Faculty faculty;
  const LoadedFacultyState({required this.faculty});

  @override
  List<Object> get props => [faculty];
}

class ErrorFacultyState extends FacultyState {
  final String message;

  const ErrorFacultyState({required this.message});
}

class EmptyFacultyState extends FacultyState {}
