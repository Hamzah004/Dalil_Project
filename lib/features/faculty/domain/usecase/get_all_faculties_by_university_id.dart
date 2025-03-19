import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/features/faculty/domain/entities/faculty.dart';
import 'package:dalil_project/features/faculty/domain/repositories/faculty_repository.dart';
import 'package:dartz/dartz.dart';

class GetFacultiesByUniversityIdUseCase {
  FacultyRepository repository;
  GetFacultiesByUniversityIdUseCase(this.repository);

  Future<Either<Failure, List<Faculty>>> call(String universityId) async {
    return await repository.getFacultiesByUniversityId(universityId);
  }
}
