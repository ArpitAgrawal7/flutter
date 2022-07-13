part of 'verify_cubit.dart';

@immutable
abstract class VerifyState {}

class VerifyInitial extends VerifyState {}

class VerifiedState extends VerifyState {}

class NotVerifiedState extends VerifyState {}

class Success extends VerifiedState {}

class Error extends VerifiedState {
  final String error;

  Error(this.error);
}
