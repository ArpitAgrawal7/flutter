import 'package:dartz/dartz.dart';
import 'package:make_my_trip/core/failure.dart';
import 'package:make_my_trip/feature/search/data/models/search_hotel_model.dart';

abstract class SearchHotelRepository {
  Future<Either<Failures, List<SearchHotelModel>>> getNearByPlacesList(
      String place);
}
