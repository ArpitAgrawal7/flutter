import 'package:flutter/material.dart';

class HistoryListViewWidget extends StatelessWidget {
  const HistoryListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child:
                      Image.asset("assets/images/hotel.png", fit: BoxFit.fill),
                ),
                title: const Text(
                  "HOTEL OR TOUR NAME",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                subtitle: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            size: 16,
                          ),
                          Text("Location"),
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        Text("7 Days"),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("12 Jul,22 - 19JUl,22"),
                        ),
                      ],
                    ),
                  ],
                ),
                // trailing: Container(
                //   color: Colors.blue,
                //   child: const Text("₹ 100000"),
                // ),
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
