import 'package:flutter/material.dart';

class ContainerBackgraund extends StatelessWidget {
  const ContainerBackgraund({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.95,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.7),
        
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          
          
          
          color: Colors.green),
      ),
    );
  }
}
