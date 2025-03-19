import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/features/faculty/domain/entities/faculty.dart';
import 'package:dartz/dartz.dart';

abstract class FacultyRepository {
  Future<Either<Failure, List<Faculty>>> getFacultiesByUniversityId(
    String universityId,
  );
  Future<Either<Failure, Faculty>> getFacultyByStudentId(String studentId);
}
