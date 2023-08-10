import 'package:flutter/material.dart';
import 'package:onefamily/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onefamily/screens/LoginScreen.dart';
import 'package:onefamily/screens/RegisterScreen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  child: Image.asset(
                    'assets/images/Tree-image-initial-screen.png',
                    height: 161,
                    width: 181,
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Text('Sechola Family',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.newRocker(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: 60,
                  child:
                      Text('We are happy to see you joining \n our family...!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button click logic here.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary:
                            tgBlue, // Replace with your desired button color.
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size(330, 50)),
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
