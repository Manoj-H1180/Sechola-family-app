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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Let\'s be Connected To Each Other with',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                  height: 20), // Adding some spacing between text and image.
              Image.asset('assets/images/Tree-image-initial-screen.png'),
              SizedBox(
                  height: 50), // Adding some spacing between image and button.
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button click logic here.
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary:
                          tgBlue, // Replace with your desired button color.
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: Size(400, 50)),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your button click logic here.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    primary:
                        transparentColor, // Replace with your desired button color.
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    side: BorderSide(
                      color: Colors
                          .black, // Replace with your desired border color.
                      width: 2.0, // Set the border width as needed.
                    ),
                    fixedSize: Size(360, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
