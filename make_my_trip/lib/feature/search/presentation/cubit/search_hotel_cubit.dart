import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:make_my_trip/core/base_state.dart';
import 'package:make_my_trip/feature/search/domain/use_cases/search_hotel_use_cases.dart';

class SearchHotelCubit extends Cubit<BaseState> {
  final SearchHotelUseCases searchHotelUseCases;
  Timer? _debounce;

  SearchHotelCubit(this.searchHotelUseCases) : super(StateInitial());

  void getHotelList(String places) async {
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      final res = await searchHotelUseCases.call(places);
      res.fold(
          (l) => emit(StateNoData()), (r) => emit(StateOnKnownToSuccess(r)));
    });
  }
}
