import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/RandomColorGenerator.dart';
import '../widgets/animated/wave_from_tap.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin, RandomColorGenerator {
  AnimationController _waveController;
  Animation<double> _waveAnimation;
  Offset _tapPoint = Offset(1.0, 1.0);
  var _backgroundColor = Colors.black;
  var _waveColor = Colors.black;

  @override
  void initState() {
    _waveController = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );

    _waveAnimation = Tween<double>(
      begin: 0.0,
      end: 3000.0,
    ).animate(_waveController);
    super.initState();
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        onTapDown: (details) {
          _changeColor(context, details);
        },
        child: Stack(
          children: <Widget>[
            Container(
              color: _backgroundColor,
            ),
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: WaveFromTap(
                animation: _waveAnimation,
                tapPoint: _tapPoint,
                color: _waveColor,
              ),
            ),
            Center(
              child: const Text(
                'Hey there',
                style: TextStyle(
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeColor(context, details) {
    _waveController.reset();
    _setTapPoint(details);
    setState(() {
      _backgroundColor = _waveColor;
      _waveColor = randomColor;
    });
    _waveController.forward();
  }

  _setTapPoint(details) {
    final RenderBox box = context.findRenderObject();
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    _tapPoint = localOffset;
  }
}
