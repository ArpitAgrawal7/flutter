import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_trip/cubit/login_cubit.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final IconButton? iconButton;
  final bool obSecure;

  TextFormFieldWidget({Key? key, required this.hintText, this.iconButton, required this.obSecure})
      : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 28.0, right: 28.0),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return TextFormField(
              obscureText: false,
              controller: hintText == "Email" ? email : password,
              decoration: InputDecoration(
                  hintText: hintText,
                  suffixIcon: iconButton,
                  hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  fillColor: Colors.grey[280],
                  filled: true,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  )),
            );
          },
        ),
      ),
    );
  }
}
