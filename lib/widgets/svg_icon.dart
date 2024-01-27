import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySvgIcon extends StatelessWidget {
  final String assetName;
  final String assetNameSelected;
  final bool isSelected;

  MySvgIcon({required this.assetName, required this.isSelected, required this.assetNameSelected});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isSelected? assetNameSelected: assetName,
      color: isSelected ? Colors.black54 : Colors.grey.withOpacity(0.5),
      width: 24,
    );
  }
}
