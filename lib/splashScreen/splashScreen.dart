import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes_name.dart';
import '../services/theme/app_assets.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  var begin = Offset.zero;
  var end = Offset(0, 0);
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween(begin: begin, end: end).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(milliseconds: 900), () {
            Get.offNamed(Routes.login);
          });
          _firstHeight = 1000;
          _firstWidth = 1000;
          _firstTop = 0;
          _firstLeft = 0;
          _radius = 0;
          _secondHeight = 1000;
          _secondWidth = 1000;
          _secondBottom = 0;
          _secondRight = 0;
          _conColor = const Color(0xFFF26511);
          _thirdHeight = 1000;
          _thirdWidth = 1000;
          _thirdTop = 0;
          _thirdRight = 0;
        }
      })
      ..addListener(() {
        setState(() {
          _firstHeight = 200;
          _firstWidth = 200;
          _firstTop = 0;
          _firstLeft = 0;
          _radius = 300;
          _secondHeight = 250;
          _secondWidth = 250;
          _secondBottom = 0;
          _secondRight = 0;
          _conColor = Colors.white;
          _thirdHeight = 120;
          _thirdWidth = 120;
          _thirdTop = 100;
          _thirdRight = -60;
        });
        print("${_animation.value}");
      });
    _controller..forward();
    super.initState();
  }

  double _firstHeight = 1000;
  double _firstWidth = 1000;
  double _firstTop = 0;
  double _firstLeft = 0;
  double _radius = 0;
  double _secondHeight = 1000;
  double _secondWidth = 1000;
  double _secondBottom = 0;
  double _secondRight = 0;
  Color _conColor = const Color(0xFFF26511);
  double _thirdHeight = 1000;
  double _thirdWidth = 1000;
  double _thirdTop = 0;
  double _thirdRight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.SplashScreen,
          ),
          AnimatedPositioned(
            top: _thirdTop,
            right: _thirdRight,
            duration: const Duration(seconds: 3),
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              height: _thirdHeight,
              width: _thirdWidth,
              decoration: BoxDecoration(
                  color: _conColor,
                  // shape: BoxShape.circle,
                  border: Border.all(width: 10, color: const Color(0xFFF26511)),
                  borderRadius: BorderRadius.circular(_radius)),
            ),
          ),
          AnimatedPositioned(
            top: _firstTop,
            left: _firstLeft,
            duration: const Duration(seconds: 3),
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              height: _firstHeight,
              width: _firstWidth,
              decoration: BoxDecoration(
                  color: const Color(0xFFF26511),
                  borderRadius: BorderRadius.only(
                    //topRight: Radius.circular(_radius),
                    bottomRight: Radius.circular(_radius),
                    // bottomLeft: Radius.circular(80)
                  )),
            ),
          ),
          AnimatedPositioned(
            bottom: _secondBottom,
            right: _secondRight,
            duration: const Duration(seconds: 3),
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              height: _secondHeight,
              width: _secondWidth,
              decoration: BoxDecoration(
                  color: const Color(0xFFF26511),
                  borderRadius: BorderRadius.only(
                    //topRight: Radius.circular(_radius),
                    topLeft: Radius.circular(_radius),
                    // bottomLeft: Radius.circular(80)
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
