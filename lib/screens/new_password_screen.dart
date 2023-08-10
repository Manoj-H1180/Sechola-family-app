import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onefamily/constants/colors.dart';
import 'package:onefamily/screens/LoginScreen.dart';
import 'package:onefamily/screens/back_to_login_screen.dart';
import 'package:onefamily/screens/otp_page.dart';

class newpasswordscreen extends StatefulWidget {
  const newpasswordscreen({Key? key}) : super(key: key);

  @override
  _newpasswordscreenState createState() => _newpasswordscreenState();
}

class _newpasswordscreenState extends State<newpasswordscreen> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  bool _showPasswordMismatchWarning = false;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        leading: IconButton(
          icon: SizedBox(
            height: 40,
            width: 40,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 181, 203, 244),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        // Add SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/new-password-screen-image.png',
                height: 250,
                width: 250,
              ),
              Text(
                "Your New Password",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Please enter your new password",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              buildPasswordField(
                  "New Password", _newPasswordController, _showNewPassword),
              buildPasswordField("Confirm Password", _confirmPasswordController,
                  _showConfirmPassword),
              if (_showPasswordMismatchWarning)
                Text(
                  "Passwords must be 8 characters long, contain at least 1 special character and 1 number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Check if passwords are empty
                  if (_newPasswordController.text.isEmpty ||
                      _confirmPasswordController.text.isEmpty) {
                    setState(() {
                      _showPasswordMismatchWarning = false; // Hide the warning
                    });
                  }
                  // Check if passwords match
                  else if (_newPasswordController.text !=
                      _confirmPasswordController.text) {
                    setState(() {
                      _showPasswordMismatchWarning = true;
                    });
                  }
                  // Check if passwords meet validation criteria
                  else if (!isPasswordValid(_newPasswordController.text)) {
                    setState(() {
                      _showPasswordMismatchWarning = true;
                    });
                  } else {
                    // Passwords match and are valid, proceed with "Reset Password" logic
                    // ... (your existing code)

                    // Reset the _showPasswordMismatchWarning to false when passwords match
                    setState(() {
                      _showPasswordMismatchWarning = false;
                    });

                    // Rest of your code (e.g., navigation to backtologinscreen, printing passwords, etc.)

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const backtologinscreen(),
                      ),
                    );

                    String newPassword = _newPasswordController.text;
                    String confirmPassword = _confirmPasswordController.text;
                    print('New Password: $newPassword');
                    print('Confirm Password: $confirmPassword');
                  }
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
              if (_showPasswordMismatchWarning)
                Text(
                  "Passwords do not match",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              SizedBox(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Remember your password?'),
                      TextButton(
                        onPressed: () {
                          // Implement login logic here.
                          // This can navigate to a "Login" screen, etc.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
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
      ),
    );
  }

  bool isPasswordValid(String password) {
    // Password must be 8 characters long, contain at least 1 special character, and 1 number
    return RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
  }

  Widget buildPasswordField(
      String hintText, TextEditingController controller, bool showPassword) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        obscureText: !showPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                // Use the global variables here to toggle the password visibility
                if (hintText == "New Password") {
                  _showNewPassword = !_showNewPassword;
                } else if (hintText == "Confirm Password") {
                  _showConfirmPassword = !_showConfirmPassword;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
