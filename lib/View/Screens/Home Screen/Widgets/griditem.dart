import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class griditem extends StatelessWidget {
  const griditem({
    super.key,
    required this.gradient,
    required this.colorslist,
    required this.index,
    required this.course,
  });

  final LinearGradient gradient;
  final List<Color> colorslist;
  final int index;
  final Map<String, String> course;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            course['icon']!,
            width: 50,
            height: 50,
          ),
          SizedBox(height: 15),
          Container(
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
                color: colorslist[index],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      16,
                    ),
                    bottomRight: Radius.circular(16))),
            child: Center(
              child: Text(
                course['title']!,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
