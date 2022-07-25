import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_trip/core/base_state.dart';
import 'package:make_my_trip/core/make_my_trip_colors.dart';
import 'package:make_my_trip/core/string_constant.dart';
import 'package:make_my_trip/feature/search/presentation/cubit/search_hotel_cubit.dart';

class SearchHotelPage extends StatelessWidget {
  const SearchHotelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstants.searchPageTitle,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: StringConstants.searchPageTitle,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
              onChanged: (String query) {
                context.read<SearchHotelCubit>().getHotelList(query);
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: BlocBuilder<SearchHotelCubit, BaseState>(
                    builder: (context, state) {
                  if (state is StateOnKnownToSuccess) {
                    print(state.response);
                    return ListView.builder(
                      itemCount: state.response.length,
                      itemBuilder: (context, index) {
                        return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: MakeMyTripColors.color50gray),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    state.response.hotelList,
                                    arguments: {
                                      'city_name': state.response[index]
                                          ['description']
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text(state.response[index]['description']),
                              ),
                            ));
                      },
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
