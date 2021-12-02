import 'dart:ui';

import 'package:flutter/material.dart';

class FondoBienvenida extends StatelessWidget {
  const FondoBienvenida({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/control.jpg'))),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
          child: RecuadroInferior(),
        )
      ],
    );
  }
}

class RecuadroInferior extends StatelessWidget {
  const RecuadroInferior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 7,
          width: MediaQuery.of(context).size.width,
          color: Colors.white.withOpacity(0.3),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Inicie Escaneo',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
