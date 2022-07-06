import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:make_my_trip/widgets/list_view_builder_widget.dart';

class HotelListPage extends StatelessWidget {
  const HotelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                          // const Spacer(),
                          const Text(
                            "Hotel Search Page",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/images/filter.svg",
                      color: Colors.blue,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
              width: double.infinity,
              color: Colors.white,
              child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Recommended for you",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const ListViewBuilderWidget();
                },
                itemCount: 6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
