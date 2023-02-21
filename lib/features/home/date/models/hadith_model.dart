import '../../domain/entities/hadith_entity.dart';

class HadithModel extends HadithEntity {
  HadithModel({
    required super.hadithId,
    required super.hadithArabic,
  });

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
      hadithId: json['id'],
      hadithArabic: json['hadithArabic'],
    );
  }
}