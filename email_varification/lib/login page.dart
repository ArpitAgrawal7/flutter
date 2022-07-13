import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    resetPassword(email: email.text);
                  },
                  child: Text("Forget Password"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    signIn(
                        email: email.text,
                        password: password.text,
                        context: context);
                  },
                  child: const Text("verify")),
            ],
          ),
        ),
      ),
    );
  }
}

final auth = FirebaseAuth.instance;

Future signIn(
    {required String email,
    required String password,
    required BuildContext context}) async {
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
