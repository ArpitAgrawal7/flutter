import 'package:email_varification/home.dart';
import 'package:email_varification/login%20page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      home: LoginPage(),
      // EmailVerification(),
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
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: email,
              ),
              TextFormField(
                controller: password,
              ),
              ElevatedButton(
                  onPressed: () {
                    signUp(
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

Future signUp(
    {required String email,
    required String password,
    required BuildContext context}) async {
  final auth = FirebaseAuth.instance;
  final User user;
  try {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = auth.currentUser!;
    await user.sendEmailVerification();
    print("email send");
    Future.delayed(const Duration(seconds: 20), () async {
      await user.reload();
      final myuser = auth.currentUser;
      print(myuser!.emailVerified);
      if (myuser.emailVerified) {
        print("verified");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } else {
        print("not verified");
      }
    });
  } on FirebaseAuthException {
    print('error');
  }
}
// arpitagrawal976@gmail.com
