import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  //넘기는 parameter 값
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final String text;

  const MyContainer({
    super.key,
    required this.width,
    required this.height,
    required this.padding,
    required this.margin,
    required this.text,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      //넘긴 parameter값 적용
      width: width,
      height: height,
      margin: margin,
      padding: padding,

      //padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withAlpha(130),
              blurRadius: 8.0, // soften the shadow
              spreadRadius: 4.0, //extend the shadow
              offset: const Offset(
                8.0, // Move to right 10  horizontally
                8.0, // Move to bottom 10 Vertically
              ),
            ),
            BoxShadow(
              color: Colors.white.withAlpha(130),
              blurRadius: 8.0, // soften the shadow
              spreadRadius: 4.0, //extend the shadow
              offset: const Offset(
                -8.0, // Move to right 10  horizontally
                -8.0, // Move to bottom 10 Vertically
              ),
            ),
          ]),
      //container center는 어기서 설정
      child: Center(
        child: Text(
          text,
        ),
      ),
      //child: child,
    );
  }
}

