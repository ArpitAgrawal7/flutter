import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_trip/cubit/select_room_calculation_cubit.dart';
import 'package:make_my_trip/widgets/room_list_view_widget.dart';

class RoomListPage extends StatelessWidget {
  const RoomListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            return ListView(
              children: [
                RoomListViewWidget(
                  roomImageUrl: 'assets/images/hotel.png',
                  roomType: "Delux",
                  onDecrementTap: () {
                    context
                        .read<SelectRoomCalculationCubit>()
                        .removeRoomEvent("Delux", state.deluxValue);
                  },
                  roomFeature4: 'Free Wifi',
                  roomPrice: 100000,
                  onIncrementTap: () {
                    context
                        .read<SelectRoomCalculationCubit>()
                        .addRoomEvent("Delux", state.deluxValue);
                  },
                  roomDescription: 'Description',
                  totalRequiredRoom: state.deluxValue,
                  roomFeature1: '70m\'2',
                  roomFeature3: 'Air Conditioning',
                  roomFeature2: 'Flat-Screen Tv',
                ),
                RoomListViewWidget(
                  roomImageUrl: 'assets/images/hotel.png',
                  roomType: 'SuperDelux',
                  onDecrementTap: () {
                    context
                        .read<SelectRoomCalculationCubit>()
                        .removeRoomEvent("SuperDelux", state.superDeluxValue);
                  },
                  roomFeature4: 'Free Wifi',
                  roomPrice: 100000,
                  onIncrementTap: () {
                    context
                        .read<SelectRoomCalculationCubit>()
                        .addRoomEvent("SuperDelux", state.superDeluxValue);
                  },
                  roomDescription: 'Description',
                  totalRequiredRoom: state.superDeluxValue,
                  roomFeature1: '70m\'2',
                  roomFeature3: 'Air Conditioning',
                  roomFeature2: 'Flat-Screen Tv',
                ),
                RoomListViewWidget(
                  roomImageUrl: 'assets/images/hotel.png',
                  roomType: "SemiDelux",
                  onDecrementTap: () {
                    context
                        .read<SelectRoomCalculationCubit>()
                        .removeRoomEvent("SemiDelux", state.semiDeluxValue);
                  },
                  roomFeature4: 'Free Wifi',
                  roomPrice: 100000,
                  onIncrementTap: () {
                    context
                        .read<SelectRoomCalculationCubit>()
                        .addRoomEvent("SemiDelux", state.semiDeluxValue);
                  },
                  roomDescription: 'Description',
                  totalRequiredRoom: state.semiDeluxValue,
                  roomFeature1: '70m\'2',
                  roomFeature3: 'Air Conditioning',
                  roomFeature2: 'Flat-Screen Tv',
                ),
              ],
            );
          },
        ));
  }
}
