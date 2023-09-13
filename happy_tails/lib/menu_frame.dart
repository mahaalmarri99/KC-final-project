import 'package:flutter/material.dart';
import 'package:happy_tails/adoption_screen.dart';
import 'package:happy_tails/menu_screen.dart';

class MenuFrame extends StatefulWidget {
  @override
  State<MenuFrame> createState() => _MenuFrameState();
}

class _MenuFrameState extends State<MenuFrame>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> scaleAnimation;
  Duration duration = Duration(milliseconds: 200);
  bool menuOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration);
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.6).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    final decviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        menuScreen(),
        AnimatedPositioned(
          duration: duration,
          top: 0,
          bottom: 0,
          left: menuOpen ? decviceWidth * 0.55 : 0.0,
          right: menuOpen ? -decviceWidth * -0.45 : 0.0,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: GestureDetector(
              onTap: () {
                if (menuOpen) {
                  setState(() {
                    menuOpen = false;
                    _animationController.reverse();
                  });
                }
              },
              child: AbsorbPointer(
                absorbing: menuOpen,
                child: Material(
                  animationDuration: duration,
                  borderRadius: BorderRadius.circular(menuOpen ? 30.0 : 0.0),
                  child: adoptionScreen(
                    menuCallback: () {
                      setState(() {
                        menuOpen = true;
                        _animationController.forward();
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
