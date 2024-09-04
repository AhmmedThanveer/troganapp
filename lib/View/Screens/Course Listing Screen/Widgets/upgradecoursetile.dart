import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Upgradecoursetile extends StatelessWidget {
  const Upgradecoursetile({
    super.key,
    required this.screenH,
  });

  final double screenH;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: screenH / 7.5,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFFFBF4DA), borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upgrade and unlock\n the full course',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEB5443),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {},
                  child: Text(
                    'Upgrade',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
