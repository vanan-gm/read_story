import 'package:flutter/material.dart';
import 'package:read_story/config/config.dart';
import 'package:read_story/constant/constants.dart';

class RippleEffect extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? radius;
  final Widget child;

  const RippleEffect({
    Key? key,
    required this.child,
    this.onPressed,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Material(
            color: AppColors.transparent,
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(radius ?? AppConstants.radiusImage),
            ),
          ),
        ),
      ],
    );
  }
}
