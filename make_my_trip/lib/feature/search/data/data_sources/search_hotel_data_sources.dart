import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:make_my_trip/core/failure.dart';
import 'package:make_my_trip/feature/search/data/models/search_hotel_model.dart';

abstract class SearchHotelDataSources {
  Future<Either<Failures, List<SearchHotelModel>>> getNearByPlaces(
      String place);
}

class SearchHotelDataSourcesImpl implements SearchHotelDataSources {
  final Dio dio;
  final String baseURL =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  final String kPLACES_API_KEY = 'AIzaSyDbEilehd2rVJUqlxUKXBrClnmIuMTYziY';

  SearchHotelDataSourcesImpl(this.dio);

  @override
  Future<Either<Failures, List<SearchHotelModel>>> getNearByPlaces(
      String place) async {
    try {
      String request = '$baseURL?input=$place&key=$kPLACES_API_KEY';
      var response = await dio.get(request);
      if (response.statusCode == 200) {
        return Right(response.data['predictions']);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
