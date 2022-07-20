part of 'select_room_calculation_cubit.dart';

class SelectRoomCalculationState extends Equatable {
  final int superDeluxValue;
  final int deluxValue;
  final int semiDeluxValue;

  const SelectRoomCalculationState({
    required this.superDeluxValue,
    required this.deluxValue,
    required this.semiDeluxValue,
  });

  SelectRoomCalculationState copyWith({
    int? superDeluxValue,
    int? deluxValue,
    int? semiDeluxValue,
  }) =>
      SelectRoomCalculationState(
        superDeluxValue: superDeluxValue ?? this.superDeluxValue,
        deluxValue: deluxValue ?? this.deluxValue,
        semiDeluxValue: semiDeluxValue ?? this.semiDeluxValue,
      );

  @override
  List<Object?> get props => [
        superDeluxValue,
        deluxValue,
        semiDeluxValue,
      ];
}
