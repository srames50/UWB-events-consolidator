// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:frontend/pages/home.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "https://images.credly.com/size/400x400/images/1ca468d1-f8fb-41be-856d-dd0fb19750e6/blob.png",
                width: 200,
                height: 200,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // Round the edges
                  ),
                ),
              ),
              SizedBox(height: 10), // Space between the two input fields
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // Round the edges
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10), // Space between the bottom input field and login button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomePage())
                    );
                },
                child: Text('Log In'),
              ),
            ],
          ),
        )
    ));  
  }
}
