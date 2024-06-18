// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:frontend/pages/admin_console.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/authentication_service.dart';
import 'package:frontend/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationService _authService = AuthenticationService();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    var loginResult = await _authService.login(
      _usernameController.text,
      _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (loginResult?['status'] == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else if (loginResult?['status'] == 'invalid_password') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Password')),
      );
    } else if (loginResult?['status'] == 'username_not_exist') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Username doesn't exist. Don't have an account? Register")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });

    String registerResult = await _authService.register(
      _usernameController.text,
      _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (registerResult == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (registerResult == 'username_exists') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username already exists. Login')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed. Please try again.')),
      );
    }
  }

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
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: Text('Log In'),
                    ),
              SizedBox(height: 10),
              _isLoading
                  ? SizedBox()
                  : ElevatedButton(
                      onPressed: _register,
                      child: Text('Register'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
