import 'package:firebase/screens/authenticate/authenticate.dart';
import 'package:firebase/screens/authenticate/sign_in.dart';
import 'package:firebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if(user == null){
    return Authenticate();
    }else{
      return Home();
    }
  }
}