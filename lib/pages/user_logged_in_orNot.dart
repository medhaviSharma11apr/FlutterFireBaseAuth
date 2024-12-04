import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testapp/controller/auth_service.dart';
import 'package:testapp/pages/home_page.dart';
import 'package:testapp/pages/login_page.dart';

class UserLoggedInOrNot extends StatefulWidget {
  const UserLoggedInOrNot({super.key});

  @override
  State<UserLoggedInOrNot> createState() => _UserLoggedInOrNotState();
}

class _UserLoggedInOrNotState extends State<UserLoggedInOrNot> {
  bool show = false;
  @override
  void initState() {
    log('here');
    AuthService.isLoggedIn().then((value) {
      log('show0$show');
      show = value;
      if (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const HomePage()),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const LoginPage()),
          ),
        );
      }
      log('show1$show');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(backgroundColor: Colors.white,),
      ),
    );

    // Container(
    //   child: show ? const HomePage() : const LoginPage(),
    // );
  }
}
