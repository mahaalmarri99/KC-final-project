import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_tails/animal_details_screen.dart';
import 'package:happy_tails/menu_screen.dart';

class animal {
  String name;
  String scientificName;
  double age;
  String distanceToUser;
  bool isFemale;
  String imageUrl;
  Color backgroundcolor;

  animal({
    required this.name,
    required this.scientificName,
    required this.isFemale,
    required this.imageUrl,
    required this.age,
    required this.backgroundcolor,
    required this.distanceToUser,
  });
}

bool _selected = false;

class adoptionScreen extends StatefulWidget {
  final Function menuCallback;

  adoptionScreen({required this.menuCallback});

  @override
  State<adoptionScreen> createState() => _adoptionScreenState();
}

class _adoptionScreenState extends State<adoptionScreen> {
  int selectedAnimalIconIndex = 0;

  final List<animal> animals = [
    animal(
      name: 'lely',
      scientificName: 'wildCat',
      age: 2.0,
      distanceToUser: '3.6km',
      isFemale: true,
      imageUrl: ('assets/images/lely.png'),
      backgroundcolor: Color.fromRGBO(203, 213, 216, 1.0),
    ),
    animal(
      name: 'peter',
      scientificName: 'spanish rabbit',
      age: 2.0,
      distanceToUser: '3.6km',
      isFemale: false,
      imageUrl: ('assets/images/peter.png'),
      backgroundcolor: Color.fromRGBO(203, 213, 216, 1.0),
    ),
  ];

  List<String> animalTypes = [
    'menu',
    'cat',
    'dog',
    'bird',
    'rabbit',
  ];

  List<IconData> animalsIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.cat,
    FontAwesomeIcons.dog,
    FontAwesomeIcons.dove,
    FontAwesomeIcons.carrot,
  ];

  Widget builderAnimalIcon(int index) {
    return Padding(
      padding: EdgeInsets.only(right: 30.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectedAnimalIconIndex == index;
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => menuScreen()));
            },
            child: Material(
              color: selectedAnimalIconIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(animalsIcons[index],
                      size: 30.0,
                      color: selectedAnimalIconIndex == index
                          ? Colors.white
                          : Theme.of(context).primaryColor)),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            animalTypes[index],
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: 60.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Icon(FontAwesomeIcons.bars)],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Theme.of(context).primaryColor.withOpacity(0.07),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 22.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.magnifyingGlass,
                                color: Colors.grey),
                            Expanded(
                              child: TextField(
                                style: TextStyle(fontSize: 18.0),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: 'search pet to adopt'),
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.filter,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 120.0,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 20.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: animalTypes.length,
                          itemBuilder: (context, index) {
                            return builderAnimalIcon(index);
                          }),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: animals.length,
                            itemBuilder: (context, index) {
                              final animal = animals[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return AnimalDetailsScreen(animals: animal);
                                  }));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 10.0, left: 20.0, right: 20.0),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        elevation: 4.0,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(
                                                width: deviceWidth * 0.4,
                                              ),
                                              Flexible(
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: <Widget>[
                                                            Text(
                                                              animal.name,
                                                              style: TextStyle(
                                                                fontSize: 26.0,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Icon(
                                                              animal.isFemale
                                                                  ? FontAwesomeIcons
                                                                      .venus
                                                                  : FontAwesomeIcons
                                                                      .mars,
                                                              color:
                                                                  Colors.grey,
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          animal.scientificName,
                                                          style: TextStyle(
                                                            fontSize: 16.0,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10.0,
                                                        ),
                                                        Text(
                                                          '${animal.age}years old',
                                                          style: TextStyle(
                                                            fontSize: 16.0,
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10.0,
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            Icon(
                                                              FontAwesomeIcons
                                                                  .mapLocationDot,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              size: 16.0,
                                                            ),
                                                            SizedBox(
                                                              width: 6.0,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              color: animal.backgroundcolor,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            height: 20.0,
                                            width: deviceWidth * 0.4,
                                          ),
                                          Hero(
                                            tag: animal.name,
                                            child: Image(
                                              image:
                                                  AssetImage(animal.imageUrl),
                                              height: 220.0,
                                              width: deviceWidth * 0.4,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
