import 'package:flutter/material.dart';
import '../model/ayah.dart';

class AyahWidget extends StatelessWidget {
  final Ayah ayah;
  const AyahWidget(this.ayah);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
      ),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(20.0),
      child: Text(ayah.arabText),
    );
  }
}
