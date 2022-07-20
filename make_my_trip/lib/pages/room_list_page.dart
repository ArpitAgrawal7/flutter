import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_trip/cubit/select_room_calculation_cubit.dart';
import 'package:make_my_trip/widgets/room_list_view_widget.dart';

class RoomListPage extends StatelessWidget {
  const RoomListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List roomType = ['Delux', 'SemiDelux', 'SuperDelux'];
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: Center(
            child: Column(
              children: const [
                Text(
                  "SELECT A ROOM",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Hotel Name",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.settings),
            ),
          ],
        ),
        body:
            BlocBuilder<SelectRoomCalculationCubit, SelectRoomCalculationState>(
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return RoomListViewWidget(
                  roomImageUrl: 'assets/images/hotel.png',
                  roomType: roomType[index],
                  onDecrementTap: () {
                    if (roomType[index] == 'Delux') {
                      context
                          .read<SelectRoomCalculationCubit>()
                          .deluxRemoveRoom(state.deluxValue);
                    } else if (roomType[index] == 'SemiDelux') {
                      context
                          .read<SelectRoomCalculationCubit>()
                          .semiDeluxRemoveRoom(state.semiDeluxValue);
                    } else if (roomType[index] == 'SuperDelux') {
                      context
                          .read<SelectRoomCalculationCubit>()
                          .superDeluxRemoveRoom(state.superDeluxValue);
                    }
                  },
                  roomFeature4: 'Free Wifi',
                  roomPrice: 100000,
                  onIncrementTap: () {
                    if (roomType[index] == 'Delux') {
                      context
                          .read<SelectRoomCalculationCubit>()
                          .deluxAddRoom(state.deluxValue);
                    } else if (roomType[index] == 'SemiDelux') {
                      context
                          .read<SelectRoomCalculationCubit>()
                          .semiDeluxAddRoom(state.semiDeluxValue);
                    } else if (roomType[index] == 'SuperDelux') {
                      context
                          .read<SelectRoomCalculationCubit>()
                          .superDeluxAddRoom(state.superDeluxValue);
                    }
                  },
                  roomDescription: 'Description',
                  totalRequiredRoom: (roomType[index] == 'Delux')
                      ? state.deluxValue
                      : (roomType[index] == 'SuperDelux')
                          ? state.superDeluxValue
                          : state.semiDeluxValue,
                  roomFeature1: '70m\'2',
                  roomFeature3: 'Air Conditioning',
                  roomFeature2: 'Flat-Screen Tv',
                );
              },
              itemCount: 3,
            );
          },
        ));
  }
}
