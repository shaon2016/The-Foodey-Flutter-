import 'package:flutter/material.dart';
import 'package:foodey/features/home/home.dart';
import 'package:foodey/features/login/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static var routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 56,
                      ),
                      Image(
                        width: 100,
                        height: 100,
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              labelText: 'Email *',
                            ),

                            validator: (String value) {
                              if (value == null || value.isEmpty)
                                return "Enter email";
                              return value != null && !value.contains('@')
                                  ? 'Enter a proper email address'
                                  : null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password *',
                            ),

                            validator: (String value) {
                              if (value == null) return "Enter password";
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.all(16),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    HomeScreen.routeName, (route) => false);
                              }
                            },
                            color: Theme.of(context).accentColor,
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, SignUpScreen.routeName, (route) => false);
                    },
                    child: Text(
                      " Register here",
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
