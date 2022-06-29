import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/components/myButton.dart';
import 'package:task1/components/textButton.dart';
import 'package:task1/modules/register_screen.dart';

import 'login_screen.dart';

class OnBoardingItemModel {
  final String image;
  final String title;
  final String body;
  OnBoardingItemModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var control = PageController();
  bool isLast = false;
  List item = [
    OnBoardingItemModel(
      image: 'assets/images/delivery.png',
      title: 'Get food delivery to your \n         doorstep asap',
      body:
          'We have young and professional delivery team that will bring your food as soon as\n               possible to your doorstep',
    ),
    OnBoardingItemModel(
      image: 'assets/images/done.png',
      title: 'Buy Any Food from your\n     favorite restaurant',
      body:
          'We are constantly adding your favourite\n restaurant throughout the territory and\n       around your area carefully selected',
    ),
    OnBoardingItemModel(
        image: 'assets/images/payment.png',
        title: 'Easy Payment',
        body:
            'We make food ordering fast, simple and free - no matter if you order online or cash.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(253, 249, 236, 1),
                  borderRadius: BorderRadius.circular(20.0)),
              child: MyTextButton(
                text: 'Skip',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                },
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '7',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Color.fromRGBO(254, 211, 72, 1)),
              ),
              Text('Krave',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.teal)),
            ],
          ),
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: control,
              itemBuilder: (context, index) => buildPageViewItem(item[index]),
              itemCount: item.length,
              onPageChanged: (int index) {
                if (index == item.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SmoothPageIndicator(
            controller: control,
            count: item.length,
            effect: WormEffect(
              activeDotColor: const Color.fromRGBO(254, 211, 72, 1),
              dotColor: Colors.grey[200]!,
              dotWidth: 18.0,
              dotHeight: 7.0,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyButton(
              text: isLast ? 'Get Started' : 'Next',
              onPressed: () {
                if (isLast) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                } else {
                  control.nextPage(
                    duration: const Duration(milliseconds: 750),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                }
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              MyTextButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                      (route) => false);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildPageViewItem(OnBoardingItemModel model) {
    return Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
            height: 300,
            width: 300,
          ),
        ),
        Text(
          model.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 30.0, end: 30.0),
          child: Text(
            model.body,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
