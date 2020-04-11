import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(FirstScreen());
int currentSlide = 0;

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var imgList = [
    'assets/images/asset1.png',
    'assets/images/asset2.png',
    'assets/images/asset3.png',
  ];

  CarouselSlider carouselSlider;
  _dotPage(i) {
    setState(() {
      currentSlide = i;
    });
  }

  // goToNext() {
  //   carouselSlider.nextPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  // }

  // goToPrevious() {
  //   carouselSlider.previousPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                child: carouselSlider = CarouselSlider(
                    height: MediaQuery.of(context).size.height / 2.5,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    realPage: currentSlide,
                    onPageChanged: (index) {
                      _dotPage(index);
                    },
                    items: imgList.map((imgUrl) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            imgUrl,
                            fit: BoxFit.fill,
                          ),
                        );
                      });
                    }).toList()),
              ),
              SizedBox(
                height: 30.0,
              ),
              BulletPage(),
              SizedBox(
                height: 30.0,
              ),
              HeroText(),
              SizedBox(
                height: 40.0,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      width: 350,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5)),
                      width: 350,
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Sign Up for an account',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans'),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

HeroText() {
  String boldText = "a";
  String thinText = "a";

  if (currentSlide == 0) {
    boldText = "Discover";
    thinText = 'Find affordable and hidden treasures';
  } else if (currentSlide == 1) {
    boldText = "Sell";
    thinText = 'Make money, while freeing up space';
  } else {
    boldText = "Chat instantly";
    thinText = 'Buy and sell simply by chatting';
  }

  return Container(
    child: Column(
      children: <Widget>[
        Text(
          boldText,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(thinText,
            style: TextStyle(
                fontSize: 18, color: Colors.grey, fontFamily: 'OpenSans')),
      ],
    ),
  );
}

BulletPage() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: currentSlide == 0 ? Colors.blueAccent : Colors.black26,
          ),
        ),
        SizedBox(
          width: 6.0,
        ),
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: currentSlide == 1 ? Colors.blueAccent : Colors.black26,
          ),
        ),
        SizedBox(
          width: 6.0,
        ),
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: currentSlide == 2 ? Colors.blueAccent : Colors.black26,
          ),
        ),
      ],
    ),
  );
}
