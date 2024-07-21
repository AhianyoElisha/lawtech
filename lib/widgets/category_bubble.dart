import 'package:flutter/material.dart';

class BubbleCategories extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Color shadowColor;
  final Color colorData;
  final String categoryId;
  final VoidCallback onTap;
  final bool isSelected; // Added this parameter

  const BubbleCategories({
    super.key,
    required this.text,
    required this.iconData,
    required this.colorData,
    required this.shadowColor,
    required this.categoryId,
    required this.onTap,
    required this.isSelected, // Initialize this parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: isSelected
                ? null //replace this with onselect function
                : null,
          ),
          child: Stack(
            children: [
              // if (isSelected)
              //   Positioned.fill(
              //     child: Container(
              //       decoration: BoxDecoration(
              //         boxShadow: [
              //           BoxShadow(
              //             color: shadowColor,
              //             blurRadius: 4,
              //             offset: Offset(2, 2),
              //           ),
              //         ],
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //     ),
              //   ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: colorData, width: 2),
                      ),
                      child: Center(
                        child: Icon(
                          iconData,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        text,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
