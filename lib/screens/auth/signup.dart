import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_app/consts/colors.dart';
import 'package:shop_app/screens/auth/login.dart';
import '../../services/global_method.dart';
import '../bottom_bar.dart';
import '../home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  static const routeName = '/Signup';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  bool _showPassword = true;
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  String _emailAddress = '';
  String _password = '';
  String _fullName = '';
  int _phoneNumber;

  bool _isLoading = false;

  GlobalMethods _globalMethods = GlobalMethods();

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
            .createUserWithEmailAndPassword(
                email: _emailAddress.toLowerCase().trim(),
                password: _password.trim())
            .then((value) => Navigator.canPop(context)
                ? Navigator.of(context).pushNamed(Login.routeName)
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
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      key: ValueKey('name'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'name cannot be null';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_emailFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          filled: true,
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Full name',
                          fillColor: Theme.of(context).backgroundColor),
                      onSaved: (value) {
                        _fullName = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      key: ValueKey('email'),
                      focusNode: _emailFocusNode,
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          filled: true,
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email Address',
                          fillColor: Theme.of(context).backgroundColor),
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
                                _showPassword = !_showPassword;
                              });
                            },
                            child: Icon(_showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          labelText: 'Password',
                          fillColor: Theme.of(context).backgroundColor),
                      onSaved: (value) {
                        _password = value;
                      },
                      obscureText: _showPassword,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_phoneNumberFocusNode),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      key: ValueKey('phone number'),
                      focusNode: _phoneNumberFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: _submitForm,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          filled: true,
                          prefixIcon: Icon(Icons.phone_android),
                          labelText: 'Phone number',
                          fillColor: Theme.of(context).backgroundColor),
                      onSaved: (value) {
                        _phoneNumber = int.parse(value);
                      },
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
                                    'Sign up',
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
                      SizedBox(width: 30),
                    ],
                  ),
                  SizedBox(height: 50),
                  Text('Already have an account  ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  InkWell(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(Login.routeName);
                    },
                    splashColor: Colors.redAccent,
                  )
                ],
              )),
        ],
      )),
    );
  }
}
