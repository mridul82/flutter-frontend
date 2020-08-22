import 'package:flutter/material.dart';
import 'package:fluuter_front_end/Services/auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  //bool _isLogin = false;

  // void registerAction({String name, String email, String password}) {}

  void _showScaffold(String s) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(s),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          final registerResponse = await signUp(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          );

                          print(registerResponse);
                          if (registerResponse == 200) {
                            _formKey.currentState.reset();
                            _showScaffold("Data Register Sucessfully!!");
                          } else if ((registerResponse == 400)) {
                            _showScaffold("Data already registred");
                          } else {
                            _showScaffold("error");
                          }
                        }
                      },
                      child: Text('Submit'),
                    )
                  ],
                ),
              ),
              key: _formKey,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text('Already have Account'),
                  SizedBox(
                    height: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
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
