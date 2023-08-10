import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import
import 'package:google_fonts/google_fonts.dart';
import 'package:onefamily/constants/colors.dart';
import 'package:onefamily/screens/forgot_password_screen.dart';
import 'package:onefamily/screens/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_handleFocusChange);
    _passwordFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _emailFocusNode.removeListener(_handleFocusChange);
    _passwordFocusNode.removeListener(_handleFocusChange);
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      // Empty setState to trigger UI update
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 80,
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        // Set systemOverlayStyle for status bar text color
        value: SystemUiOverlayStyle.light,
        child: CustomScrollView(
          slivers: <Widget>[
            // SliverAppBar(
            //   backgroundColor: Colors.transparent,
            //   leading: IconButton(
            //     icon: Icon(Icons.arrow_back_ios_new),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            //   floating: true, // Image will hide when scrolling
            //   pinned: true, // App bar won't be pinned
            // ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Container(
                      width: 350,
                      child: Column(
                        children: [
                          Image.asset('assets/images/login-screen-image.png'),
                          SizedBox(height: 20),
                          Text(
                            "Welcome Back!",
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Happy to see you again",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            width: 400,
                            child: Container(
                              color: Colors.grey[10],
                              child: TextField(
                                controller: _emailController,
                                focusNode: _emailFocusNode,
                                onTap: () {
                                  _passwordFocusNode.unfocus();
                                  
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            color: Colors.grey[10],
                            child: TextField(
                              controller: _passwordController,
                              focusNode: _passwordFocusNode,
                              onTap: () {
                                _emailFocusNode.unfocus();
                              },
                              obscureText: !_showPassword,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  icon: Icon(
                                    _showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Implement forgot password logic here.
                                  // This can navigate to a "Forgot Password" screen or show a bottom sheet, etc.
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          forgotpasswordscreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: tgBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              // Implement your login logic here.
                              String email = _emailController.text;
                              String password = _passwordController.text;
                              print('Email: $email');
                              print('Password: $password');
                              
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: tgBlue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              fixedSize: Size(400, 60),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: btColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    'assets/images/facebook.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: btColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    'assets/images/google.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: btColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    'assets/images/twitter.png',
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an account',
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Implement forgot password logic here.
                                      // This can navigate to a "Forgot Password" screen or show a bottom sheet, etc.
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Sign Up?',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
