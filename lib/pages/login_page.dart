import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testapp/controller/auth_service.dart';
import 'package:testapp/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                // opacity: 0.6,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1478359900967-91ec0c6edc60?q=80&w=2428&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 130.0, // Adjust for outer border size
                    height: 130.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue, // Border color
                        width: 3.0, // Border width
                      ),
                    ),
                    child: ClipOval(
                        child: Image.asset(
                      "/picture/images.png",
                      fit: BoxFit.cover,
                      width: 120.0,
                      height: 120.0,
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Welcome 👋🏻",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  const Text('Enter Your Phone Number To Continue'),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      decoration: InputDecoration(
                          prefixText: "+ 91",
                          labelText: "Enter Your Phone Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32))),
                      validator: (value) {
                        if (value!.trim().length != 10) {
                          return 'Invalid Phone Number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          log('PhoneNumber ${_phoneController.text}');
                          AuthService.sendOtp(
                              phoneNumber: _phoneController.text,
                              errorStep: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Error In Sending Otp',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                              nextStep: () {
                                showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      title: const Text("OTP Verification"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Enter 6 digit Otp"),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Form(
                                            key: _formKey1,
                                            child: TextFormField(
                                              keyboardType: TextInputType.phone,
                                              controller: _otpController,
                                              decoration: InputDecoration(
                                                  // prefixText: "+ 91",
                                                  labelText:
                                                      "Enter Six Digit Otp",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32))),
                                              validator: (value) {
                                                if (value!.length != 6) {
                                                  return 'Invalid Otp';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              if (_formKey1.currentState!
                                                  .validate()) {
                                                AuthService.loginWithOtp(
                                                        otp:
                                                            _otpController.text)
                                                    .then((value) {
                                                  if (value == "Success") {
                                                    Navigator.of(context).pop();
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                      builder: (context) {
                                                        return const HomePage();
                                                      },
                                                    ));
                                                  } else {
                                                    Navigator.of(context).pop();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          value.toString(),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                            Colors.red,
                                                      ),
                                                    );
                                                  }
                                                });
                                              }
                                            },
                                            child: const Text('Submit'))
                                      ],
                                    );
                                  }),
                                );
                              });
                        }
                      },
                      child: const Text('Send Otp'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
