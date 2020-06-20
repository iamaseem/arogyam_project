import 'package:firebase/services/auth.dart';
import 'package:firebase/utilities/constants.dart';
import 'package:firebase/utilities/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //textField state
  String email = '';
  String passwd = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF6CA8F1),
              elevation: 0.0,
              title: Text("Sign Up to Arogyam"),
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        child: ConstrainedBox(
                      constraints: BoxConstraints(),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),

                          /* Text(
                  "Email",
                  style: TextStyle(
                    color: Color(0xFF6CA8F1),
                    fontSize: 20,
                    fontFamily: 'Opensans',
                  ),
                
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                )*/
                          new TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Enter Name",
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Color(0xFF6CA8F1),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF6CA8F1)),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                  borderSide: new BorderSide(
                                      color: Color(0xFF6CA8F1), width: 50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color: Color(0xFF6CA8F1), width: 2),
                                )),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Enter Email",
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color(0xFF6CA8F1),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF6CA8F1)),
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                                borderSide: new BorderSide(
                                    color: Color(0xFF6CA8F1), width: 50),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: Color(0xFF6CA8F1), width: 2),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                            validator: (val) {
                              if (val.length == 0) {
                                return "Email cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 20),
                          new TextFormField(
                            obscureText: true,
                            decoration: new InputDecoration(
                                labelText: "Enter Password",
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color(0xFF6CA8F1),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF6CA8F1)),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                  borderSide: new BorderSide(
                                      color: Color(0xFF6CA8F1), width: 50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color: Color(0xFF6CA8F1), width: 2),
                                )),
                            onChanged: (val) {
                              setState(() => passwd = val);
                            },
                            validator: (val) {
                              if (val.length < 6) {
                                return "Password must be more than 6 charactors";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            obscureText: true,
                            decoration: new InputDecoration(
                                labelText: "Re-enter Password",
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color(0xFF6CA8F1),
                                ),
                                labelStyle: TextStyle(color: Color(0xFF6CA8F1)),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                  borderSide: new BorderSide(
                                      color: Color(0xFF6CA8F1), width: 50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color: Color(0xFF6CA8F1), width: 2),
                                )),
                            keyboardType: TextInputType.visiblePassword,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            elevation: 5.0,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                loading = true;
                                dynamic result =
                                    await _auth.registerWithEmailandPassword(
                                        email, passwd);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error = 'Please supply valid email';
                                  });
                                }
                              }
                            },
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Color(0xFF6CA8F1),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () => widget.toggleView(),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an Account?  ',
                                    style: TextStyle(
                                      color: Color(0xFF6CA8F1),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign In',
                                    style: TextStyle(
                                      color: Color(0xFF6CA8F1),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(error),
                        ],
                      ),
                    )))),
          );
  }
}
