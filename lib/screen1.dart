import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_widget.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: Expanded(
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                "Mobile",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        tablet: Expanded(
          child: Container(
            color: Colors.red,
            child: const Center(
              child: Text(
                "Tablet",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        desktop: Expanded(
          child: Container(
            color: Colors.green,
            child: const Center(
              child: Text(
                "Desktop",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
