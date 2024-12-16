import 'package:flutter/material.dart';
import 'package:my_portafolio/ui/modules/macos/widgets/alert_dialog_mac.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialogMac(
        title: 'My Contact',
        width: 500,
        height: 350,
        buttonText: 'OK',
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: 100,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  )
                ],
              ),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconContact(icon: Icons.email, label: 'Email', onTap: () {}),
                  const SizedBox(width: 20),
                  IconContact(icon: Icons.phone, label: 'Phone', onTap: () {}),
                  const SizedBox(width: 20),
                  IconContact(
                      icon: Icons.language, label: 'Website', onTap: () {}),
                  const SizedBox(width: 20),
                  IconContact(
                      icon: Icons.ios_share, label: 'Share', onTap: () {}),
                ],
              ),
            ],
          ),
        ));
  }
}

class IconContact extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const IconContact({
    super.key,
    required this.icon,
    required this.label,
    this.color = Colors.blue,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: color,
            ),
            child: Icon(icon, color: Colors.white, size: 15),
          ),
          const SizedBox(height: 10),
          Text(label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ))
        ],
      ),
    );
  }
}
