import 'package:flutter/material.dart';
import 'package:my_portafolio/ui/modules/macos/macos.dart';

class SplashMacOS extends StatefulWidget {
  const SplashMacOS({super.key});

  @override
  State<SplashMacOS> createState() => _SplashMacOSState();
}

class _SplashMacOSState extends State<SplashMacOS>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 3.0).animate(animationController);
    animationController.forward().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const MacOs();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/mac.png',
            width: 60,
            height: 60,
          ),
          const SizedBox(
            height: 50,
          ),
          Stack(
            children: [
              Container(
                width: 300,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget? child) {
                  return Container(
                    width: animation.value * 100,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
