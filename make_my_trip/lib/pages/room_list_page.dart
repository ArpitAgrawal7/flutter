import 'package:flutter/material.dart';
import 'package:make_my_trip/widgets/room_list_view_widget.dart';

class RoomListPage extends StatelessWidget {
  const RoomListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: Row(

        ),
        actions: const [
          Icon(Icons.settings),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const RoomListViewWidget();
        },
        itemCount: 6,
      )
    );
  }
}
