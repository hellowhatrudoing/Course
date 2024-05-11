import 'package:course/Pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:course/Pages/HomePage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;
  
  bool _isPasswordLengthValid = true;
  bool _isPasswordLetterValid = true;
  bool _isPasswordDigitValid = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validatePasswordLength(String value) {
    setState(() {
      _isPasswordLengthValid = value.length >= 6;
    });
  }

  void _validatePasswordLetter(String value) {
    setState(() {
      _isPasswordLetterValid = value.contains(RegExp(r'[a-zA-Z]'));
    });
  }

  void _validatePasswordDigit(String value) {
    setState(() {
      _isPasswordDigitValid = value.contains(RegExp(r'\d'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Goals",
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 150, 30, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Ex. xyz@gmail.com",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),
              TextFormField(
                
                onChanged: (value) {
                  _validatePasswordLength(value);
                  _validatePasswordLetter(value);
                  _validatePasswordDigit(value);
                },
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  errorText: !_isPasswordLengthValid
                      ? 'Password must be at least 6 characters long'
                      : !_isPasswordLetterValid
                          ? 'Password must contain at least one letter'
                          : !_isPasswordDigitValid
                              ? 'Password must contain at least one digit'
                              : null,
                ),
                obscureText: _obscureText,
              ),
              const SizedBox(height: 25),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  LoginPage(),
                    ),
                  );
                },
                child: const Text("Have an account? Log in"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 250.0,
        height: 45.0,
        child: FloatingActionButton(
          onPressed: () {
            if (_isPasswordLengthValid &&
                _isPasswordLetterValid &&
                _isPasswordDigitValid) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  HomePage(),
                ),
              );
            }
          },
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
          ),
          child: const Text(
            "Sign In",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
