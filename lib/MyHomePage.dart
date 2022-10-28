import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          iconSize: 30.0,
          onPressed: () {},
          icon: Icon(
            Icons.filter_list,
            color: Colors.blue,
          ),
        ),
        title: Image.asset(
          'assets/logo.png',
          width: width * 0.15,
          height: height * 0.15,
        ),
        actions: [
          IconButton(
            iconSize: 30.0,
            onPressed: () {},
            icon: Icon(
              Icons.manage_search,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: height * 0.1,
            child: ListView.builder(
              itemCount: names.length,
              padding: EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: Container(
                    width: width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color:
                            index == _currentIndex ? Colors.blue : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: index == _currentIndex
                                ? Colors.blue.withOpacity(.2)
                                : Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          )
                        ]),
                    margin:
                        const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "${names[index]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'السعودية،جدة',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: StaggeredGridView.countBuilder(
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                itemCount: CarsNames.length,
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 8,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        children: [
                          Image.asset(
                            "${images[index]}",
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.white,
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            alignment: Alignment.topRight,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${CarsNames[index]}",
                            style: TextStyle(color: Colors.green),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.person),
                        Text('معرض حسن'),
                        Icon(Icons.access_time),
                        Text(' الأن'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> names = [
    'الرئيسة',
    'السيارات',
    'العقار',
    'الدراجات',
    'القوارب',
  ];
  List images = [
    'assets/car2.png',
    'assets/car1.png',
    'assets/car3.png',
    'assets/car4.png',
    'assets/car5.png',
    'assets/car6.png',
    'assets/car7.png',
  ];
  List CarsNames = [
    'لامبورجيني',
    'بي ام دبليو',
    'مرسيدس',
    'اودي',
    'مازيراتي',
    'رولز رويس',
    'اودي',
  ];
}
