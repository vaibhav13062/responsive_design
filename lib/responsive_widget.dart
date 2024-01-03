import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  static isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 767;
  }

  static isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 767 &&
        MediaQuery.of(context).size.width < 1024;
  }

  static isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1024) {
        return desktop;
      } else if (constraints.maxWidth < 1024 && constraints.maxWidth >= 767) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
