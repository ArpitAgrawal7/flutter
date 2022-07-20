// import 'package:flutter/material.dart';
// import 'package:make_my_trip/core/text_theme.dart';
//
// class RoomCategoriesPage extends StatelessWidget {
//   RoomCategoriesPage({Key? key}) : super(key: key);
//
//   RoomCategoryModel? roomCategoryModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RoomCategoryCubit, BaseState>(
//       builder: (context, state) {
//         if (state is StateOnKnownToSuccess) {
//           roomCategoryModel = state.response;
//         }
//         return Scaffold(
//             backgroundColor: MakeMyTripColors.color30gray,
//             appBar: AppBar(
//               backgroundColor: MakeMyTripColors.accentColor,
//               leading: const Icon(Icons.arrow_back),
//               title: Center(
//                 child: Column(
//                   children: [
//                     Text(
//                       StringConstants.roomCategoriesPageHeading,
//                       style: AppTextStyles.infoContentStyle3
//                           .copyWith(fontSize: 15),
//                     ),
//                     Text(
//                       roomCategoryModel?.hotelName ?? "Hotel Name",
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.center,
//                       style: AppTextStyles.infoContentStyle3
//                           .copyWith(fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//               actions: const [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Icon(Icons.settings),
//                 ),
//               ],
//             ),
//             body: ListView.builder(
//               itemCount: roomCategoryModel?.roomData!.length,
//               itemBuilder: (context, index) {
//                 if (roomCategoryModel?.roomData![index] != null) {
//                   return RoomListWidget(
//                       roomData: roomCategoryModel!.roomData![index]);
//                 }
//                 return const CircularProgressIndicator();
//               },
//             ));
//       },
//     );
//   }
// }
