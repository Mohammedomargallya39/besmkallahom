import 'package:dio/dio.dart';
import '../../../../core/network/remote/api_endpoints.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../models/adan_model.dart';


abstract class HomeBaseRemoteDataSource {
  Future<List<AdanModel>> adan({
    required String year,
    required String month,
    required String day,
    required String lat,
    required String lng,
    required String method,
  });
}

class HomeRemoteDataSourceImpl
    implements HomeBaseRemoteDataSource {
  final DioHelper dioHelper;

  HomeRemoteDataSourceImpl({
    required this.dioHelper,
  });

  @override
  Future<List<AdanModel>> adan({
    required String year,
    required String month,
    required String day,
    required String lat,
    required String lng,
    required String method,
  }) async {
    final Response f = await dioHelper.get(
        base: baseAdanUrl,
        url: adanUrl,
        query: {
          'month': month,
          'year': year,
          'day': day,
          'latitude': lat,
          'longitude': lng,
          'method': method,
        }
    );
    return List<AdanModel>.from(
        (f.data['data'] as List).map((e) => AdanModel.fromJson(e)));
  }
}