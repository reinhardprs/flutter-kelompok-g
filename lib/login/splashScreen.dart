import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:money_manage/login/login.dart';
import 'package:money_manage/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void nextPage(BuildContext context) async{
    await Future.delayed(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>Login())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    nextPage(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: w / 2.50,
          width: w / 4,
          child: Animator<double>(
            duration: Duration(milliseconds: 2000),
            cycles: 0,
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: 0.0, end: 10.0),
            builder: (context, animatorState, child) => Column(
              children: [
                SizedBox(
                  height: animatorState.value * 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image(
                    image: AssetImage('assets/Logo_SpendWise.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}