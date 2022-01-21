import 'package:flutter/material.dart';

class DrawerFunctions {
  final AnimationController animationController;
  final double maxSlide;
  final BuildContext context;
  DrawerFunctions({
    required this.animationController,
    required this.maxSlide,
    required this.context,
  });

  void onDragStart(DragStartDetails details) {
    double minDragStartEdge = 225.0;
    double maxDragStartEdge = 225.0;
    bool isDragOpenFromLeft = animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromLeft = animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    bool canBeDragged = isDragOpenFromLeft || isDragCloseFromLeft;
  }

  void onDragUpdate(DragUpdateDetails details) {
    bool canBeDragged = true;
    if (canBeDragged) {
      double delta = details.primaryDelta! / maxSlide;
      animationController.value += delta;
    }
  }

  void onDragEnd(DragEndDetails details) {
    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 345) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  void toggle() {
    animationController.isDismissed
        ? animationController.forward()
        : animationController.reverse();
  }
}
