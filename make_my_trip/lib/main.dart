import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_trip/cubit/select_room_calculation_cubit.dart';
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
          BlocProvider<SelectRoomCalculationCubit>(
        create: (context) => SelectRoomCalculationCubit(),
        child: const RoomListPage(),
      ),
      // UserHistory(),
    );
  }
}
