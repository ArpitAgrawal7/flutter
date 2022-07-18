import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp({required String email, required String password}) async {
    User user;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(Success());
      user = _auth.currentUser!;
      print(user);
      await user.sendEmailVerification();
      print("email send");
      Timer.periodic(const Duration(seconds: 5), (timer) async {
        await user.reload();
        final myUser = _auth.currentUser;
        print(myUser!.emailVerified);
        if (myUser.emailVerified) {
          print("verified");
          timer.cancel();
        }
      });
    } on FirebaseAuthException catch (e) {
      emit(Error(e.message.toString()));
    }
  }

  Future signIn({required String email, required String password}) async {
    try {
      if (_auth.currentUser!.emailVerified) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        print("sign in");
        emit(Success());
      } else {
        emit(NotVerifiedState());
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  Future resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print('password reset email send');
    } on FirebaseAuthException {
      print('password error');
    }
  }
}
