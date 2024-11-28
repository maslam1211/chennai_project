import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.teal.shade800,
      child: const Center(
        child: Text(
          '© 2024 Restaurant Name. All Rights Reserved.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
