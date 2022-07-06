import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(
                'assets/images/hotel.png',
                fit: BoxFit.fill,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Row(
            children: [
              const Text(
                "edjdjiuroiorippripripirorijd",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 10,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.3),
                  itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                  onRatingUpdate: (rating) {}),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 12.0, right: 12.0, top: 4.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Flexible(
                flex: 9,
                child: Text(
                  "Addresssssssssssssssssshssjssgggjgjoehrigh ieegrrhyhhhhhhhhhhhhhhhhhhphjgjjjjfkjgjgpjopgjtoghoejpowgjnojtohktohkoykhkypjkmkmyjipykmjp[kypkmjnp[]kymbhpmymkh[yk0jiy[khjky[jpykpjiy",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              Flexible(
                flex: 2,
                child: Text(
                  "₹ 100000",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Divider(
            thickness: 1,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
