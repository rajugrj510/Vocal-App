import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(
          icon,
          color: Colors.white,
        ),
        elevation: 3.0,
        shape: const CircleBorder(),
        fillColor: Colors.black,
        constraints: BoxConstraints.tightFor(
          width: 40.0,
          height: 40.0,
        ),
        onPressed: onPressed);
  }
}
