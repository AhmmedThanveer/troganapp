import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class whatsapptile extends StatelessWidget {
  const whatsapptile({
    super.key,
    required this.screenH,
  });

  final double screenH;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Container(
        height: screenH / 7.5,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0x1A4CAF50), borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' WhatsApp ലെ സഹായത്തിനായി',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '8602145675',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4CAF50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.call_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Whatsapp',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
