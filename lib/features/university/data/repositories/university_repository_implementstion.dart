import 'package:dalil_project/core/errors/exception.dart';
import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/core/network/network_info.dart';
import 'package:dalil_project/features/university/data/data_sources/university_data_base_data_source.dart';
import 'package:dalil_project/features/university/domain/entities/university.dart';
import 'package:dalil_project/features/university/domain/repositories/university_repository.dart';
import 'package:dartz/dartz.dart';

class UniversityRepositoryImplementation implements UniversityRepository {
  UniversityDataBaseDataSource dataBaseDataSource;
  final NetworkInfo networkInfo;
  
  UniversityRepositoryImplementation(
    this.dataBaseDataSource,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, List<University>>> getAllUniversities() async {
    if (await networkInfo.isConnected) {
      try {
        final universities = await dataBaseDataSource.getAllUniversities();
        return Right(universities);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, University>> getUniversityByStudentId(
    String studentId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final university = await dataBaseDataSource.getUniversityByStudentId(
          studentId,
        );
        return Right(university);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
