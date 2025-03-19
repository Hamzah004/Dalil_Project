import 'package:dalil_project/core/errors/exception.dart';
import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/core/network/network_info.dart';
import 'package:dalil_project/features/study_resource/data/study_recourses_data_source/study_resource_data_base_data_source.dart';
import 'package:dalil_project/features/study_resource/domain/entities/study_resource.dart';
import 'package:dalil_project/features/study_resource/domain/repositories/study_recourses_repositories.dart';
import 'package:dartz/dartz.dart';

class StudyRecourseRepositoriesImplementation
    implements StudyRecoursesRepository {
  StudyResourceDummyDataSource studyResourceDataBaseDataSource;
  NetworkInfo networkInfo;

  StudyRecourseRepositoriesImplementation(
    this.studyResourceDataBaseDataSource,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, List<StudyResource>>> getRecoursesByCourseId(
    String courseId,
  ) async {
    if(await networkInfo.isConnected){
      try {
        final studyResources = await studyResourceDataBaseDataSource.getRecoursesByCourseId(courseId);
        return Right(studyResources);

      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
