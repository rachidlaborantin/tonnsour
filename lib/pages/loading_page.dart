import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tonnsour/utils/constants.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('TONNSOUR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kBlue,
                        fontSize: 45.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 250.0),
                  child: const Text(
                    'Soit avare avec ton temps comme tu l\'est avec ton argent. (Ch. Al-\'Uthaymin)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kBlue,
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: SizedBox(
              width: 25.0,
              height: 25.0,
              child: LoadingIndicator(
                indicatorType: Indicator.lineSpinFadeLoader,
                colors: [kBlue],
                strokeWidth: 3.0,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Text(
                '© Rachid Laborantin — 2025',
                style: TextStyle(
                    color: kBlue,
                    fontSize: 12.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
