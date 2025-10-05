import 'package:flutter/material.dart';
import 'package:pet_productivity_app/utils/app_colors.dart';

class AnimatedStatusWidget extends StatefulWidget {
  final VoidCallback onBedRoomPressed;
  final VoidCallback onParkPressed;
  final int selectedView; // Add selectedView parameter

  const AnimatedStatusWidget({
    super.key,
    required this.onBedRoomPressed,
    required this.onParkPressed,
    required this.selectedView,
  });

  @override
  State<AnimatedStatusWidget> createState() => _AnimatedStatusWidgetState();
}

class _AnimatedStatusWidgetState extends State<AnimatedStatusWidget> {
  double _bedroom = 1.0;
  double _park = 1.0;

  void _animateBedroom() async {
    setState(() => _bedroom = 0.85);
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => _bedroom = 1.0);
    widget.onBedRoomPressed();
  }

  void _animatePark() async {
    setState(() => _park = 0.85);
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => _park = 1.0);
    widget.onParkPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBeige, // Base background color
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bedroom with press animation and individual background
          GestureDetector(
            onTap: _animateBedroom,
            child: AnimatedScale(
              scale: _bedroom,
              duration: const Duration(milliseconds: 100),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: widget.selectedView == 0
                      ? Colors
                            .white // Light up only this half when selected
                      : Colors.transparent, // Transparent when not selected
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Icon(
                  Icons.bed,
                  color: widget.selectedView == 0
                      ? AppColors
                            .lightBeige // Dark icon when selected
                      : Colors.white, // White icon when not selected
                  size: 22,
                ),
              ),
            ),
          ),
          // Park with press animation and individual background
          GestureDetector(
            onTap: _animatePark,
            child: AnimatedScale(
              scale: _park,
              duration: const Duration(milliseconds: 100),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: widget.selectedView == 1
                      ? Colors
                            .white // Light up only this half when selected
                      : Colors.transparent, // Transparent when not selected
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Icon(
                  Icons.park,
                  color: widget.selectedView == 1
                      ? AppColors
                            .lightBeige // Dark icon when selected
                      : Colors.white, // White icon when not selected
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
