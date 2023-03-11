import 'package:flutter/material.dart';
import 'package:not/controller/curved_rect_arc_tween_controller.dart';
import 'package:not/controller/page_route_transition_controller.dart';

class HeroPageRoute extends PageRouteBuilder {
  final String tag;
  final Widget child;
  HeroPageRoute({
    required this.tag,
    required this.child,
  }) : super(
    transitionDuration: Duration(milliseconds: 700),
    reverseTransitionDuration: Duration(milliseconds: 400),
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) {
      return Hero(
        tag: tag,
        createRectTween: (Rect? begin, Rect? end) {
          return CurvedRectArcTween(begin: begin, end: end);
        },
        child: PageRouteTransition(
          child: child,
          animation: animation,
        ),
      );
    },
  );
}