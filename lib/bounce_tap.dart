library bounce_tap;

import 'package:bounce_tap/constants.dart';
import 'package:bounce_tap/tap_intensity.dart';
import 'package:flutter/material.dart';

/// A Calculator.

class BounceTap extends StatefulWidget {
  final TapIntensity tapIntensity;

  final Widget child;

  final Duration? duration;

  final VoidCallback onTap;

  final VoidCallback? onLongPress;

  final int tapDelay;

  const BounceTap({
    super.key,
    required this.child,
    required this.onTap,
    this.tapIntensity = TapIntensity.weak,
    this.tapDelay = 300,
    this.duration,
    this.onLongPress,
  });

  @override
  State<BounceTap> createState() => _BounceTapState();
}

class _BounceTapState extends State<BounceTap>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  DateTime? tapDownTime;
  DateTime? tapUpTime;

  Duration get duration => widget.duration ?? const Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: widget.tapIntensity.value,
      duration: duration,
    )..addListener(() {
        setState(() {});
        print('ANIMATION VALUE: ${_animationController.value}\n');
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        child: Transform.scale(
          scale: 1 - _animationController.value,
          child: widget.child,
        ),
      );

  onTapDown(_) {
    tapDownTime = DateTime.now();
    _animationController.forward();
  }

  onTapUp(_) {
    tapUpTime = DateTime.now();
    final difference = tapUpTime!.difference(tapDownTime!);
    if (difference.inMilliseconds <= 200) {
      widget.onTap.delayed(Duration(milliseconds: widget.tapDelay));
    } else {
      if (difference.inMilliseconds < Constants.longPressThreshold) {
        widget.onLongPress?.delayed(Duration(milliseconds: widget.tapDelay));
      }
    }
    _animationController.reverse();
  }
}

extension on VoidCallback {
  delayed(Duration duration) {
    Future.delayed(duration).then((value) => this.call());
  }
}
