import 'package:ewawepay/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
    bool hidePassword = true;
   
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(16),
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Stato',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico'),
                    ),
                  ),
                  Form(
                    key: globalFormKey,
                    child: new Column(
                      children: <Widget>[
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,

                          decoration: InputDecoration(
                            hintText: "Phone number or Username",
                            focusColor: parentColor,
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45.0),
                            ),
                          ),

                          // onSaved: (val) => email = val,
                        ),
                        SizedBox(height: 5),
                        new Padding(padding: const EdgeInsets.only(top: 20.0)),
                        new TextFormField(
                          obscureText: !hidePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            focusColor: parentColor,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45.0),
                            ),
                          ),

                          // onSaved: (val) => password = val,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Forgot password?',
                                style: TextStyle(color: childColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        new FlatButton(
                          minWidth: 300,
                          height: 48,
                          child: new Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {},
                          color: Colors.black,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Don\'t have an Account? '),
                        InkWell(
                          onTap: () async {
                            // Navigator.push(
                            //   context,
                            //   CupertinoPageRoute(
                            //     builder: (context) => SetPhoneScreen(),
                            //   ),
                            // );
                          },
                          child: new Text(
                            "Sign up",
                            style: TextStyle(color: childColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
