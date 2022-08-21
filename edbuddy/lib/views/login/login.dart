import 'package:edbuddy/views/widgets/googleSignin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String major = "Maths";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      'Ed-Buddy',
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your partner in studies',
                      style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                    Image.asset(
                      'assets/images/illus6.png',
                      height: 200,
                    ),
                    Text(
                      'Login to continue',
                      style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: DropdownSearch<String>(
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          baseStyle: TextStyle(color: Colors.white),
                          dropdownSearchDecoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 0.0)),
                          ),
                        ),
                        popupProps: PopupProps.menu(
                          textStyle: TextStyle(color: Colors.white),
                          showSelectedItems: true,
                          disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items: [
                          "Computer Science",
                          "Data Science",
                          "Economics",
                          "Biology",
                          "Maths",
                          "Chemistry",
                          "Pshycology",
                          "Music",
                          "Macroeconomics",
                          "History",
                          "Political Science",
                          "Business",
                          "Geology",
                          "Astronomy",
                          "Finance",
                          "Civics",
                          "Geography",
                          "Physics"
                        ],
                        onChanged: (String? s) {
                          setState(() {
                            major = s!;
                          });

                          print(major);
                        },
                        selectedItem: "Maths",
                      ),
                    ),
                    GoogleSignInButton(major: major),
                    SizedBox(height: 200),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
