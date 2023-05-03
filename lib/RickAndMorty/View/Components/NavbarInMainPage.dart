import 'package:flutter/material.dart';

class NavbarInMainPage extends StatelessWidget {
  const NavbarInMainPage({
    Key? key,
    required this.index,
    required this.selected,
    required this.onPressed,
    required this.name,
  }) : super(key: key);

  final int index;
  final bool selected;
  final VoidCallback onPressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            selected ? Colors.black26 : Colors.white,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
          ),
        ),
        child: Text(
          name,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
