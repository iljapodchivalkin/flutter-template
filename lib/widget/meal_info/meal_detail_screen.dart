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
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                mealImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 240,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 100, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealTitle,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  if (instructions != null && instructions!.isNotEmpty) ...[
                    Text(
                      "Instructions:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _formatInstructions(instructions!),
                    ),
                  ] else ...[
                    Text(
                      "No instructions available.",
                      style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ],
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Close"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _formatInstructions(String instructions) {
    final List<String> steps = instructions.split('\n');
    return steps.asMap().entries.map((entry) {
      final String step = entry.value.trim();
      return Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Text(
          step,
          style: TextStyle(fontSize: 16),
        ),
      );
    }).toList();
  }
}
