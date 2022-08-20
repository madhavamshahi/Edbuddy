import 'package:edbuddy/views/widgets/filter.dart';
import 'package:edbuddy/views/widgets/listBox.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:edbuddy/services/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  static List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Image(
              height: 80,
              width: 150,
              image: AssetImage("assets/images/illus6.png"),
            ),
            Text(
              "Hey guys I have a spare math book which I want to give for free, please feel free to send me a text message on this number, i'll be very happy to help you out.",
              maxLines: 5,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    ),
    Center(
      child: Text(
        'Study Buddy',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Nearby Learners',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Profile',
        style: optionStyle,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 256,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      showDetails(context: context);
                    },
                    child: ListBox());
              },
            ),
          ),
        ],
      ),
      Column(
        children: [
          Filter(),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/illus6.png"),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "August 20",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Madhavam Shahi"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.blue,
                      ),
                      child: Text(
                        "Maths",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.message,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      Center(
        child: Text(
          'Nearby Learners',
          style: optionStyle,
        ),
      ),
      Center(
        child: Text(
          'Profile',
          style: optionStyle,
        ),
      ),
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
        floatingActionButton: _selectedIndex == 0
            ? FloatingActionButton.extended(
                onPressed: () {
                  inputListing(context: context);

                  // Add your onPressed code here!
                },
                label: Text('Add Listing'),
                icon: Icon(FontAwesomeIcons.plus),
                backgroundColor: Colors.blue,
              )
            : Container(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: _selectedIndex == 0
              ? Text(
                  "All Listings",
                  style: TextStyle(color: Colors.black),
                )
              : Container(),
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
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 22.0,
              ),
              SizedBox(height: 16.0),
              Text(
                "Hello, John Doe",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
          title: const Text("Home"),
          textColor: Colors.white,
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading:
              const Icon(Icons.verified_user, size: 20.0, color: Colors.white),
          title: const Text("Profile"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.monetization_on,
              size: 20.0, color: Colors.white),
          title: const Text("Wallet"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading:
              const Icon(Icons.shopping_cart, size: 20.0, color: Colors.white),
          title: const Text("Cart"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading:
              const Icon(Icons.star_border, size: 20.0, color: Colors.white),
          title: const Text("Favorites"),
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
      ],
    ),
  );
}
