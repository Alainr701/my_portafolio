import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portafolio/settings/app_assets.dart';
import 'package:my_portafolio/ui/modules/macos/dialogs/about_me_dialog.dart';
import 'package:my_portafolio/ui/modules/macos/dialogs/contact_dialog.dart';
import 'package:my_portafolio/ui/modules/macos/dialogs/project_dialog.dart';
import 'package:my_portafolio/ui/widgets/app_open_url.dart';
import 'package:my_portafolio/ui/widgets/icon_quater.dart';

class MacOs extends StatefulWidget {
  static const String routeName = '/macOs';
  const MacOs({super.key});

  @override
  State<MacOs> createState() => _MacOsState();
}

class _MacOsState extends State<MacOs> {
  final overlayPortalController = OverlayPortalController();
  String currentTime = '';
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime =
            '${convertDayToString(DateTime.now().weekday)}  ${convertMonthToString(DateTime.now().month)} ${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}';
      });
    });
    super.initState();
  }

  List<IconQuater> icons = [
    IconQuater(
      label: 'LinkedIn',
      iconData: 'assets/link.png',
      offset: const Offset(50, 50),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(AppAssets.background),
      )),
      child: Stack(
        children: [
          ModalBarrier(
            onDismiss: () {
              overlayPortalController.hide();
            },
          ),
          Column(children: [
            Container(
              height: 30,
              color: Colors.black.withOpacity(0.3),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  OverlayPortal(
                    controller: overlayPortalController,
                    overlayChildBuilder: (context) {
                      return Positioned(
                        top: 32,
                        left: 5,
                        // child: ClipRect(
                        child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 0.5),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 0.3,
                                  )),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 15,
                                    sigmaY: 15,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextBackground(
                                            text: 'Sobre mi',
                                            onTap: () {
                                              buildDialogAboutMe(context);
                                              overlayPortalController.hide();
                                            }),
                                        TextBackground(
                                            text: 'Contacto',
                                            onTap: () {
                                              _buildDialogContact(context);
                                              overlayPortalController.hide();
                                            }),
                                        Divider(
                                          color: Colors.white.withOpacity(0.4),
                                          height: 1,
                                        ),
                                        TextBackground(
                                            text: 'Proyectos',
                                            onTap: () {
                                              _buildDialogProject(context);
                                              overlayPortalController.hide();
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      );
                    },
                    child: GestureDetector(
                        onTap: () {
                          overlayPortalController.toggle();
                        },
                        child: const Icon(
                          Icons.apple,
                          color: Colors.white,
                          size: 20,
                        )),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: const Text(
                      'MacOS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      buildDialogAboutMe(context);
                    },
                    child: const Text('About Me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        )),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      _buildDialogContact(context);
                    },
                    child: const Text(
                      'Contact',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      _buildDialogProject(context);
                    },
                    child: const Text('Projects',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        )),
                  ),
                  const SizedBox(width: 10),
                  const Spacer(),
                  const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(currentTime,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  children: [
                    for (int i = 0; i < icons.length; i++)
                      Positioned(
                        left: icons[i].offset.dx,
                        top: icons[i].offset.dy,
                        child: Draggable(
                            rootOverlay: true,
                            feedback: icons[i],
                            feedbackOffset: Offset.zero,
                            childWhenDragging: const SizedBox.shrink(),
                            onDragUpdate: (details) {
                              setState(() {
                                icons[i].offset = _adjustPosition(
                                    details.delta + icons[i].offset,
                                    constraints,
                                    const Size(50, 50));
                              });
                            },
                            // onDraggableCanceled: (velocity, offset) {
                            //   setState(() {
                            //     print('prueba : ${icons[i].offset}');
                            //     icons[i].offset =
                            //         _adjustPosition(offset, constraints);
                            //   });
                            // },
                            child: icons[i]),
                      ),
                  ],
                );
              }),
            ),
            Container(
              height: 60,
              width: 270,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Colors.white.withOpacity(0.4), width: 0.4),
              ),
              child: Row(
                children: [
                  IconButtonNavigationBar(
                    text: 'Safari',
                    img: AppAssets.safariIcon,
                    onTap: () {},
                  ),
                  const SizedBox(width: 10),
                  IconButtonNavigationBar(
                    img: 'assets/link.png',
                    text: 'Linkedin',
                    onTap: () {
                      AppOpen.url(
                          'https://www.linkedin.com/in/alain-ramos-5a34701a5/');
                    },
                  ),
                  const SizedBox(width: 10),
                  IconButtonNavigationBar(
                    img: 'assets/flutter.png',
                    text: 'My Projects',
                    color: Colors.transparent,
                    onTap: () {},
                  ),
                  const SizedBox(width: 10),
                  IconButtonNavigationBar(
                    img: 'assets/contact.png',
                    text: 'Contact',
                    color: Colors.transparent,
                    onTap: () {},
                  ),
                  const SizedBox(width: 10),
                  IconButtonNavigationBar(
                    img: 'assets/git.png',
                    text: 'Github',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ]),
        ],
      ),
    ));
  }

  Future<dynamic> _buildDialogProject(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        builder: (context) => const ProjectDialog());
  }

  Future<dynamic> _buildDialogContact(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        builder: (context) => const ContactDialog());
  }

