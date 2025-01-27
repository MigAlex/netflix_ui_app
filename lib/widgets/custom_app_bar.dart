import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        color: Colors.black
            .withOpacity((scrollOffset / 420).clamp(0, 1).toDouble()),
        child: Responsive(
          mobile: _CustomAppBarMobile(),
          desktop: _CustomAppBarDesktop(),
        ));
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                    title: 'TV Shows', onTap: () => print('TV shows')),
                _AppBarButton(title: 'Movies', onTap: () => print('Movies')),
                _AppBarButton(title: 'My List', onTap: () => print('MyList')),
              ],
            ),
          ),
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
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: 'Home', onTap: () => print('Home')),
                _AppBarButton(
                    title: 'TV Shows', onTap: () => print('TV shows')),
                _AppBarButton(title: 'Movies', onTap: () => print('Movies')),
                _AppBarButton(title: 'Latest', onTap: () => print('Latest')),
                _AppBarButton(title: 'My List', onTap: () => print('MyList')),
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
                  icon: Icon(Icons.search, size: 28, color: Colors.white),
                  onPressed: () => print('search'),
                ),
                _AppBarButton(title: 'Kids', onTap: () => print('Kids')),
                _AppBarButton(title: 'DVD', onTap: () => print('DVD')),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.card_giftcard, size: 28, color: Colors.white),
                  onPressed: () => print('Gift'),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.notifications, size: 28, color: Colors.white),
                  onPressed: () => print('Notifications'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
