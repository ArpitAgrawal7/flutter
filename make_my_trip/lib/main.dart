import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_trip/cubit/select_room_calculation_cubit.dart';
import 'package:make_my_trip/feature/search/data/data_sources/search_hotel_data_sources.dart';
import 'package:make_my_trip/feature/search/data/repositories/search_hotel_repository_impl.dart';
import 'package:make_my_trip/feature/search/domain/repositories/search_hotel_repository.dart';
import 'package:make_my_trip/feature/search/domain/use_cases/search_hotel_use_cases.dart';
import 'package:make_my_trip/feature/search/presentation/cubit/search_hotel_cubit.dart';
import 'package:make_my_trip/feature/search/presentation/pages/search_hotel_page.dart';
import 'package:make_my_trip/pages/hotel_list_page.dart';
import 'package:make_my_trip/pages/login_page.dart';
import 'package:make_my_trip/pages/room_list_page.dart';
import 'package:make_my_trip/pages/user_history_page.dart';
import 'package:make_my_trip/widgets/history_list_view_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          // LoginPage(),
          //   HotelListPage(),
          //     BlocProvider<SelectRoomCalculationCubit>(
          //   create: (context) => SelectRoomCalculationCubit(),
          //   child: const RoomListPage(),
          // ),
          BlocProvider<SearchHotelCubit>(
        create: (context) => SearchHotelCubit(SearchHotelUseCases(
            SearchHotelRepositoryImpl(SearchHotelDataSourcesImpl(Dio())))),
        child: const SearchHotelPage(),
      ),
      // UserHistory(),
    );
  }
}
