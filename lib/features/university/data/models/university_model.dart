import 'package:dalil_project/features/university/domain/entities/university.dart';

class UniversityModel extends University {
  UniversityModel({
    required super.id,
    required super.arabicName,
    required super.englishName,
    required super.city,
    required super.country,
    required super.type,
    String? logo,
    universityWebsite,
  }) : super(
         logo: logo ?? '',
         universityWebsite: universityWebsite ?? '',
       ); // TODO: add default logo, universityWebsite
}
