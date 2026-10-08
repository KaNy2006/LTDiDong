import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Welcome my home page',
        style: TextStyle(
          fontSize: 25,
          color: Color(0xFF006400),
        ),
      ),
    );
  }
}