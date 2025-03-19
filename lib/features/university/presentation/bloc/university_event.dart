part of 'university_bloc.dart';

abstract class UniversityEvent extends Equatable {
  const UniversityEvent();

  @override
  List<Object> get props => [];
}

class GetAllUniversitiesEvent extends UniversityEvent {
  const GetAllUniversitiesEvent();

  @override
  List<Object> get props => [];
}

class GetUniversityByStudentIdEvent extends UniversityEvent {
  const GetUniversityByStudentIdEvent({required this.studentId});
  final String studentId;
  @override
  List<Object> get props => [studentId];
}
