import 'package:flutter/material.dart';
import 'package:flutter_duc1/Components/onboarding_data.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final controller = OnboardingData();
  final pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          header(),
          body(),
          builderDots(),
          button(),
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/icon_background.png",
            height: 50.0,
            width: 50.0,
          ),
          const SizedBox(height: 10), // Add some space between the icon and text
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Tamang\n FoodService",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 37),
              textAlign: TextAlign.center, // Center the text
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Expanded(
      child: Center(
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(controller.items[currentIndex].image),
                      Text(
                        controller.items[currentIndex].title,
                        style: const TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          controller.items[currentIndex].description,
                          style: const TextStyle(color: Colors.grey, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
              );
            }),
      ),
    );
  }

  Widget builderDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          controller.items.length,
          (index) => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: currentIndex == index ? Colors.green : Colors.grey,
                ),
                height: 7,
                width: currentIndex == index ? 20 : 10,
                duration: const Duration(milliseconds: 700),
              )),
    );
  }

  Widget button() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.orange,
      ),
      child: TextButton(
          onPressed: () {
            setState(() {
              // if (currentIndex == controller.items.length - 1) {
              //   Navigator.pushNamed(context, '/home');
              // } else {
              //   pageController.nextPage(
              //       duration: const Duration(milliseconds: 300),
              //       curve: Curves.easeInOut);
              // }
              currentIndex != controller.items.length -1 ? currentIndex++ : Navigator.pushNamed(context, '/home');
            });
          },
          child: Text(
            currentIndex != controller.items.length - 1
                ? "Get Started"
                : "Continue",
            style: const TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          )),
    );
  }
}
