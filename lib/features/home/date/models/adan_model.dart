
import '../../domain/entities/adan_entity.dart';

class AdanModel extends AdanEntity {
  AdanModel({
    required super.timings,
    required super.date,
  });

  factory AdanModel.fromJson(Map<String, dynamic> json) {
    return AdanModel(
      timings: Timings.fromJson(json['timings']),
      date: json['date']['readable'],
    );
  }
}