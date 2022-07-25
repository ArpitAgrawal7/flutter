import 'package:dartz/dartz.dart';
import 'package:make_my_trip/core/failure.dart';
import 'package:make_my_trip/feature/search/data/data_sources/search_hotel_data_sources.dart';
import 'package:make_my_trip/feature/search/data/models/search_hotel_model.dart';
import 'package:make_my_trip/feature/search/domain/repositories/search_hotel_repository.dart';

class SearchHotelRepositoryImpl implements SearchHotelRepository {
  final SearchHotelDataSourcesImpl searchHotelDataSourcesImpl;

  SearchHotelRepositoryImpl(this.searchHotelDataSourcesImpl);

  @override
  Future<Either<Failures, List<SearchHotelModel>>> getNearByPlacesList(
      String place) {
    return searchHotelDataSourcesImpl.getNearByPlaces(place);
  }
}
