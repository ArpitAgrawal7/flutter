import 'package:flutter/material.dart';

class RoomListViewWidget extends StatelessWidget {
  const RoomListViewWidget(
      {Key? key,
      required this.roomType,
      required this.roomDescription,
      required this.onIncrementTap,
      required this.onDecrementTap,
      required this.roomPrice,
      required this.roomImageUrl,
      required this.roomFeature1,
      required this.roomFeature2,
      required this.roomFeature3,
      required this.roomFeature4,
      required this.totalRequiredRoom})
      : super(key: key);

  final String roomFeature1;
  final String roomFeature2;
  final String roomFeature3;
  final String roomFeature4;
  final int roomPrice;
  final int totalRequiredRoom;
  final String roomType;
  final String roomImageUrl;
  final String roomDescription;
  final VoidCallback onIncrementTap;
  final VoidCallback onDecrementTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24.0, top: 16, bottom: 6.0),
          child: Text(
            roomType,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
                child: Text(
                  roomDescription,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      roomImageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      roomImageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                size: 15,
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      roomFeature1,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  )),
              const Spacer(),
              const Icon(
                Icons.star,
                size: 15,
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    roomFeature2,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                size: 15,
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    roomFeature3,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  )),
              const Spacer(),
              const Icon(
                Icons.star,
                size: 15,
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    roomFeature4,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
          child: GestureDetector(
            child: const Text(
              "More Details",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onDecrementTap,
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          Icon(
                            Icons.square_rounded,
                            size: 20,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.remove,
                            size: 15,
                            color: Colors.white,
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      totalRequiredRoom.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: onIncrementTap,
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          Icon(
                            Icons.square_rounded,
                            size: 20,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ]),
                  ),
                  const Spacer(),
                  Text(
                    "₹ $roomPrice p/night",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: const BorderSide(
                                color: Colors.white,
                                width: 1,
                              ))),
                      child: const Text(
                        "Book",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
