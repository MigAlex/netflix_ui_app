import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

import '../models/models.dart';

class ContentHeader extends StatelessWidget {
  final Content featureContent;

  const ContentHeader({Key key, this.featureContent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featureContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featureContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(icon: Icons.add, title: 'List', onTap: () {}),
              _PlayButton(),
              VerticalIconButton(
                  icon: Icons.info_outline, title: 'Info', onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        padding: const EdgeInsets.fromLTRB(16, 5, 21, 5),
        onPressed: () => print('Play'),
        color: Colors.white,
        label: const Text(
          'Play',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
        ));
  }
}
