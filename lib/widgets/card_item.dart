import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final bool showRemoveButton;

  const CardItem({this.showRemoveButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(height: 10, width: 80, color: Colors.grey.shade400),
              SizedBox(height: 10),
            ],
          ),

          if (showRemoveButton)
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
        ],
      ),
    );
  }
}
