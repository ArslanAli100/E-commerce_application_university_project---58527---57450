import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_university_project/components/my_button.dart';
import 'package:flutter_application_university_project/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async{

    //loading circle
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text,
    );

    //stop circle
    Navigator.pop(context);
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),


              Icon(
                Icons.account_circle_outlined,
                color: const Color.fromARGB(255, 30, 120, 193),
                size:60,
              ),


              const SizedBox(height: 50),

              Text(
                "Welcome",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                ),
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              Text(
                'Forget Password',
                style: TextStyle(color: Colors.grey[600]),
              ),

              const SizedBox(height: 25),  

              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?'),
                  const SizedBox(width: 4),
                  Text(
                    'Register Now',
                  style: TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              )
          ],
        ),  
      ),
     ) 
    );
  }
}