import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:vidyalayas/modals/user_model.dart';
import 'package:vidyalayas/services/api_services.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  late String? emailValue;
  late String? nameValue;
  late String? ageValue;
  late String? phoneValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //name
                TextFormField(
                  controller: nameController,
                  onSaved: (value) {
                    setState(() {
                      nameValue = value;
                    });
                  },
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'At least 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Your Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                //email
                TextFormField(
                  controller: emailController,
                  onSaved: (value) {
                    setState(() {
                      emailValue = value;
                    });
                  },
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'At least 6 characters';
                    }
                    if (EmailValidator.validate(value) == false) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Your Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                //age
                TextFormField(
                  controller: ageController,
                  onSaved: (value) {
                    setState(() {
                      ageValue = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.length < 2) {
                      return 'At least 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Your Age',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                //phone
                TextFormField(
                  controller: phoneController,
                  onSaved: (value) {
                    setState(() {
                      phoneValue = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.length < 2) {
                      return 'At least 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Your Phone',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final json = prefs.getString('login_details') ?? "nothing";
                    final data = jsonDecode(json);
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ApiServices.postUserInfo(
                        email: emailValue,
                        school: nameValue,
                        age: ageValue,
                        number: phoneValue,
                        token: data['token'],
                      ).then((value) {
                        UserModel data = value;
                        if (data.status == 'success') {
                          return FormHelper.showSimpleAlertDialog(context,
                              'Updated', 'Data Updated Sucessfully', 'OK', () {
                            nameController.clear();
                            ageController.clear();
                            phoneController.clear();
                            emailController.clear();
                            Navigator.pop(context);
                          });
                        }
                      });
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
