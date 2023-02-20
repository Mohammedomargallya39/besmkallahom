import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/adan_entity.dart';

abstract class HomeBaseRepository {
  Future<Either<Failure, List<AdanEntity>>> adan({
    required String year,
    required String month,
    required String day,
    required String lat,
    required String lng,
    required String method,
  });
}