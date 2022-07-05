import 'package:flutter/material.dart';

class ElevatedIconButtonView extends StatelessWidget {
  const ElevatedIconButtonView(
      {Key? key, required this.action, required this.onTap, required this.logo})
      : super(key: key);
  final String action;
  final VoidCallback onTap;
  final Icon logo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 36,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: logo,
        label: Text(action),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
