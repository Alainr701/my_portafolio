import 'package:flutter/material.dart';

class MacOs extends StatelessWidget {
  static const String routeName = '/macOs';
  const MacOs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/background.png',
              ),
            )),
          ),
          Column(children: [
            Container(
              height: 30,
              color: Colors.black.withOpacity(0.2),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.apple,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'MacOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('About Me',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('Projects',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                  const SizedBox(
                    width: 10,
                  ),

                  const Spacer(),
                  //Icono de ingles y español
                  const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
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
            Expanded(child: Container()),
            Container(
                height: 50,
                constraints: const BoxConstraints(maxWidth: 500, minWidth: 400),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.4), width: 0.4),
                ),
                child: Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                    child: Image.asset(
                      'assets/safari.png',
                      width: 30,
                    ),
                  )
                ])),
            const SizedBox(
              height: 10,
            ),
          ])
        ],
      ),
    );
  }
}
