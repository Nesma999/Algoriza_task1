import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task1/components/myButton.dart';
import 'package:task1/components/myTextField.dart';
import 'package:task1/components/outlineButton.dart';
import 'package:task1/components/textButton.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPass = true;
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: AlignmentDirectional.topEnd, children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  const Image(
                    image: AssetImage('assets/images/fashion2.png'),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(16.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.7)),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
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
                          'Register',
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
                      'Email',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    MyTextField(
                      controller: emailController,
                      hintText: 'Eg. example@gmail.com',
                      keyboard: TextInputType.emailAddress,
                      validate: 'Email Address is required',
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
                      height: 15.0,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: isPass,
                      suffix: isPass ? Icons.visibility : Icons.visibility_off,
                      iconButton: () {
                        setState(() {
                          isPass = !isPass;
                          isPass ? Icons.visibility : Icons.visibility_off;
                        });
                      },
                      keyboard: TextInputType.visiblePassword,
                      validate: 'password is required',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      text: 'Register',
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
                          'Have ayn account?',
                        ),
                        MyTextButton(
                          text: 'Sign in here',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Text(
                        'By regestering your account, you are agree to our',
                        style: TextStyle(height: 1.5, color: Colors.grey),
                      ),
                    ),
                    Center(
                      child: MyTextButton(
                        text: 'terms and condition',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                      ),
                    )
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
