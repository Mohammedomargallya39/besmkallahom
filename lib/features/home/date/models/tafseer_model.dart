import '../../domain/entities/tafseer_entity.dart';

class TafseerModel extends TafseerEntity {
  TafseerModel({
    required super.tafseerId,
    required super.ayahNumber,
    required super.ayahUrl,
    required super.tafseerName,
    required super.tafseer,
  });

  factory TafseerModel.fromJson(Map<String, dynamic> json) {
    return TafseerModel(
      tafseerId: json['tafseer_id'],
      tafseerName: json['tafseer_name'],
      ayahUrl: json['ayah_url'],
      ayahNumber: json['ayah_number'],
      tafseer: json['text'],
    );
  }
}