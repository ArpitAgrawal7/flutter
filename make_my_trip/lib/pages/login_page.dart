import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:make_my_trip/cubit/login_cubit.dart';
import 'package:make_my_trip/widgets/elevated_icon_button_widget.dart';
import 'package:make_my_trip/widgets/text_form_field_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 32),
                  child: Image.asset("assets/images/appLogo.png"),
                ),
                const Text("Meet new people from over millions of",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    "users. Create posts, find friends and more.",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    LoginTextFormFieldWidget(
                      hintText: "Email",
                      obSecure: false,
                      controller: email,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        if (state is ChangeState) {
                          return LoginTextFormFieldWidget(
                            hintText: "Password",
                            iconButton: IconButton(
                              icon: state.obSecure == true
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () {
                                BlocProvider.of<LoginCubit>(context)
                                    .changeObSecureEvent(state.obSecure);
                              },
                            ),
                            obSecure: state.obSecure,
                            controller: password,
                          );
                        } else {
                          return LoginTextFormFieldWidget(
                            hintText: "Password",
                            iconButton: IconButton(
                              icon: const Icon(Icons.visibility_off),
                              onPressed: () {
                                BlocProvider.of<LoginCubit>(context)
                                    .changeObSecureEvent(true);
                              },
                            ),
                            obSecure: true,
                            controller: password,
                          );
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 22.0),
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 28.0),
                        child: LoginElevatedButtonWidget(
                          height: 40,
                          onTap: () {},
                          width: double.infinity,
                          buttonColor: Colors.blue,
                          child: const Text("Login"),
                        )),
                  ]),
                ),
                Row(children: const [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 32.0, right: 8.0),
                    child: Divider(thickness: 0.5, color: Colors.black54),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(
                      "Or Login with",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 32.0),
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black54,
                    ),
                  )),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginElevatedButtonWidget(
                        onTap: () {},
                        height: 36,
                        width: 150,
                        buttonColor: const Color(0xFF4267B2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Facebook"),
                            SvgPicture.asset(
                              "assets/images/facebook.svg",
                              height: 20,
                              width: 20,
                            ),
                          ],
                        )),
                    LoginElevatedButtonWidget(
                      onTap: () {},
                      height: 36,
                      width: 150,
                      buttonColor: const Color(0xFFEEEEEE),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Google",
                            style: TextStyle(color: Colors.black),
                          ),
                          SvgPicture.asset(
                            "assets/images/google.svg",
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Or don't have account?",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
