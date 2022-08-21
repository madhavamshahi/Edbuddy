import 'package:edbuddy/models/listModel.dart';
import 'package:edbuddy/models/studyBModel.dart';
import 'package:edbuddy/views/widgets/buddyBox.dart';
import 'package:edbuddy/views/widgets/filter.dart';
import 'package:edbuddy/views/widgets/listBox.dart';
import 'package:edbuddy/views/widgets/majorBox.dart';
import 'package:edbuddy/views/widgets/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:filter_list/filter_list.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:edbuddy/services/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> subjects = [
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
    "Physics",
  ];

  Future<void> _openFilterDialog({required BuildContext context}) async {
    await FilterListDialog.display<String>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(context),
      headlineText: 'Select Subjects',
      height: 500,
      listData: subjects,
      selectedListData: selectedList,
      choiceChipLabel: (item) {
        String g = item as String;
        return g;
      },
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ControlButtonType.All, ControlButtonType.Reset],
      onItemSearch: (sub, query) {
        /// When search query change in search bar then this method will be called
        ///
        /// Check if items contains query
        String? f = sub as String;
        return f.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedList = List.from(list!);
        });
        print(selectedList);
        Navigator.pop(context);
      },
    );
  }

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
  bool isOpened = false;

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  String getTitle(int n) {
    if (n == 0) {
      return "All Listings";
    }
    if (n == 1) {
      return "Find a buddy";
    }

    if (n == 2) {
      return "Same Majors";
    }

    if (n == 3) {
      return "Profile";
    }
    return "null";
  }

  getFAB(int n) {
    if (n == 0) {
      return FloatingActionButton.extended(
        onPressed: () {
          inputListing(context: context);

          // Add your onPressed code here!
        },
        label: Text('Add Listing'),
        icon: Icon(FontAwesomeIcons.plus),
        backgroundColor: Colors.blue,
      );
    }
    if (n == 1) {
      return FloatingActionButton.extended(
        onPressed: () {
          studyBuddyReq(context: context);

          // Add your onPressed code here!
        },
        label: Text('Find buddy'),
        icon: Icon(FontAwesomeIcons.search),
        backgroundColor: Colors.blue,
      );
    }

    if (n == 2) {
      return Container();
    }

    if (n == 3) {
      return Container();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('listings')
                    .orderBy('timeStamp', descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.hasError) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 256,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        // print(snapshot.data!.docs[index].data()['name']);

                        Map data = {};
                        data = snapshot.data!.docs[index].data() as Map;
                        ListingModel listing = ListingModel.fromJson(data);
                        return GestureDetector(
                          onTap: () {
                            showDetails(context: context, listing: listing);
                          },
                          child: ListBox(listing: listing),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
      Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {
                  _openFilterDialog(context: context);
                },
                icon: Icon(FontAwesomeIcons.filter, color: Colors.blue),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('studyBuddyReq')
                    .where('sub', arrayContainsAny: selectedList)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
                  if (snap.hasData) {
                    return ListView.builder(
                        itemCount: snap.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map data = {};
                          data = snap.data!.docs[index].data() as Map;

                          StudyBModel model = StudyBModel.fromJson(data);

                          return BuddyBox(model: model);
                        });
                  }

                  return Container();
                }),
          )

          // Expanded(
          //   child: ListView.builder(itemBuilder: (context, int n) {
          //     return BuddyBox();
          //   }),
          // )
        ],
      ),
      Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    String major = snap.data.data()['major'];

                    print(major);
                    return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .where('major', isEqualTo: major)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            itemCount: snapshot.data!.docs.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 256,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              // print(snapshot.data!.docs[index].data()['name']);

                              Map data = {};
                              data = snapshot.data!.docs[index].data() as Map;

                              print(data);
                              return MajorBox(
                                name: data['name'],
                                major: data['major'],
                                email: data['email'],
                              );
                            },
                          );
                        }

                        return Container();
                      },
                    );
                  }

                  return Container();
                }),
          ),
        ],
      ),
      UserProfileView(),
    ];

    return SideMenu(
      key: _endSideMenuKey,
      type: SideMenuType.slide,
      menu: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: buildMenu(),
      ),
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: Scaffold(
        floatingActionButton: getFAB(_selectedIndex),
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "${getTitle(_selectedIndex)}",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.userAstronaut,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 20,
            )
          ],
          leading: GestureDetector(
            onTap: () {
              toggleMenu(true);
            },
            child: Icon(
              FontAwesomeIcons.bars,
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11),
              child: GNav(
                rippleColor: Colors.orange,
                hoverColor: Colors.orange,
                gap: 8,
                activeColor: Colors.blueAccent,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: FontAwesomeIcons.house,
                    textSize: 15,
                    text: 'Listings',
                    iconSize: 18,
                    iconColor: Colors.orange,
                  ),
                  GButton(
                    icon: FontAwesomeIcons.heart,
                    textSize: 15,
                    iconSize: 18,
                    iconColor: Colors.orange,
                    text: 'Study Buddy',
                  ),
                  GButton(
                    icon: FontAwesomeIcons.searchengin,
                    iconColor: Colors.orange,
                    textSize: 1,
                    iconSize: 18,
                    text: 'Find',
                  ),
                  GButton(
                    textSize: 15,
                    icon: FontAwesomeIcons.user,
                    iconSize: 18,
                    iconColor: Colors.orange,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildMenu() {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(vertical: 50.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "${FirebaseAuth.instance.currentUser!.photoURL}"),
                backgroundColor: Colors.white,
                radius: 35.0,
              ),
              SizedBox(height: 16.0),
              Text(
                "Hello",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.handshake, size: 20.0, color: Colors.white),
          title: const Text("Credits"),
          textColor: Colors.white,
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading:
              const Icon(Icons.verified_user, size: 20.0, color: Colors.white),
          title: const Text("About Us"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.settings, size: 20.0, color: Colors.white),
          title: const Text("Settings"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.email, size: 20.0, color: Colors.white),
          title: const Text("Contact Us"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.book, size: 20.0, color: Colors.white),
          title: const Text("Terms and Conditions"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.book_online_sharp,
              size: 20.0, color: Colors.white),
          title: const Text("Privacy Policy"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
      ],
    ),
  );
}

List<String> selectedList = ["Maths"];

class Filter extends StatefulWidget {
  Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<String> subjects = [
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
    "Physics",
  ];

  Future<void> _openFilterDialog({required BuildContext context}) async {
    await FilterListDialog.display<String>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(context),
      headlineText: 'Select Subjects',
      height: 500,
      listData: subjects,
      selectedListData: selectedList,
      choiceChipLabel: (item) {
        String g = item as String;
        return g;
      },
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ControlButtonType.All, ControlButtonType.Reset],
      onItemSearch: (sub, query) {
        /// When search query change in search bar then this method will be called
        ///
        /// Check if items contains query
        String? f = sub as String;
        return f.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedList = List.from(list!);
        });
        print(selectedList);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(8),
        child: IconButton(
          onPressed: () {
            _openFilterDialog(context: context);
          },
          icon: Icon(FontAwesomeIcons.filter, color: Colors.blue),
        ),
      ),
    );
  }
}
