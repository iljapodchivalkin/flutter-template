import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealImage;
  final String mealTitle;
  final String? instructions;

  const MealDetailScreen({
    required this.mealImage,
    required this.mealTitle,
    this.instructions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          child: Image.network(
            mealImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 100, color: Colors.grey),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                mealTitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              
              if (instructions != null && instructions!.isNotEmpty) ...[
                Text(
                  instructions!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
