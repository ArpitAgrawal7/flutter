import 'package:dartz/dartz.dart';
import 'package:make_my_trip/core/failure.dart';
import 'package:make_my_trip/core/usecase.dart';
import 'package:make_my_trip/feature/search/data/models/search_hotel_model.dart';
import 'package:make_my_trip/feature/search/domain/repositories/search_hotel_repository.dart';

class SearchHotelUseCases implements Usecase<List<SearchHotelModel>, String> {
  final SearchHotelRepository searchHotelRepository;

  SearchHotelUseCases(this.searchHotelRepository);

  @override
  Future<Either<Failures, List<SearchHotelModel>>> call(String places) async {
    return await searchHotelRepository.getNearByPlacesList(places);
  }
}
