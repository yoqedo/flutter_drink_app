import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;

  final List<String> images = [
    'assets/images/dose1.png',
    'assets/images/dose2.png',
    'assets/images/dose3.png',
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.9);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  width: double.infinity,
                  //color: Colors.blue,
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/images/dslogo.png'),
                      SizedBox(height: 5),
                      Text(
                        'PREMIUM BEERS',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: IconButton(
                              icon: Icon(
                                Icons.shopping_basket,
                                color: Colors.black,
                                size: 30,
                              ),
                              onPressed: () {}),
                        ),
                        Positioned(
                          top: 20,
                          right: 10,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(135, 60, 255, 0.9),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: images.length,
                    itemBuilder: (context, position) {
                      return imageSlider(position);
                    }),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Color.fromRGBO(135, 60, 255, 0.9),
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          iconSize: 30.0,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.folder),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.opacity),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.place),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(''),
            ),
          ],
        ),
      ),
    );
  }

  imageSlider(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 450,
            width: Curves.easeInOut.transform(value) * 300,
            child: widget,
          ),
        );
      },
      child: Container(
        //color: Colors.lightBlue,
        child: Image.asset(images[index]),
      ),
    );
  }
}
