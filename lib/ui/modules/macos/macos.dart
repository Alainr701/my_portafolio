import 'package:flutter/material.dart';

class MacOs extends StatefulWidget {
  static const String routeName = '/macOs';
  const MacOs({super.key});

  @override
  State<MacOs> createState() => _MacOsState();
}

class _MacOsState extends State<MacOs> {
  List<Offset> squarePositions = [
    Offset(50, 50),
    Offset(150, 50),
  ];
  int selectedSquareIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/background.png',
        ),
      )),
      child: Column(children: [
        Container(
          height: 30,
          color: Colors.black.withOpacity(0.3),
          child: Row(
            children: [
              const SizedBox(width: 10),
              const Icon(
                Icons.apple,
                color: Colors.white,
                size: 20,
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
              const Text('About Me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              const SizedBox(width: 10),
              const Text(
                'Contact',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 10),
              const Text('Projects',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              const SizedBox(width: 10),
              const Spacer(),
              const Icon(
                Icons.language,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 10),
              const Text('Mon Dec 25 19:51',
                  style: TextStyle(
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: LayoutBuilder(
                      // constraints: const BoxConstraints(maxWidth: 500, minWidth: 400),
                      builder: (context, constraints) {
                    return Container(
                      // color: Colors.black/.withOpacity(0.3),
                      child: Stack(
                        children: [
                          for (int i = 0; i < squarePositions.length; i++)
                            Positioned(
                              left: squarePositions[i].dx,
                              top: squarePositions[i].dy,
                              child: Draggable(
                                rootOverlay: true,
                                feedback: SquareWidget(),
                                feedbackOffset: Offset.zero,
                                childWhenDragging: Container(),
                                onDraggableCanceled: (velocity, offset) {
                                  setState(() {
                                    squarePositions[i] =
                                        _adjustPosition(offset, constraints);
                                  });
                                },
                                child: SquareWidget(),
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
                Container(
                  height: 60,
                  constraints:
                      const BoxConstraints(maxWidth: 500, minWidth: 400),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.4), width: 0.4),
                  ),
                  child: Row(
                    children: [
                      Tooltip(
                        message: 'Safari',
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)),
                          child: Image.asset(
                            'assets/safari.png',
                            width: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    ));
  }

  Offset _adjustPosition(Offset offset, BoxConstraints constraints) {
    double adjustedX = offset.dx;
    double adjustedY = offset.dy;

    if (adjustedX < 0) {
      adjustedX = 0;
    } else if (adjustedX > constraints.maxWidth - 100) {
      adjustedX = constraints.maxWidth - 100;
    }

    if (adjustedY < 0) {
      adjustedY = 0;
    } else if (adjustedY > constraints.maxHeight - 100) {
      adjustedY = constraints.maxHeight - 100;
    }

    return Offset(adjustedX, adjustedY);
  }
}

class SquareWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.blue,
    );
  }
}
