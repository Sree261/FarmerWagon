import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/pomegtomat.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PotPage extends StatelessWidget {
  static const routeName = '/potPage';

  @override
  Widget build(BuildContext context) {
    final double screen_height = MediaQuery.of(context).size.height;
    // final double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('Disease Detector'),
        backgroundColor: Color(0xffe46b10),
      ),
      body: Container(
          child: StaggeredGridView.count(
        crossAxisCount: 2,
        children: [
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, PomTom.routeName, arguments: true),
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
                          child: Text(
                            "TOMATO",
                            style: TextStyle(
                              fontSize: 30,
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
          InkWell(
            onTap: () => Navigator.pushNamed(context, PomTom.routeName,
                arguments: false),
            child: Padding(
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
                        Text("POMEGRANATE",
                            style: TextStyle(
                              fontSize: 20,
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
          StaggeredTile.extent(1, screen_height * 0.3),
          StaggeredTile.extent(1, screen_height * 0.3),
        ],
      )),
    );
  }
}
