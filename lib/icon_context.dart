// ignore: file_names
import 'package:flutter/material.dart';

class Iconcontext extends StatelessWidget {
  Iconcontext({
    @required this.icon,
    @required this.value,
    @required this.size,
  });
  final IconData? icon;
  final String? value;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: size,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
