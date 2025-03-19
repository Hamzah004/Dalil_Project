import 'package:dalil_project/features/study_resource/data/models/study_recource_model.dart';

abstract class StudyResourceDummyDataSource {
  Future<List<StudyResourceModel>> getRecoursesByCourseId(String courseId);
}

class StudyResourceDataBaseDataSourceImplementation
    implements StudyResourceDummyDataSource {
  @override
  Future<List<StudyResourceModel>> getRecoursesByCourseId(String courseId) async {
    return [
      StudyResourceModel(
        courseId: courseId,
        descreption: 'Osama Elzero',
        url: 'https://elzero.org/',
      ),
    ];
  }
}
