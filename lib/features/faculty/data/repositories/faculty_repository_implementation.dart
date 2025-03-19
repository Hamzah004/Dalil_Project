import 'package:dalil_project/core/errors/exception.dart';
import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/core/network/network_info.dart';
import 'package:dalil_project/features/faculty/data/data_sources/faculty_data_base_data_source.dart';
import 'package:dalil_project/features/faculty/domain/entities/faculty.dart';
import 'package:dalil_project/features/faculty/domain/repositories/faculty_repository.dart';
import 'package:dartz/dartz.dart';

class FacultyRepositoryImplementation implements FacultyRepository {
  FacultyDataBaseDataSource dataBaseDataSource;
  final NetworkInfo networkInfo;

  FacultyRepositoryImplementation(this.dataBaseDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<Faculty>>> getFacultiesByUniversityId(
    String universityId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final faculties = await dataBaseDataSource.getFacultiesByUniversityId(
          universityId,
        );
        return Right(faculties);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else{
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Faculty>> getFacultyByStudentId(String studentId) async {
    if (await networkInfo.isConnected) {
      try {
        final faculty = await dataBaseDataSource.getFacultyByStudentId(studentId);
        return Right(faculty);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
