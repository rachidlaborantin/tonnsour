import 'package:flutter/material.dart';
import 'package:tonnsour/models/plan.dart';
import 'package:tonnsour/pages/plan_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  late DateTime _today;
  late DateTime _tomorrow;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _today = DateTime(now.year, now.month, now.day);
    _tomorrow = _today.add(const Duration(days: 1));
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      children: [
        PlanPage(
          date: _today,
        ),
        PlanPage(date: _tomorrow)
      ],
    );
  }
}
