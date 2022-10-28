import 'package:flutter/material.dart';
import 'MyHomePage.dart';

class NavigatonBar extends StatefulWidget {
  const NavigatonBar({super.key});

  @override
  State<NavigatonBar> createState() => _NavigatonBarState();
}

class _NavigatonBarState extends State<NavigatonBar> {
  var currentIndex = 0;
  List<Widget> body = [MyHomePage(), MyHomePage(), MyHomePage(), MyHomePage()];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: body[currentIndex],
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: width * .156,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.10),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: width * .020),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Stack(
              children: [
                Container(
                  width: width * .2126,
                  alignment: Alignment.center,
                  child: Icon(
                    icons[index],
                    size: width * .085,
                    color: index == currentIndex ? Colors.blue : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List icons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.notifications,
    Icons.email,
  ];
}
