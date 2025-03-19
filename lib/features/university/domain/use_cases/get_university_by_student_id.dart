import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/features/university/domain/entities/university.dart';
import 'package:dalil_project/features/university/domain/repositories/university_repository.dart';
import 'package:dartz/dartz.dart';

class GetUniversityByIdUseCase {
  UniversityRepository repository;

  GetUniversityByIdUseCase(this.repository);

  Future<Either<Failure, University>> call(String studentId) async {
    return await repository.getUniversityByStudentId(studentId);
  }
}
