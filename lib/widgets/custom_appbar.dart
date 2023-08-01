import 'package:flutter/material.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
        ],
      ),
    );
  }
}
