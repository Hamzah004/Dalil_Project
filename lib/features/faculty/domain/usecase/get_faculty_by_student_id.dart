import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/features/faculty/domain/entities/faculty.dart';
import 'package:dalil_project/features/faculty/domain/repositories/faculty_repository.dart';
import 'package:dartz/dartz.dart';

class GetFacultyByStudentIdUseCase {
  final FacultyRepository repository;

  GetFacultyByStudentIdUseCase(this.repository);

  Future<Either<Failure, Faculty>> call(String studentId) async {
    return await repository.getFacultyByStudentId(studentId);
  }
}
