import 'package:flutter/material.dart';

import 'RegisterPage.dart';

class HomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Login',
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
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
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
                  Text('Don\'t have Account'),
                  SizedBox(
                    height: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      'Sign Up',
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
