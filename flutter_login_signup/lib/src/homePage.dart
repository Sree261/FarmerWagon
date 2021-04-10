import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/fertcalcPage.dart';
import 'package:flutter_login_signup/src/pot.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    final double screen_height = MediaQuery.of(context).size.height;
    // final double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        backgroundColor: Color(0xffe46b10),
      ),
      body: Container(
          child: StaggeredGridView.count(
        crossAxisCount: 2,
        children: [
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              PotPage.routeName,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Material(
                elevation: 5,
                color: Colors.indigo[100],
                borderRadius: BorderRadius.circular(30),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Disease Detector",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Material(
              elevation: 5,
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(30),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Weather Updates",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Material(
              elevation: 5,
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(30),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Community",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(
                context, FertiliserCalculatorPage.routeName),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Material(
                elevation: 5,
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(30),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Fertiliser Calculator",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, screen_height * 0.4),
          StaggeredTile.extent(1, screen_height * 0.4),
          StaggeredTile.extent(1, screen_height * 0.2),
          StaggeredTile.extent(1, screen_height * 0.2),
        ],
      )),
    );
  }
}
