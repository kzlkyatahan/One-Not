import 'package:flutter/material.dart';

class PageRouteTransition extends AnimatedWidget {
  const PageRouteTransition({
    Key? key,
    required this.child,
    required this.animation,
  }) : super(key: key, listenable: animation);
  final Widget child;
  final Animation<double> animation;
  static final opacityTween = Tween<double>(begin: 0.0, end: 1.0);
  static final elevationTween = Tween<double>(begin: 6.0, end: 0.0);
  static final borderRadiusTween = BorderRadiusTween(
    begin: BorderRadius.circular(100.0),
    end: BorderRadius.zero,
  );
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Material(
      color: Theme.of(context).colorScheme.surfaceVariant,
      clipBehavior: Clip.antiAlias,
      elevation: elevationTween.evaluate(animation),
      borderRadius: borderRadiusTween.evaluate(animation),
      child: Opacity(
        opacity: opacityTween.evaluate(animation),
        child: child,
      ),
    );
  }
}