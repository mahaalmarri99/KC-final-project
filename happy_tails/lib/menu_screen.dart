import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';

class menuScreen extends StatefulWidget {
  menuScreen({super.key});

  @override
  State<menuScreen> createState() => _menuScreenState();
}

class _menuScreenState extends State<menuScreen> {
  int selectedMenuIndex = 0;

  List<String> menuItems = [
    'Home',
    'adopted',
    'messages',
    'add pet',
    'my Profile',
  ];

  List<IconData> icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.paw,
    FontAwesomeIcons.envelope,
    FontAwesomeIcons.plus,
    FontAwesomeIcons.user,
  ];

  Widget buildMenuItemsRow(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMenuIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(icons[index],
                color: selectedMenuIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.5)),
            SizedBox(
              width: 16.0,
            ),
            Text(
              menuItems[index],
              style: TextStyle(
                  color: selectedMenuIndex == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'happy tails',
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        home: Material(
          child: Container(
            color: Color.fromARGB(255, 119, 165, 107),
            child: SafeArea(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 24.0,
                            backgroundColor: Colors.orange,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "sara",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.0),
                              ),
                              Text(
                                "active status",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: menuItems
                            .asMap()
                            .entries
                            .map((MapEntry) => buildMenuItemsRow(MapEntry.key))
                            .toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.gear,
                            color: Colors.white.withOpacity(0.5),
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            "settings | log out",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
