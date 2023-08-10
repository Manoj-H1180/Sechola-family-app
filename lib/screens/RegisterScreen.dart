import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onefamily/constants/colors.dart';
import 'package:onefamily/screens/LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  bool _validateInputs() {
    bool isValid = true;
    if (_emailController.text.isEmpty) {
      setState(() {
        _emailFocusNode.requestFocus();
      });
      isValid = false;
    }
    if (_usernameController.text.isEmpty) {
      setState(() {
        _usernameFocusNode.requestFocus();
      });
      isValid = false;
    }
    if (_passwordController.text.isEmpty) {
      setState(() {
        _passwordFocusNode.requestFocus();
      });
      isValid = false;
    } else if (_passwordController.text.length < 8) {
      // Password must be at least 8 characters long
      isValid = false;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Invalid Password'),
            content: Text('Password must be at least 8 characters long.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
            .hasMatch(_passwordController.text) ||
        _passwordController.text == _passwordController.text.toLowerCase()) {
      // Password must contain a special character and at least one uppercase letter
      isValid = false;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Invalid Password'),
            content: Text(
                'Password must contain a special character and at least one uppercase letter.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    return isValid;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor:
                Colors.white, // Set the AppBar background to transparent
            leadingWidth: 80,
            leading: IconButton(
              icon: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 181, 203, 244),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            floating: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Register new account",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Please complete your information",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        onTap: () {
                          setState(() {
                            _usernameFocusNode.unfocus();
                            _passwordFocusNode.unfocus();
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _usernameController,
                        focusNode: _usernameFocusNode,
                        onTap: () {
                          setState(() {
                            _emailFocusNode.unfocus();
                            _passwordFocusNode.unfocus();
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        onTap: () {
                          setState(() {
                            _emailFocusNode.unfocus();
                            _usernameFocusNode.unfocus();
                          });
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(),
                          // suffixIcon: IconButton(
                          //   onPressed: () {
                          //     setState(() {
                          //       _showPassword = !_showPassword;
                          //     });
                          //   },
                          //   icon: Icon(
                          //     _showPassword
                          //         ? Icons.visibility
                          //         : Icons.visibility_off,
                          //   ),
                          // ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          hintText: 'Confirm your password',
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
                      SizedBox(height: 1),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          if (_validateInputs()) {
                            // Implement your registration logic here.
                            String email = _emailController.text;
                            String username = _usernameController.text;
                            String password = _passwordController.text;
                            print('Email: $email');
                            print('Username: $username');
                            print('Password: $password');
                          }
                        },
                        child: Text(
                          'Register',
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
                              padding: const EdgeInsets.all(
                                  4.0), // Adjust the padding as needed
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
                              padding: const EdgeInsets.all(
                                  4.0), // Adjust the padding as needed
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
                              padding: const EdgeInsets.all(
                                  4.0), // Adjust the padding as needed
                              child: Image.asset(
                                'assets/images/twitter.png',
                                width: 40,
                                height: 40,
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
                                'Already have an account',
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
                                  'Login?',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
