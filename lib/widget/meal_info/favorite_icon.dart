import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatefulWidget {
  const FavoriteIconWidget({super.key});

  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  bool _isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0),
      alignment: Alignment.center,
      onPressed: _toggleFavorite,
      icon: (_isFavorite
          ? const Icon(
              Icons.star,
              color: Colors.orangeAccent,
            )
          : const Icon(
              Icons.star_border,
              color: Colors.orangeAccent,
            )),
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }
}
