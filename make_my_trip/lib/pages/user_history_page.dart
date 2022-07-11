import 'package:flutter/material.dart';

class UserHistory extends StatelessWidget {
  const UserHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(Icons.arrow_back_ios),
                ),
                Text("History",style:  TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(Icons.notifications_outlined),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
