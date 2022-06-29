import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task1/components/myButton.dart';
import 'package:task1/components/myTextField.dart';
import 'package:task1/components/outlineButton.dart';
import 'package:task1/components/textButton.dart';
import 'package:task1/modules/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var phoneController = TextEditingController();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: AlignmentDirectional.topEnd, children: const [
              Image(
                image: AssetImage('assets/images/fashion2.png'),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome To Fashion Daily',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Text(
                                  'Help',
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.teal),
                                  child: const Text(
                                    '?',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      'Phone Number',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    MyTextField(
                      controller: phoneController,
                      hintText: 'Eg. 1234567890',
                      keyboard: TextInputType.phone,
                      prefix: CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'EG',
                        favorite: const ['+39', 'FR', 'EG'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                        showDropDownButton: true,
                        showFlag: false,
                      ),
                      validate: 'Phone Number is required',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      text: 'Sign in',
                      onPressed: () {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Or",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyOutlineButton(
                      text: 'Sign by Google',
                      icon: FontAwesomeIcons.google,
                      onPressed: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Doesn\'t has ayn account?',
                        ),
                        MyTextButton(
                          text: 'Register here',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ));
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Text(
                        'Use the application according to policy rules. Any\n   kinds of violations will be subject to sanctions.',
                        style: TextStyle(height: 1.5, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
