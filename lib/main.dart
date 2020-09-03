import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: LogoApp(),
  );
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build (BuildContext context) => GrowTransition(
    animation: animation,
    child: LogoWidget(),
  );
}

class GrowTransition extends StatelessWidget {
  GrowTransition({Key key, this.child, this.animation})
    : assert(child != null),
      assert(animation != null),
      super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) => Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
      ),
    ),
  );
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: FlutterLogo(),
  );
}
