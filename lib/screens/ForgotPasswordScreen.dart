import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onefamily/constants/colors.dart';
import 'package:onefamily/screens/LoginScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailOrPhoneController = TextEditingController();
  FocusNode _emailOrPhoneFocusNode = FocusNode();

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _emailOrPhoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Rectangle-7.png',
              height: 300,
              width: 300,
            ),
            Text(
              "Forgot Password",
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Please enter your registered email or phone number",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailOrPhoneController,
              focusNode: _emailOrPhoneFocusNode,
              decoration: InputDecoration(
                hintText: 'Enter your email or phone number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your "Forgot Password" logic here.
                String emailOrPhone = _emailOrPhoneController.text;
                print('Email or Phone: $emailOrPhone');
              },
              child: Text(
                'Reset Password',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: tgBlue,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(400, 60),
              ),
            ),
            SizedBox(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remember your password?',
                    ),
                    TextButton(
                      onPressed: () {
                        // Implement login logic here.
                        // This can navigate to a "Login" screen, etc.
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: tgBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
