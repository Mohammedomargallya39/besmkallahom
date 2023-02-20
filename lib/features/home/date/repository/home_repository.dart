import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/adan_entity.dart';
import '../../domain/repository/home_base_repository.dart';
import '../data_source/home_remote_date_source.dart';


typedef CallAdan = Future<List<AdanEntity>> Function();

class HomeRepoImplementation extends HomeBaseRepository {
  final HomeBaseRemoteDataSource remoteDataSource;

  HomeRepoImplementation({
    required this.remoteDataSource,
  });

  Future<Either<Failure, List<AdanEntity>>> fetchData(
      CallAdan mainMethod,
      ) async {
    try {
      final adanData = await mainMethod();
      return Right(adanData);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        error: e.error,
        code: e.code,
        message: e.message,
      ));
    }
  }

  @override
  Future<Either<Failure, List<AdanEntity>>> adan(
      {
        required String year,
        required String month,
        required String day,
        required String lat,
        required String lng,
        required String method,
      }) async {
    return await fetchData(()
    {
      return remoteDataSource.adan(
        year: year,
        month: month,
        day: day,
        lat: lat,
        lng: lng,
        method: method,
      );
    });
  }
}