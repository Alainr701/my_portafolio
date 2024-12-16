import 'package:flutter/material.dart';
import 'package:my_portafolio/ui/modules/macos/dialogs/project_info_dialog.dart';
import 'package:my_portafolio/ui/modules/macos/widgets/alert_dialog_mac.dart';

class ProjectDialog extends StatelessWidget {
  const ProjectDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialogMac(
        title: 'My Projects',
        buttonText: 'OK',
        onPressed: () {},
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 360,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.05),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FlutterLogo(size: 50),
                        const SizedBox(width: 10),
                        const Text('1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My Projects',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Action',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text('Flutter',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200))
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                barrierDismissible: false,
                                barrierColor: Colors.transparent,
                                builder: (context) =>
                                    const ProjectInfoDialog());
                          },
                          child: Chip(
                            label: const Text('SEE'),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Colors.white,
                            labelStyle: const TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://picsum.photos/360/240',
                        fit: BoxFit.fitWidth,
                        height: 240,
                        width: 360,
                      ),
                    )
                  ],
                ),
              ),

              // GridView.count(
              //     shrinkWrap: true,
              //     crossAxisCount: 6,
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 10,
              //     children: [
              //       Container(
              //         height: 20,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //       ),
              //     ])
            ],
          ),
        ));
  }
}
