import 'dart:convert';
import 'package:amitproject/SignUpPage.dart';
import 'package:flutter/material.dart';

import 'NavigationBar.dart';
import 'SignInPage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class MainStateless extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,
      home: SignInPage(),

    );
  }
}
