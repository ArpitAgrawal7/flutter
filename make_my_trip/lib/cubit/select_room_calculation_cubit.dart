import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_room_calculation_state.dart';

class SelectRoomCalculationCubit extends Cubit<SelectRoomCalculationState> {
  SelectRoomCalculationCubit()
      : super(const SelectRoomCalculationState(
          deluxValue: 0,
          superDeluxValue: 0,
          semiDeluxValue: 0,
        ));

  void addRoomEvent(String roomType, int addRoomValue) {
    if (roomType == 'Delux') {
      emit(state.copyWith(deluxValue: addRoomValue + 1));
    } else if (roomType == 'SemiDelux') {
      emit(state.copyWith(semiDeluxValue: addRoomValue + 1));
    } else {
      emit(state.copyWith(superDeluxValue: addRoomValue + 1));
    }
  }

  void removeRoomEvent(String roomType, int removeRoomValue) {
    if (removeRoomValue > 0) {
      if (roomType == 'Delux') {
        emit(state.copyWith(deluxValue: removeRoomValue - 1));
      } else if (roomType == 'SemiDelux') {
        emit(state.copyWith(semiDeluxValue: removeRoomValue - 1));
      } else {
        emit(state.copyWith(superDeluxValue: removeRoomValue - 1));
      }
    }
  }
}
