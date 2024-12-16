import 'package:flutter/material.dart';
import 'package:my_portafolio/ui/modules/macos/widgets/alert_dialog_mac.dart';

class ProjectInfoDialog extends StatelessWidget {
  const ProjectInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialogMac(
        title: 'Project',
        buttonText: 'OK',
        onPressed: () {},
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: LayoutBuilder(builder: (context, constraint) {
                          return SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: constraint.maxHeight),
                              child: IntrinsicHeight(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const FlutterLogo(size: 50),
                                        const SizedBox(width: 10),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Chip(
                                                label: const Text('SEE'),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                  vertical: 1,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                backgroundColor: Colors.blue,
                                                labelStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Divider(
                                      color: Colors.white.withOpacity(0.5),
                                      endIndent: 20,
                                    ),
                                    const Text('Descripción',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left),
                                    Text(
                                        'Este es un proyecto de prueba para ver como se ve el dialogo de alerta de mi aplicacion el cual es un portafolio de mis proyectosEste es un proyecto de prueba para ver como se ve el dialogo de alerta de mi aplicacion el cual es un portafolio de mis proyectos.',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                        )),
                                    Divider(
                                      color: Colors.white.withOpacity(0.5),
                                      endIndent: 20,
                                    ),
                                    Text('Previsualización',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(height: 10),
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      'https://picsum.photos/360/240',
                                                      fit: BoxFit.fitWidth,
                                                      height: 240,
                                                      width: 360,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      'https://picsum.photos/360/240',
                                                      fit: BoxFit.fitWidth,
                                                      height: 240,
                                                      width: 360,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            child: Transform(
                                              transform: Matrix4.identity()
                                                ..scale(0.95, 6),
                                              child: Icon(
                                                  Icons
                                                      .keyboard_arrow_right_rounded,
                                                  size: 30,
                                                  semanticLabel:
                                                      '★', // Grosor ajustado del icono

                                                  color: Colors.blue[800]),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }
}
