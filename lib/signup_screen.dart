import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab23_emsi_zekraoui/pallete.dart';

import 'login_screen.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  Future<void> _signUp() async {
    if(confirmPassword()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );
      _navigateToLoginScreen();
    }
  }

  bool confirmPassword(){
    if(_passwordController.text.trim()
        == _confirmPasswordController.text.trim()
    ){
      return true;
    } else {
      return false;
    }
  }

  void _navigateToLoginScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child : Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Image
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: const BoxDecoration(
                            color: Pallete.assistantCircleColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Container(
                        height: 153,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/image_ossama.jfif',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  //Title
                  Text(
                    "SIGN UP",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 37,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  //Subtitle
                  Text(
                    "Welcome back! Nice to see you again :-)",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 19,
                    ),
                  ),

                  SizedBox(height: 50,),

                  //Email Textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child :Container(
                      decoration:  BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email'
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),

                  //Password Textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child :Container(
                      decoration:  BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password'
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),

                  //Confirm Password Textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child :Container(
                      decoration:  BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password'
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),

                  // signup in button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: _signUp,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.robotoCondensed(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                          ),
                        ),
                      ),

                    ),
                  ),

                  SizedBox(height: 20,),
                  // Text : sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member? ',
                        style: GoogleFonts.robotoCondensed(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Sign in now',
                        style: GoogleFonts.robotoCondensed(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )


      ),
    );
  }
}