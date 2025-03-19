part of 'university_bloc.dart';

abstract class UniversityState extends Equatable {
  const UniversityState();

  @override
  List<Object> get props => [];
}

class UniversityInitial extends UniversityState {}

class LoadingUniversityState extends UniversityState {}

class LoadedUniversitiesState extends UniversityState {
  final List<University> universities;
  const LoadedUniversitiesState({required this.universities});
}

class ErrorUniversityState extends UniversityState {
  final String message;

  const ErrorUniversityState({required this.message});
}

class LoadedUniversityState extends UniversityState {
  final University university;

  const LoadedUniversityState({required this.university});
}

class EmptyUniversityState extends UniversityState {}
