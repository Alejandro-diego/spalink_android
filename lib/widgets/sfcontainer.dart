import 'package:flutter/material.dart';


class SfContainer extends StatelessWidget {
  const SfContainer(
      {Key? key, required this.title, })
      : super(key: key);
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(.5),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 10,
            child: Text(title,style:const  TextStyle(color: Colors.green),),
          ),
         
        ],
      ),
    );
  }
}
