import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconQuater extends StatelessWidget {
  final String iconData;
  final double size;
  final String label;
  final VoidCallback? onTap;
  Offset offset;

  IconQuater({
    super.key,
    required this.iconData,
    this.size = 100,
    required this.label,
    this.onTap,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconData,
              width: size - 60,
              height: size - 60,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
