import 'package:flutter/material.dart';

class MealInfoCard extends StatefulWidget {
  const MealInfoCard({super.key});

  

  @override
  State<MealInfoCard> createState() => _MealInfoCardState();
}

class _MealInfoCardState extends State<MealInfoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(15),
        transform: _isHovered
            ? Matrix4.translationValues(0, -10, 0) 
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10, 
              offset: _isHovered ? Offset(0, 5) : Offset(0, 5),
            ),
          ],
        ),
        child: SizedBox(
          width: 250,
          child: Column(
            children: [
              Image.network(
                'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg',
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Spaghetti alla Carbonara',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

