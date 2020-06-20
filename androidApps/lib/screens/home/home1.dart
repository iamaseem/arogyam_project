import 'package:flutter/material.dart';
import 'package:firebase/services/auth.dart';
import 'package:flutter/services.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF398AE5),
      appBar: AppBar(
        //   title: Text(
        //     "Arogyam",
        //     style: TextStyle(
        //         fontFamily: 'Montseratt', fontSize: 30.0, color: Colors.white),
        //   ),
        //   centerTitle: true,
        //backgroundColor: Color(0xFF73AEF5),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              "Log out",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          Center(
            child: Text(
              "Arogyam",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montseratt',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 60.0),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(children: <Widget>[
                SizedBox(height: 30.0),
                RaisedButton(
                  elevation: 5.0,
                  onPressed: () async {
                    print('valid');
                  },
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color(0xFF398AE5),
                  child: Text(
                    '   Monthly   \n   Checkup   ',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
