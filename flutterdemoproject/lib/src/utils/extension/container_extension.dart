import 'package:flutter/material.dart';

extension ContainerExtension on Container {
  Container withRoundCorners(
          {required Color backgroundColor, double? radius}) =>
      Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 25),
          ),
        ),
        child: this,
      );

  Container withShadow(
          {Color shadowColor = Colors.grey,
          double blurRadius = 20.0,
          double spreadRadius = 1.0,
          Offset offset = const Offset(10.0, 10.0)}) =>
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: blurRadius,
                spreadRadius: spreadRadius,
                offset: offset),
          ],
        ),
        child: this,
      );
}
extension WidgetExtension on Widget{
  Widget margin(EdgeInsets edge){
    return Container(
      margin: edge,
      child: this,
    );
  }
}
