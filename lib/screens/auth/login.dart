import 'package:shop_app/consts/colors.dart';
import 'package:shop_app/screens/auth/signup.dart';
import 'package:shop_app/screens/bottom_bar.dart';
import 'package:shop_app/services/global_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Login extends StatefulWidget {
  static const routeName = '/Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  String _emailAddress = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalMethods _globalMethods = GlobalMethods();
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState.save();
      try {
        await _auth
            .signInWithEmailAndPassword(
            email: _emailAddress.toLowerCase().trim(),
            password: _password.trim())
            .then((value) =>
        Navigator.canPop(context) ? Navigator.of(context).pushNamed(
            BottomBar.routeName)
            : null);
      } catch (error) {
        _globalMethods.authErrorHandle(error.message, context);
        print('error occured ${error.message}');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _frmKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          key: ValueKey('email'),
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () =>
                              FocusScope.of(context).requestFocus(
                                  _passwordFocusNode),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              filled: true,
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email Address',
                              fillColor: Theme
                                  .of(context)
                                  .backgroundColor),
                          onSaved: (value) {
                            _emailAddress = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          key: ValueKey('Password'),
                          validator: (value) {
                            if (value.isEmpty || value.length < 7) {
                              return 'Please enter a valid Password';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          focusNode: _passwordFocusNode,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              filled: true,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              labelText: 'Password',
                              fillColor: Theme
                                  .of(context)
                                  .backgroundColor),
                          onSaved: (value) {
                            _password = value;
                          },
                          obscureText: _obscureText,
                          onEditingComplete: _submitForm,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 10),
                          _isLoading
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: ColorsConsts.backgroundColor),
                                    ),
                                  )),
                              onPressed: _submitForm,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Feather.user,
                                    size: 18,
                                  )
                                ],
                              )),
                          SizedBox(width: 20),
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: 50),
              Text('Create an account  ',
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              InkWell(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(Signup.routeName);
                },
                splashColor: Colors.redAccent,
              )

            ],
          ),
        ),
      ),
    );
  }
}