// Future<dynamic> buildDialogAboutMe(BuildContext context) {
//   return showCupertinoModalPopup(
//     context: context,
//     builder: (BuildContext context) {
//       return CupertinoActionSheet(
//         title: const Text('About Me'),
//         message: const Text('This is a demo of a Mac-like dialog'),
//         actions: <Widget>[
//           CupertinoActionSheetAction(
//             child: const Text('Close'),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
  Future<dynamic> buildDialogAboutMe(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset buttonPosition = button.localToGlobal(Offset.zero);
    print(buttonPosition);
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const AboutMeDialog();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.translate(
          offset: Tween<Offset>(
            begin: Offset(-300, -300), // Posición inicial desde la izquierda
            end: Offset.zero, // Posición final de la animación (centro)
          ).animate(animation).value,
          child: Transform.rotate(
            angle: Tween<double>(begin: 0.5, end: 1.0)
                    .animate(animation)
                    .value *
                2 *
                3.1415, // Ajusta los valores de begin y end según el ángulo deseado
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  double withContainer = 40;

  Offset _adjustPosition(
      Offset offset, BoxConstraints constraints, Size elementSize) {
    double adjustedX = offset.dx;
    double adjustedY = offset.dy;

    if (adjustedX < 0) {
      adjustedX = 0;
    } else if (adjustedX > constraints.maxWidth - elementSize.width) {
      adjustedX = constraints.maxWidth - elementSize.width;
    }

    if (adjustedY < 0) {
      adjustedY = 0;
    } else if (adjustedY > constraints.maxHeight - elementSize.height) {
      adjustedY = constraints.maxHeight - elementSize.height;
    }

    return Offset(adjustedX, adjustedY);
  }

  String convertDayToString(int day) {
    switch (day) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return 'Error';
    }
  }

  String convertMonthToString(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Error';
    }
  }
}

class IconButtonNavigationBar extends StatefulWidget {
  const IconButtonNavigationBar(
      {super.key,
      required this.img,
      this.onTap,
      required this.text,
      this.color = Colors.white});
  final String img;
  final String text;
  final VoidCallback? onTap;
  final Color? color;

  @override
  State<IconButtonNavigationBar> createState() =>
      _IconButtonNavigationBarState();
}

class _IconButtonNavigationBarState extends State<IconButtonNavigationBar> {
  int selectedSquareIndex = -1;
  double transformedSquareIndex = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            transformedSquareIndex = 1.2;
          });
        },
        onExit: (event) {
          setState(() {
            transformedSquareIndex = 1;
          });
        },
        child: Transform.scale(
          scale: transformedSquareIndex,
          child: Tooltip(
            message: widget.text,
            verticalOffset: 35,
            preferBelow: false,
            child: Container(
              decoration: BoxDecoration(
                  color: widget.color, borderRadius: BorderRadius.circular(7)),
              child: Image.asset(
                widget.img,
                width: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextBackground extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  const TextBackground({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  State<TextBackground> createState() => _TextBackgroundState();
}

class _TextBackgroundState extends State<TextBackground> {
  Color color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            color = Colors.blue.shade700;
          });
        },
        onExit: (event) {
          setState(() {
            color = Colors.transparent;
          });
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          margin: const EdgeInsets.only(bottom: 5),
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}


// ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Container(
//                           height: 60,
//                           width: 400,
//                           decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(15),
//                             border: Border.all(color: Colors.black, width: 0),
//                           ),
//                           child: BackdropFilter(
//                               filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                               child: const Text('asd'))),
//                     ),
//                   );