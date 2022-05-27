import 'package:amazon_clone_tutorial/common/widgets/custom_button.dart';

import '../../../constants/global_variables.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_textfield.dart';

enum Auth {
  signup,
  signin,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();

  @override
  void dispose() {
    _emailC.dispose();
    _nameC.dispose();
    _passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                title: const Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  value: Auth.signup,
                  groupValue: _auth,
                  activeColor: GlobalVariables.secondaryColor,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                      //print(_auth);
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameC,
                        hintText: "Name",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: _emailC,
                        hintText: "Email",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: _passwordC,
                        hintText: "Password",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomButton(text: "Sign Up", onTap: () {})
                    ],
                  ),
                ),
              ListTile(
                title: const Text(
                  "Sign-in Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  value: Auth.signin,
                  groupValue: _auth,
                  activeColor: GlobalVariables.secondaryColor,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                      print(_auth);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
