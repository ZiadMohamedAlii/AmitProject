import 'package:amitproject/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'BackGroundPages/BackGroundPage1.dart';
import 'FontsPage/Fonts.dart';
import 'CategoryPages/AmitCategories.dart';
import 'NavigationBar.dart';

class SignInPage extends StatefulWidget {


  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final signInKey = GlobalKey<FormState>(); //-------- Form Key ---------

  String Email2 = '@';
  String Pass2= ' ';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BackGroundPage1(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Container(
                    height: 200,
                    child: Center(
                      child: Text(
                        'Sign In ..!',
                        style: SignUpText,
                      ),
                    )),
                SizedBox(
                  height: 100,
                ),
                Form(
                    key: signInKey,
                    child:Column(
                      children: [
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
                                } else if (!email.contains(Email2)) {
                                  return 'Enter Email with @';
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 4,),
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
                                } else if (password.contains(Pass2)) {
                                  return 'Enter Password without Space';
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: () {
                            if (signInKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NaviBar()),
                              );
                            }
                          },
                          child: Text('Sign In'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage()),
                            );
                          },
                          child: Text(
                            'Sign Up ?',
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
