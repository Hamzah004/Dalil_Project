import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/features/university/domain/entities/university.dart';
import 'package:dartz/dartz.dart';

abstract class UniversityRepository {
  Future<Either<Failure, List<University>>> getAllUniversities();
  Future<Either<Failure, University>> getUniversityByStudentId(String studentId);
}
