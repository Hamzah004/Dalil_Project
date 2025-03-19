part of 'faculty_bloc.dart';

abstract class FacultyEvent extends Equatable {
  const FacultyEvent();

  @override
  List<Object> get props => [];
}

class GetFacultiesByUniversityIdEvent extends FacultyEvent {
  final String universityId;
  const GetFacultiesByUniversityIdEvent({required this.universityId});

  @override
  List<Object> get props => [universityId];
}

class GetFacultyByStudentIdEvent extends FacultyEvent {
  final String studentId;
  const GetFacultyByStudentIdEvent({required this.studentId});

  @override
  List<Object> get props => [studentId];
}
