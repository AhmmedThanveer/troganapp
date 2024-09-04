import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseIconWidget extends StatelessWidget {
  final String iconUrl;
  final String courseName;
  final List<Color> gradientColors;

  CourseIconWidget({
    required this.iconUrl,
    required this.courseName,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DottedBorder(
          borderType: BorderType.Circle,
          dashPattern: [8, 4],
          color: gradientColors.first,
          strokeWidth: 2,
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            child: CircleAvatar(
              radius: 23,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(iconUrl, scale: 5),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          courseName,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
