import 'dart:async';

import 'package:email_varification/verify_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<VerifyCubit>(
        create: (context) => VerifyCubit(),
        child: EmailVerification(),
      ),
    );
  }
}

class EmailVerification extends StatelessWidget {
  EmailVerification({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: email,
                ),
                TextFormField(
                  controller: password,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      context
                          .read<VerifyCubit>()
                          .resetPassword(email: email.text);
                    },
                    child: const Text("Forgot Password"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<VerifyCubit>().signUp(
                              email: email.text, password: password.text);
                        },
                        child: const Text("Sign Up")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<VerifyCubit>().signIn(
                              email: email.text, password: password.text);
                        },
                        child: const Text("Login")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final auth = FirebaseAuth.instance;

Future signUp({required String email, required String password}) async {
  final User user;
  try {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = auth.currentUser!;
    await user.sendEmailVerification();
    print("email send");
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      await user.reload();
      final myUser = auth.currentUser;
      print(myUser!.emailVerified);
      if (myUser.emailVerified) {
        print("verified");
        timer.cancel();
      }
    });
  } on FirebaseAuthException {
    print('error');
  }
}
// arpitagrawal976@gmail.com

Future signIn({required String email, required String password}) async {
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    print("sign IN");
  } on FirebaseAuthException {
    print('sign in error');
  }
}

Future resetPassword({required String email}) async {
  try {
    await auth.sendPasswordResetEmail(email: email);
    print('password reset email send');
  } on FirebaseAuthException {
    print('password error');
  }
}
