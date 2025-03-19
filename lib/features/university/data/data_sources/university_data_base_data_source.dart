import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/features/university/domain/entities/university.dart';

abstract class UniversityDataBaseDataSource {
  Future<List<University>> getAllUniversities();
  Future<University> getUniversityByStudentId(String studentId);
}

class UniversityDummyDataSourceImlementation implements UniversityDataBaseDataSource {
  @override
  Future<List<University>> getAllUniversities() async {
    return [
      University(
        arabicName: 'جامعة البلقاء',
        englishName: 'Al-Balqa',
        city: 'as-salt',
        country: 'jordan',
        type: UniversityType.public,
        id: '1',
        logo: '',
        universityWebsite: 'https://app1.bau.edu.jo:7799/reg_new/index.jsp',
      ),
    ];
  }

  @override
  Future<University> getUniversityByStudentId(String studentId) async {
    try {
      University university = University(
        arabicName: 'جامعة البلقاء',
        englishName: 'Al-Balqa',
        city: 'as-salt',
        country: 'jordan',
        type: UniversityType.public,
        id: '1',
        logo: '',
        universityWebsite: 'https://app1.bau.edu.jo:7799/reg_new/index.jsp',
      );
      return university;
    } catch (e) {
      throw ServerFailure();
    }
  }
}