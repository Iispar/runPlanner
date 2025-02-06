import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.desktop,
    required this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < Breakpoints.sm) {
      return mobile;
    } else {
      if (width < Breakpoints.md) {
        return tablet;
      } else {
        return desktop;
      }
    }
  }
}

class Breakpoints {
  static const sm = 600;
  static const md = 860;
}
