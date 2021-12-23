import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late SplashAnimManager _splashAnimManager;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      _animationController.forward();
      Future.delayed(Duration(milliseconds: 1500), () {
        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPageScrollContainer()), (Route<dynamic> rout) => false);
        // Navigator.popAndPushNamed(context, '/home');
        Navigator.of(context).pushNamed(
          '/home',
        );
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    _splashAnimManager = SplashAnimManager(
      _animationController,
      screenWidth,
      (getTextWidth('Flutter') - getTextWidth('Dojo') - 4) / 2,
    );
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, widget) {
              return Positioned(
                right: _splashAnimManager.animLeft.value,
                child: Text(
                  'Flutter',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, widget) {
              return Positioned(
                left: _splashAnimManager.animRight.value,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 253, 152, 39),
                  ),
                  child: Text(
                    'Dojo',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  double getTextWidth(String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.width;
  }
}

class SplashAnimManager {
  final AnimationController controller;
  final Animation<double> animLeft;
  final Animation<double> animRight;
  final double screenWidth;
  final double offset;

  SplashAnimManager(this.controller, this.screenWidth, this.offset)
      : animLeft =
            Tween(begin: screenWidth, end: screenWidth / 2 - offset).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn,
          ),
        ),
        animRight =
            Tween(begin: screenWidth, end: screenWidth / 2 + offset).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn,
          ),
        );
}
