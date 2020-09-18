import 'package:flutter/material.dart';
import 'package:flutter_app_w_images/loginPage.dart';
import 'package:flutter_app_w_images/signup.dart';
import 'package:flutter_app_w_images/widgets/common_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_app_w_images/bottom_left_clipper.dart';
import 'package:flutter_app_w_images/bottom_left_clipper_bottom.dart';
import 'package:flutter_app_w_images/clip_shadow_path.dart';
import 'package:flutter_app_w_images/top_right_clipper_bottom.dart';
import 'package:flutter_app_w_images/top_right_clipper.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _loginButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: buttonGrey('Login'),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: buttonGrey('Register'),
      );

  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Welcome!',
        style: GoogleFonts.portLligatSans(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.black26,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final kNeumorphicColorTop = Color.fromRGBO(240, 80, 83,1);
    final kNeumorphicColorBottom = Color.fromRGBO(255, 191, 0,1);

    final boxShadow = BoxShadow(
      color: Colors.grey,
      offset: Offset(-5, 3),
      blurRadius: 5,
      spreadRadius: 10,
    );

    // Neumorphic colored container with 99% app width
    final widthNeuContainerTop = Container(
      width: width * 0.99,
      color: kNeumorphicColorTop,
    );

    // Neumorphic colored container with 99% app height
    final heightNeuContainerTop = Container(
      height: height * 0.99,
      color: kNeumorphicColorTop,
    );

    // Neumorphic colored container with 99% app width
    final widthNeuContainerBottom = Container(
      width: width * 0.99,
      color: kNeumorphicColorBottom,
    );

    // Neumorphic colored container with 99% app height
    final heightNeuContainerBottom = Container(
      height: height * 0.99,
      color: kNeumorphicColorBottom,
    );



    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFC0099), Color(0xFFFFFF00)]),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              child: ClipShadowPath(
                shadow: boxShadow,
                clipper: TopRightNeuClipperBtm(),
                child: widthNeuContainerTop,
              ),
            ),
            Align(
              alignment: Alignment(30, -1),
              child: ClipShadowPath(
                shadow: boxShadow,
                clipper: TopRightNeuClipper(),
                child: widthNeuContainerTop,
              ),
            ),
            Align(
              alignment: Alignment(0, 70.5),
              child: ClipShadowPath(
                shadow: boxShadow,
                clipper: BottomLeftNeuClipperBtm(),
                child: heightNeuContainerBottom,
              ),
            ),
            Align(
              alignment: Alignment(0, 120.5),
              child: ClipShadowPath(
                shadow: boxShadow,
                clipper: BottomLeftNeuClipper(),
                child: heightNeuContainerBottom,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _title(),
                    _loginButton(),
                    _signUpButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
