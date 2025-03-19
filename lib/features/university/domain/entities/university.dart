
class University {
  final String id;
  final String logo; // TODO Check the valid data type
  final String arabicName;
  final String englishName;
  final String city;
  final String country;
  final UniversityType type;
  final String universityWebsite;

  University({
    required this.id,
    required this.logo,
    required this.arabicName,
    required this.englishName,
    required this.city,
    required this.country,
    required this.type,
    required this.universityWebsite,
  });
}

enum UniversityType {
  public,
  private,
}
