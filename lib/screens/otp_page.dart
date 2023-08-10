import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onefamily/constants/colors.dart';
import 'package:onefamily/screens/LoginScreen.dart';
import 'package:onefamily/screens/new_password_screen.dart';

class otppage extends StatefulWidget {
  const otppage({Key? key}) : super(key: key);

  @override
  _otppageState createState() => _otppageState();
}

class _otppageState extends State<otppage> {
  TextEditingController _otp1Controller = TextEditingController();
  TextEditingController _otp2Controller = TextEditingController();
  TextEditingController _otp3Controller = TextEditingController();
  TextEditingController _otp4Controller = TextEditingController();

  FocusNode _otp1FocusNode = FocusNode();
  FocusNode _otp2FocusNode = FocusNode();
  FocusNode _otp3FocusNode = FocusNode();
  FocusNode _otp4FocusNode = FocusNode();

  @override
  void dispose() {
    _otp1Controller.dispose();
    _otp2Controller.dispose();
    _otp3Controller.dispose();
    _otp4Controller.dispose();
    _otp1FocusNode.dispose();
    _otp2FocusNode.dispose();
    _otp3FocusNode.dispose();
    _otp4FocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SizedBox(
            height: 40,
            width: 40,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: Colors.grey),
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
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/OTP-Image.png',
                height: 300,
                width: 300,
              ),
              Text(
                "Verify Your OTP",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "We send you a 4-digit code to verify \n     your phone number and email",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  otpTextField(_otp1Controller, _otp1FocusNode),
                  otpTextField(_otp2Controller, _otp2FocusNode),
                  otpTextField(_otp3Controller, _otp3FocusNode),
                  otpTextField(_otp4Controller, _otp4FocusNode),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement your "Forgot Password" logic here.

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newpasswordscreen(),
                      ));

                  String otp = _otp1Controller.text +
                      _otp2Controller.text +
                      _otp3Controller.text +
                      _otp4Controller.text;
                  print('OTP: $otp');
                },
                child: Text(
                  'Verify OTP',
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
                      Text('Didn\'t receive the code?'),
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
      ),
    );
  }

  Widget otpTextField(TextEditingController controller, FocusNode focusNode) {
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 8),
      color: tgBlue,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            fontSize: 36, color: Colors.white, fontWeight: FontWeight.w800),
        decoration: InputDecoration(
          counterText: "", // Hide the character count
          // border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            // When a digit is entered, move focus to the next field
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
