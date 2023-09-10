import 'dart:io';

import 'package:flutter/material.dart';
import 'time_up.dart';
import 'package:timer/utils/appColors.dart';
import 'package:timer/utils/flat_circular_button.dart';

import 'dart:async';

class TimerHome extends StatefulWidget {
  const TimerHome({Key? key}) : super(key: key);

  @override
  State<TimerHome> createState() => _TimerHomeState();
}

class _TimerHomeState extends State<TimerHome> {
  int timerSet = 3;
  int timeElapsed = 0;
  bool timerStarted = false;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(highlight),
                      value: timeElapsed / timerSet,
                      backgroundColor: neon,
                      strokeWidth: 23,
                    ),
                  ),
                  Text(
                    '${timerSet - timeElapsed} s',
                    style: TextStyle(
                        color: neon, fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatCircularButton(
                    icon: Icon(Icons.remove, color: neon,),
                    onPressed: () {
                      setState(() {
                        if (timerSet > 1) {
                          timerSet--;
                        }
                        print(timerSet);
                      });
                    },
                  ),
                  FlatCircularButton(
                    icon: Icon(Icons.add, color: neon,),
                    onPressed: () {
                      setState(() {
                        timerSet++;
                      });
                      print(timerSet);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatCircularButton(
                    icon: Icon(Icons.pause, color: neon,),
                    onPressed: () {
                      setState(() {
                        timer!.cancel();
                      });
                    },
                  ),
                  FlatCircularButton(
                    icon: Icon(Icons.play_arrow, color: neon,),
                    onPressed: () {
                      timer = Timer.periodic(Duration(seconds: 1), (timer) {
                        setState(() {
                          timeElapsed++;

                          if (timeElapsed == timerSet) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return TimeUp();
                              }),
                            );

                            timer.cancel();
                            sleep(Duration(milliseconds: 100));
                            timeElapsed = 0;
                          }
                        });
                      });
                    },
                  ),
                  FlatCircularButton(
                    icon: Icon(Icons.stop, color: Colors.red,),
                    onPressed: () {
                      setState(() {
                        timer!.cancel();
                        timeElapsed = 0;
                      });
                    },
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     timer = Timer.periodic(Duration(seconds: 1), (timer) {
                  //       setState(() {
                  //         timeElapsed++;
                  //
                  //         if (timeElapsed == timerSet) {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(builder: (context) {
                  //               return TimeUp();
                  //             }),
                  //           );
                  //
                  //           timer.cancel();
                  //           sleep(Duration(milliseconds: 100));
                  //           timeElapsed = 0;
                  //         }
                  //       });
                  //     });
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.all(10),
                  //     height: 60,
                  //     width: 120,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         width: 2,
                  //         color: highlight,
                  //       ),
                  //       borderRadius: BorderRadius.circular(40),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         'START',
                  //         style: TextStyle(
                  //           fontSize: 24,
                  //           color: neon,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       timer!.cancel();
                  //       timeElapsed = 0;
                  //     });
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.all(10),
                  //     height: 60,
                  //     width: 120,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         width: 2,
                  //         color: Colors.red,
                  //       ),
                  //       borderRadius: BorderRadius.circular(40),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         'STOP',
                  //         style: TextStyle(
                  //           fontSize: 24,
                  //           color: Colors.red,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
