import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vidyalayas/config/palette.dart';
import 'package:vidyalayas/modals/login_model.dart';
import 'package:vidyalayas/services/api_services.dart';
import 'package:vidyalayas/user_preferences/user_preferences.dart';
import 'package:vidyalayas/widgets/text_field_container.dart';
import 'main_screen.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String emailValue;
  late String passwordValue;
  late bool rememberMe = true;
  bool isValidPassword = false;
  bool _obsecureText = true;
  bool isEmptyEmail = false;
  bool isLoading = false;
  bool isValidEmail = false;
  late String subDomain;
  var loginData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topSize = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: topSize + 35,
              ),
              Image.asset(
                'images/login_middle.png',
                height: size.height * 0.3,
                width: size.width * 1.5,
              ),
              SizedBox(
                height: 20,
              ),
              // Text
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: Cfont.Xb),
              ),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              //endof Text
              //login form
              //email field
              TextFieldContainer(
                child: TextFormField(
                  controller: emailTextController,
                  onSaved: (value) {
                    setState(() {
                      emailValue = value!;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixText: '     ',
                    border: InputBorder.none,
                    hintText: 'Email Address',
                    hintStyle: TextStyle(
                      fontFamily: 'MnR',
                      fontWeight: FontWeight.bold,
                      color: Palette.bgTextFieldText,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              //password
              TextFieldContainer(
                child: TextFormField(
                  textAlign: TextAlign.left,
                  obscureText: _obsecureText,
                  controller: passwordTextController,
                  onSaved: (value) {
                    setState(() {
                      passwordValue = value!;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _obsecureText = !_obsecureText;
                          });
                        },
                        child: Icon(Icons.remove_red_eye_outlined)),
                    prefixText: '     ',
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontFamily: 'MnR',
                      fontWeight: FontWeight.bold,
                      color: Palette.bgTextFieldText,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              //login button
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Palette.purple,
                        backgroundColor: Palette.white,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          _formKey.currentState!.save();
                          setState(() {
                            isLoading = true;
                          });
                          ApiServices.validateLogin(
                            username: emailValue,
                            password: passwordValue,
                          ).then((value) {
                            if (value == true) {
                              ApiServices.getLoginToken(
                                      username: emailValue,
                                      password: passwordValue)
                                  .then((value) {
                                LoginModel data = value;
                                UserPreferences.setLoginDetails(LoginModel(
                                    status: data.status, token: data.token));
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()));
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              FormHelper.showSimpleAlertDialog(
                                  context,
                                  'E-Vidyalays',
                                  'Please enter valid login details',
                                  'OK', () {
                                Navigator.pop(context);
                              });
                              setState(() {
                                isLoading = false;
                              });
                            }
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Palette.purple,
                            borderRadius: BorderRadius.circular(35)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        width: size.width * 0.5,
                        height: 55,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MnB',
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Forgot Password?',
                  style: Style.onboardBStyle,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? '),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Signup',
                      style: Style.onboardBStyle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
