import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourselistingAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CourselistingAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF512E7E), // #512E7E
              Color(0xFFA073DA), // #A073DA
            ],
            stops: [0.0852, 1.0],
            transform: GradientRotation(194.66 *
                (3.14159265358979323846264338327950288 /
                    180.0)), // Convert degrees to radians
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Course Name',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
