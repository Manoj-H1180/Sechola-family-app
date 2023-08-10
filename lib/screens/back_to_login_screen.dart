import 'package:flutter/material.dart';
import 'package:onefamily/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onefamily/screens/LoginScreen.dart';
import 'package:onefamily/screens/RegisterScreen.dart';

class backtologinscreen extends StatelessWidget {
  const backtologinscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                  height: 20), // Adding some spacing between text and image.
              Image.asset(
                'assets/images/back_to_login_image.png',
                width: 250,
                height: 250,
              ),
              const SizedBox(
                  height: 20), // Adding some spacing between image and button.
              Text('Password Changed',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                'Your password has been changed \n successfully',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button click logic here.
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Back to Login',
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
            ],
          ),
        ),
      ),
    );
  }
}
