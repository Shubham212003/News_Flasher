import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_flasher/pages/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            constraints: BoxConstraints(maxWidth: 600), // Limit width for larger screens
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Lottie.asset(
                    'images/animation/ns.json',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height / 4,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20.0),
                const Text(
                  "News from around the\nworld for you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                const Text(
                  "Best time to read, take your time to read\na little more of this world",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 40.0),
                GestureDetector(
                  onTapDown: (_) {
                    _controller.forward();
                  },
                  onTapUp: (_) {
                    _controller.reverse();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  onTapCancel: () {
                    _controller.reverse();
                  },
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      constraints: BoxConstraints(maxWidth: 400), // Limit width for larger screens
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 5.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
