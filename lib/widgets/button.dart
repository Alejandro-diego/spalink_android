import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NeuButton extends StatelessWidget {
  NeuButton(
      {Key? key,
      this.onTap,
      required this.isButtonPressed,
      required this.title,
      required this.cupertinoIcon})
      : super(key: key);

  final String title;

  final dynamic onTap;
  final IconData cupertinoIcon;

  bool isButtonPressed;

/*
  IconData volOff = const IconData(0xf785,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);
  IconData volOn = const IconData(0xf785,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);

      */

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 70.0,
        width: 150.0,
        decoration: BoxDecoration(
          border: Border.all(
              color: !isButtonPressed
                  ? const Color.fromARGB(255, 49, 45, 45)
                  : Colors.grey.shade900),
          color: Colors.black.withOpacity(.5),
          borderRadius: BorderRadius.circular(12),
          boxShadow: !isButtonPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.shade800,
                    offset: const Offset(6, 6),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  const BoxShadow(
                    color: Colors.black,
                    offset: Offset(-6, -6),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 98,
              child: Icon(
                !isButtonPressed ? cupertinoIcon : cupertinoIcon,
                size: !isButtonPressed ? 35 : 40,
                color: !isButtonPressed
                    ? Colors.grey[800]
                    : const Color.fromARGB(255, 85, 255, 85),
              ),
            ),
            Positioned(
              left: 10.0,
              top: 10,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: !isButtonPressed ? 12 : 15,
                    color: !isButtonPressed ? Colors.green : Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
