import 'package:dalil_project/features/faculty/domain/entities/faculty.dart';

abstract class FacultyDataBaseDataSource {
  Future<List<Faculty>> getFacultiesByUniversityId(String universityId);
  Future<Faculty> getFacultyByStudentId(String studentId);
}

class FacultyDummyDataSourceImplementation implements FacultyDataBaseDataSource {
  @override
  Future<List<Faculty>> getFacultiesByUniversityId(String universityId) async {
    return [
      Faculty(
        id: '1',
        arabicName: 'كلية الأمير عبدالله بن غازي',
        englishName: 'Faculty of Abduallah bin Ghazi',
        universityId: '1',
      ),
    ];
  }

  @override
  Future<Faculty> getFacultyByStudentId(String studentId) {
    return Future.value(
      Faculty(
        id: '1',
        arabicName: 'كلية الأمير عبدالله بن غازي',
        englishName: 'Faculty of Abduallah bin Ghazi',
        universityId: '1',
      ),
    );
  }
}
