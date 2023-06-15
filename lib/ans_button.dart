import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnsButton extends StatelessWidget {
  const AnsButton({required this.ansText, required this.onClick, super.key});

  final String ansText;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: Text(
          ansText,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
