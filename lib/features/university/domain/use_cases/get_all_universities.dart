import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/features/university/domain/entities/university.dart';
import 'package:dalil_project/features/university/domain/repositories/university_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllUniversitiesUseCase {
  final UniversityRepository repository;

  GetAllUniversitiesUseCase(this.repository);

  Future<Either<Failure, List<University>>> call() async {
    return await repository.getAllUniversities();
  }
}
