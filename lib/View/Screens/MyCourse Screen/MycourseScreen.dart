import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:dotted_border/dotted_border.dart';
import 'package:troganapp/Model/CourseModel.dart';
import 'package:troganapp/Utill/List/list.dart';
import 'package:troganapp/View%20Model/Provider/ApiService.dart';
import 'package:troganapp/View/Screens/Course%20Listing%20Screen/courselistingscreen.dart';
// import 'package:troganapp/View/Screens/Home%20Screen/Widgets/Bottombar.dart';
import 'package:troganapp/View/Screens/MyCourse%20Screen/Widgets/Courseround.dart';
import 'package:troganapp/View/Screens/MyCourse%20Screen/Widgets/StackedContainer.dart';
import 'package:troganapp/View/Screens/MyCourse%20Screen/Widgets/TestseriesItem.dart';
import 'package:troganapp/View/Screens/MyCourse%20Screen/Widgets/appbarhome.dart';
import 'package:troganapp/View/Screens/MyCourse%20Screen/Widgets/griditem.dart';

class Mycoursescreen extends StatefulWidget {
  const Mycoursescreen({super.key});

  @override
  State<Mycoursescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Mycoursescreen> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Future<MycourseModel> fetchCourseData() async {
    final response = await http
        .get(Uri.parse('${Api.baseUrl}my_course?auth_token=${Api.authtoken}'));

    if (response.statusCode == 200) {
      return MycourseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(166.0), // Default height for AppBar
        child: FutureBuilder<MycourseModel>(
          future: fetchCourseData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return appbarhome();
            } else if (snapshot.hasError) {
              return AppBar(
                title: Center(child: SizedBox.shrink()),
              );
            } else if (snapshot.hasData) {
              final userData = snapshot.data!.data.userdata;
              return appbarhomewidget(userData: userData);
            }
            return AppBar();
          },
        ),
      ),
      body: FutureBuilder<MycourseModel>(
        future: fetchCourseData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('404 not found'));
          } else if (snapshot.hasData) {
            final subjects = snapshot.data!.data.subjects;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: coursess.length,
                      itemBuilder: (context, index) {
                        final gradient = backgroundGradients[
                            index % backgroundGradients.length];
                        final course = coursess[index];

                        return griditem(
                          index: index,
                          gradient: gradient,
                          course: course,
                          colorslist: colorslist,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Courses',
                          style: GoogleFonts.inter(
                            color: Color.fromARGB(255, 5, 5, 5),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'See All',
                          style: GoogleFonts.inter(
                            color: Color(0xFF512E7E),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of icons per row
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: subjects.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Courselistingscreen(
                                      courseid: subjects[index].courseId,
                                      sectionid: subjects[index].oldSectionId),
                                ));
                          },
                          child: CourseIconWidget(
                            gradientColors:
                                gradients[index % gradients.length].colors,
                            iconUrl: subjects[index].icon,
                            courseName: subjects[index].title,
                          ),
                        );
                      },
                    ),
                  ),
                  StackedImageContainerWidget(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 10),
                    child: Text(
                      "Latest Test Series",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    child: TestseriesGriditem(),
                  ),
                ],
              ),
            );
          }
          return Center(child: Text('No data available'));
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 223, 217, 217),
        buttonBackgroundColor: Color(0xFF512E7E),
        color: Colors.white,
        index: 2,
        animationDuration: const Duration(milliseconds: 300),
        items: <Widget>[
          Image.asset(
            'assets/images/home.png',
            height: 30,
            width: 40,
          ),
          Image.asset(
            'assets/images/Subtract.png',
            height: 30,
            color: Colors.grey,
            width: 40,
          ),
          Image.asset(
            'assets/images/trophy.png',
            height: 30,
            width: 40,
          ),
          Image.asset(
            'assets/images/Reading.png',
            height: 30,
            width: 40,
          ),
          Image.asset(
            'assets/images/home.png',
            height: 30,
            width: 40,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
