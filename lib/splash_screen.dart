import 'package:coding_juniors_assgnment/home_screen.dart';
import 'package:coding_juniors_assgnment/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, Key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StartScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '</>',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 54.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            AnimatedText(
              text: '"Ace The Race"',
              textStyle: TextStyle(
                color: Colors.teal,
                fontSize: 44.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
              duration: Duration(
                  milliseconds: 100), // Total duration for text to appear
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Duration duration;

  const AnimatedText({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.duration,
  }) : super(key: key);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  late List<String> _characters;
  late int _currentIndex;
  late double _opacity;

  @override
  void initState() {
    super.initState();
    _characters = widget.text.split('');
    _currentIndex = 0;
    _opacity = 0.0;
    _animateNextCharacter();
  }

  void _animateNextCharacter() {
    Future.delayed(const Duration(milliseconds: 1), () {
      setState(() {
        _opacity = 1.0;
        _currentIndex++;
      });
      if (_currentIndex < _characters.length) {
        Future.delayed(widget.duration, () {
          setState(() {
            _opacity = 0.0;
          });
          _animateNextCharacter();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _characters.map((char) {
        final isCurrent = _characters.indexOf(char) <= _currentIndex;
        return AnimatedOpacity(
          duration: widget.duration,
          opacity: isCurrent ? 1.0 : 0.0,
          child: Text(
            char,
            style: widget.textStyle
                .copyWith(color: Colors.teal.withOpacity(_opacity)),
          ),
        );
      }).toList(),
    );
  }
}
