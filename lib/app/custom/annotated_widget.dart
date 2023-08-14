import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnnotatedWidget extends StatelessWidget {
  const AnnotatedWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
      ),
      child: child,
    );
  }
}
