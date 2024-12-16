import 'package:flutter/material.dart';
import 'package:my_portafolio/ui/modules/macos/widgets/alert_dialog_mac.dart';

class AboutMeDialog extends StatelessWidget {
  const AboutMeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialogMac(
        title: 'About Me',
        buttonText: 'OK',
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Center(child: FlutterLogo(size: 120)),
              const SizedBox(height: 10),
              Text(
                'Alain U. Espino Ramos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Experience: 2 years',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('''Skills: Flutter, Dart, NodeJS, 
                MongoDB, Firebase, SQL, 
                HTML, CSS, JavaScript, 
                C, C++, Python, 
                MySQL, Git''',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ))
            ],
          ),
        ));
  }
}
