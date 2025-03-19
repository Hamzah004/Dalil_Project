// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/features/study_resource/domain/entities/study_resource.dart';
import 'package:dalil_project/features/study_resource/domain/repositories/study_recourses_repositories.dart';
import 'package:dartz/dartz.dart';

class GetStudyRecoursesByCourseIdUseCase {
  final StudyRecoursesRepository studyRecoursesRepository;

  GetStudyRecoursesByCourseIdUseCase({required this.studyRecoursesRepository});

  Future<Either<Failure, List<StudyResource>>> call(String courseId) async {
    return await studyRecoursesRepository.getRecoursesByCourseId(courseId);
  }
}
