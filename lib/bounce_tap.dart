library bounce_tap;

import 'package:bounce_tap/constants.dart';
import 'package:bounce_tap/tap_intensity.dart';
import 'package:flutter/material.dart';

/// A Calculator.

class BounceTap extends StatefulWidget {
  /// this defines how hard you want the widget to bounce on tap
  final TapIntensity tapIntensity;

  /// this is your widget child
  final Widget child;

  /// This is a user defined duration
  final Duration? duration;

  /// this callback triggers when your widget is tapped
  final VoidCallback onTap;

  /// this callback triggers when your widget is pressed for a long time
  final VoidCallback? onLongPress;

  /// it sets how much time must pass before executing onTap/onLongPress callbacks
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
  /// this handles the animation
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

        ///listens to the animation and updates the app state
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

    ///Firing the animation right away
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

    ///now reverse the animation
    _animationController.reverse();
  }
}

extension on VoidCallback {
  delayed(Duration duration) {
    Future.delayed(duration).then((value) => this.call());
  }
}
