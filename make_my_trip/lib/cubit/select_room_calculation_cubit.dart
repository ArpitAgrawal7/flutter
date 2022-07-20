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

  void superDeluxAddRoom(int superDeluxAdditionRoom) {
    emit(state.copyWith(superDeluxValue: superDeluxAdditionRoom + 1));
  }

  void superDeluxRemoveRoom(int superDeluxSubstractionRoom) {
    if (superDeluxSubstractionRoom > 0) {
      emit(state.copyWith(superDeluxValue: superDeluxSubstractionRoom - 1));
    }
  }

  void deluxAddRoom(int deluxAdditionRoom) {
    emit(state.copyWith(deluxValue: deluxAdditionRoom + 1));
  }

  void deluxRemoveRoom(int deluxSubstractionRoom) {
    if (deluxSubstractionRoom > 0) {
      emit(state.copyWith(deluxValue: deluxSubstractionRoom - 1));
    }
  }

  void semiDeluxAddRoom(int semiDeluxAdditionRoom) {
    emit(state.copyWith(semiDeluxValue: semiDeluxAdditionRoom + 1));
  }

  void semiDeluxRemoveRoom(int semiDeluxSubstractionRoom) {
    if (semiDeluxSubstractionRoom > 0) {
      emit(state.copyWith(semiDeluxValue: semiDeluxSubstractionRoom - 1));
    }
  }
}
