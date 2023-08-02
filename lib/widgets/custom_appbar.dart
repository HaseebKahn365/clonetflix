import 'package:clonetflix/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({
    super.key,
    this.scrollOffset = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10.0),
      color: Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(mobile: _CustomAppBarMobile(), desktop: _CustomAppBarDesktop()),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppbarButtons(
                  title: 'TV shows',
                  onTap: () {},
                ),
                _AppbarButtons(
                  title: 'Movies',
                  onTap: () {},
                ),
                _AppbarButtons(
                  title: 'My List',
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppbarButtons(
                  title: 'Home',
                  onTap: () {},
                ),
                _AppbarButtons(
                  title: 'Movies',
                  onTap: () {},
                ),
                _AppbarButtons(
                  title: 'My List',
                  onTap: () {},
                ),
                _AppbarButtons(
                  title: 'Latest',
                  onTap: () {},
                ),
                _AppbarButtons(
                  title: 'TV Shows',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  iconSize: 28.0,
                  color: Colors.white,
                ),
                _AppbarButtons(
                  title: 'KIDS',
                  onTap: () {},
                ),
                _AppbarButtons(
                  title: 'DVD',
                  onTap: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.card_giftcard),
                  iconSize: 28.0,
                  color: Colors.white,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active),
                  iconSize: 28.0,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppbarButtons extends StatelessWidget {
  final String title;
  final Function onTap;
  const _AppbarButtons({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
        ));
  }
}
