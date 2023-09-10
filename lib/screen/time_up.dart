import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class TimeUp extends StatefulWidget {
  @override
  State<TimeUp> createState() => _TimeUpState();
}

class _TimeUpState extends State<TimeUp> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = ColorTween(begin: Colors.red.shade700, end: Colors.black).animate(_animationController);

    _animationController.forward();

    _animation.addStatusListener((status) {
        if(status == AnimationStatus.completed) {
          _animationController.reverse(from: 1.0);
        }else if(status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
    });

    _animationController.addListener(() {
      setState(() {
        _animation.value;
      });
    });

    FlutterRingtonePlayer.playAlarm();
  }

  @override
  void dispose() {
    _animationController.dispose();
    FlutterRingtonePlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: _animation.value,
        body: Center(
          child: Text(
            'Time\'s Up',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
