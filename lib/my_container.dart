import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  // 넘기는 parameter 값
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final String text;

  const MyContainer({
    Key? key, // Corrected key parameter
    required this.width,
    required this.height,
    required this.padding,
    required this.margin,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 넘긴 parameter값 적용
      width: width,
      height: height,
      margin: margin,
      padding: padding,

      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(130),
            blurRadius: 8.0, // soften the shadow
            spreadRadius: 4.0, // extend the shadow
            offset: const Offset(
              8.0, // Move to right 10  horizontally
              8.0, // Move to bottom 10 Vertically
            ),
          ),
          BoxShadow(
            color: Colors.white.withAlpha(130),
            blurRadius: 8.0, // soften the shadow
            spreadRadius: 4.0, // extend the shadow
            offset: const Offset(
              -8.0, // Move to right 10  horizontally
              -8.0, // Move to bottom 10 Vertically
            ),
          ),
        ],
      ),
      // container center는 여기서 설정
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 20.0,
            fontWeight: FontWeight.w600, // Replace the period with a comma
          ),
        ),
      ),
    );
  }
}
