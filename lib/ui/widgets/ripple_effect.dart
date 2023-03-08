import 'package:flutter/material.dart';

class RippleEffect extends StatelessWidget {
  final VoidCallback? onPress;
  final Widget child;

  const RippleEffect({
    Key? key,
    required this.child,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(),
      ],
    );
  }
}
