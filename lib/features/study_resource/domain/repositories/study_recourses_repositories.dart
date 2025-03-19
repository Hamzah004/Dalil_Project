import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/features/study_resource/domain/entities/study_resource.dart';
import 'package:dartz/dartz.dart';

abstract class StudyRecoursesRepository {
  Future<Either<Failure, List<StudyResource>>> getRecoursesByCourseId(
    String courseId,
  );
}
