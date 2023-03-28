import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:frontend/components/custom_surfix_icon.dart';
import 'package:frontend/screens/sign_in/components/sign_form.dart';
import 'package:frontend/screens/sign_in/sign_in_screen.dart';
import 'package:frontend/screens/write_review.dart';
import 'package:frontend/models/Desc.dart';

final dio = Dio();

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);
  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? mobile;
  String? lname;
  String? fname;
  var tags = [];
  bool flag1 = false;
  bool flag2 = false;
  bool flag3 = false;
  bool flag4 = false;
  bool flag5 = false;
  bool flag6 = false;

  void save() async {
    var params = {
      "email": email,
      "password": password,
      "firstName": fname,
      "mobileNum": mobile,
      "lastName": lname,
      "preferences": tags,
    };

    Response response = await dio.post(
        'https://d96b-2401-4900-1c53-2ed3-b494-7129-1648-a25d.in.ngrok.io/api/tourist/register',
        data: jsonEncode(params));
    print('nasnasjn ios r${response.data}');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20),
          children: [
            Container(
                margin: EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                child: Column(children: [
                  Text('Hello, there!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600)),
                  Text('Sign up as an explorer and dwell into past',
                      style: TextStyle(
                          color: Color(0xff1ce0e2),
                          fontSize: 15,
                          fontWeight: FontWeight.w400))
                ])),
            SizedBox(height: 50),
            Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    // obscureText: true,
                    onSaved: (newValue) => email = newValue,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: "Email Id",
                        filled: true,
                        fillColor: Color(0xff1a1a1a),
                        labelStyle: TextStyle(color: Color(0xfffa256a)),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        suffixIcon: Icon(Icons.mail)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      onSaved: (newValue) => email = newValue,
                      onChanged: (value) {
                        setState(() {
                          mobile = value;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Mobile Number",
                          filled: true,
                          fillColor: Color(0xff1a1a1a),
                          labelStyle: TextStyle(color: Color(0xfffa256a)),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: Icon(Icons.mobile_friendly)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      onSaved: (newValue) => email = newValue,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Password",
                          filled: true,
                          fillColor: Color(0xff1a1a1a),
                          labelStyle: TextStyle(color: Color(0xfffa256a)),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: Icon(Icons.lock)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('What are your preferences?',
                      style: TextStyle(color: Color(0xfffa256a))),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: [
                      ElevatedButton(
                        onPressed: () => {
                          setState(() => flag1 = !flag1),
                          if (flag1)
                            {tags.add('Science')}
                          else if (!flag1)
                            {tags.remove('Science')},
                          print(tags)
                        },
                        child: Text('Science'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: flag1
                              ? Colors.red
                              : Colors.teal, // This is what you need!
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          setState(() => flag2 = !flag2),
                          if (flag2)
                            {tags.add('Transport')}
                          else if (!flag2)
                            {tags.remove('Transport')},
                          print(tags)
                        },
                        child: Text('Transport'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: flag2
                              ? Colors.red
                              : Colors.teal, // This is what you need!
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          setState(() => flag3 = !flag3),
                          if (flag3)
                            {tags.add('Space')}
                          else if (!flag3)
                            {tags.remove('Space')},
                          print(tags)
                        },
                        child: Text('Space'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: flag3
                              ? Colors.red
                              : Colors.teal, // This is what you need!
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          setState(() => flag4 = !flag4),
                          if (flag4)
                            {tags.add('Prehistoric')}
                          else if (!flag4)
                            {tags.remove('Prehistoric')},
                          print(tags)
                        },
                        child: Text('Prehistoric'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: flag4
                              ? Colors.red
                              : Colors.teal, // This is what you need!
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          setState(() => flag5 = !flag5),
                          if (flag5)
                            {tags.add('Defense')}
                          else if (!flag5)
                            {tags.remove('Defense')},
                          print(tags)
                        },
                        child: Text('Defense'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: flag5
                              ? Colors.red
                              : Colors.teal, // This is what you need!
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          setState(() => flag6 = !flag6),
                          if (flag6)
                            {tags.add('Others')}
                          else if (!flag6)
                            {tags.remove('Others')},
                          print(tags)
                        },
                        child: Text('Others'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: flag6
                              ? Colors.red
                              : Colors.teal, // This is what you need!
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      onSaved: (newValue) => email = newValue,
                      onChanged: (value) {
                        setState(() {
                          fname = value;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "First Name",
                          filled: true,
                          fillColor: Color(0xff1a1a1a),
                          labelStyle: TextStyle(color: Color(0xfffa256a)),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: Icon(Icons.text_fields_outlined)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      onSaved: (newValue) => email = newValue,
                      onChanged: (value) {
                        setState(() {
                          lname = value;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Last Name",
                          filled: true,
                          fillColor: Color(0xff1a1a1a),
                          labelStyle: TextStyle(color: Color(0xfffa256a)),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: Icon(Icons.text_fields)),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        save();
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 20, left: 8, right: 8),
                          padding: EdgeInsets.all(15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xfffa256a),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )))
                ]))
          ],
        ));
  }
}
