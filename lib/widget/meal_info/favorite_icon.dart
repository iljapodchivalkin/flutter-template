
import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onFavoriteChanged;

  const FavoriteIconWidget({super.key, required this.isFavorite, required this.onFavoriteChanged});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0),
      alignment: Alignment.center,
      onPressed: onFavoriteChanged,
      icon: Icon(
        isFavorite ? Icons.star : Icons.star_border,
        color: Colors.orangeAccent,
      ),
    );
  }
}



