import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < Breakpoints.sm) {
      return mobile; 
    } else {
      return desktop; 
    }
  }
}

class Breakpoints {
  static const sm = 850;
}
