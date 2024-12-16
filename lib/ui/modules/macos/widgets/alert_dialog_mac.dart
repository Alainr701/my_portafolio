import 'package:flutter/material.dart';

class AlertDialogMac extends StatelessWidget {
  final String buttonText;
  final String title;
  final Widget child;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const AlertDialogMac({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.child,
    this.width = 350,
    this.height = 450,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 0.7),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.4),
              blurRadius: 8.0,
              spreadRadius: 6.0,
              offset: const Offset(0.0, 7.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              IconTopMac(onTap: () {
                Navigator.of(context).pop();
              }),
              const SizedBox(width: 5),
              const IconTopMac(
                active: false,
              ),
              const SizedBox(width: 5),
              const IconTopMac(
                active: false,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 40),
            ]),
            const SizedBox(height: 10),
            child
          ],
        ),
      ),
    );
  }
}

class IconTopMac extends StatefulWidget {
  final VoidCallback? onTap;
  final bool active;

  const IconTopMac({
    super.key,
    this.onTap,
    this.active = true,
  });

  @override
  State<IconTopMac> createState() => _IconTopMacState();
}

class _IconTopMacState extends State<IconTopMac> {
  Icon? icon;
  @override
  Widget build(BuildContext context) {
    if (!widget.active) {
      return Container(
        width: 13,
        height: 13,
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          shape: BoxShape.circle,
        ),
      );
    }
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            icon = const Icon(Icons.close, size: 12);
          });
        },
        onExit: (event) {
          setState(() {
            icon = null;
          });
        },
        child: ClipRect(
          child: Container(
            width: 13,
            height: 13,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: icon ?? Container(),
          ),
        ),
      ),
    );
  }
}
