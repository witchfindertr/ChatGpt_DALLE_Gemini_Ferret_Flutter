import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab23_emsi_zekraoui/pallete.dart';
import 'package:lab23_emsi_zekraoui/signup_screen.dart';

import 'home_page.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Stream<User?> _authStateStream;

  @override
  void initState() {
    super.initState();
    _authStateStream = _auth.authStateChanges();
    _authStateStream.listen((User? user) {
      if (user != null) {
        // User is signed in, navigate to HomeScreen
        _navigateToHomeScreen();
      }
    });
  }

  Future<void> _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      _navigateToHomeScreen();
      // Successful authentication
      print("Connexion réussie !");
    } catch (e) {
      // Print more details about the authentication error
      print("Erreur lors de la connexion : $e");
    }
  }


  void _navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void _navigateToSinUpScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
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
                    "SIGN IN",
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

                  SizedBox(height: 15,),

                  // sign in button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: _signIn,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(
                          child: Text(
                            "Sign in",
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
                        'Not yet a member? ',
                        style: GoogleFonts.robotoCondensed(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: _navigateToSinUpScreen,
                        child:Text(
                          'Sign up now',
                          style: GoogleFonts.robotoCondensed(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue
                          ),
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