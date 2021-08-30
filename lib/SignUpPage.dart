import 'package:amitproject/FontsPage/Fonts.dart';
import 'package:amitproject/SignInPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BackGroundPages/BackGroundPage.dart';
import 'package:flutter/material.dart';
import 'CategoryPages/AmitCategories.dart';
import 'NavigationBar.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final signUpKey = GlobalKey<FormState>(); //-------- Form Key ---------

  String Email1 = '@';
  String Pass1 = ' ';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BackGroundPage(), //-------pack Ground photo method--------
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        'Sign up ..!',
                        style: SignUpText,
                      ),
                    )),
                SizedBox(
                  height: 150,
                ),
                Form(
                    key: signUpKey,
                    child:Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(0.5),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)
                          ),

                          child: Container(
                            width: 330,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Name",labelStyle: NameSignUpfont),

                              validator: (name) {
                                if (name!.isEmpty) {
                                  return 'Please Enter name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height:6,),
                        Container(
                          padding: EdgeInsets.all(0.5),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)

                          ),
                          child: Container(width: 330,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Email",labelStyle: EmailSignUpfont),
                              validator: (email) {
                                if (email == null || email.isEmpty) {
                                  return 'Please Enter Email';
                                } else if (!email.contains(Email1)) {
                                  return 'Enter Email with @';
                                }
                              },
                            ),
                          ),
                        ),

                        SizedBox(height:6,),

                        Container(
                          padding: EdgeInsets.all(0.5),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)


                            ),
                          child: Container(width: 330,
                            child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Password",labelStyle:EmailSignUpfont),
                              validator: (password) {
                                if (password == null || password.isEmpty) {
                                  return 'Please Enter Email';
                                } else if (password.contains(Pass1)) {
                                  return 'Enter Password without Space';
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: () {
                            if (signUpKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NaviBar()),
                              );

                            }
                          },
                          child: Text('Sign Up!'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignInPage()),
                            );
                          },
                          child: Text(
                            'Already signed up ?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ) )
              ],
            ),
          )
        ],
      ),
    );
  }
}
