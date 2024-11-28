import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/download.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: 1),
              child: Text(
                'Welcome to Our Restaurant',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                        blurRadius: 10,
                        color: Colors.black54,
                        offset: Offset(2, 2)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
