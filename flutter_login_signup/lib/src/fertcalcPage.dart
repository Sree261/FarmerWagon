import 'package:flutter/material.dart';

class FertiliserCalculatorPage extends StatefulWidget {
  static const routeName = '/fertcalPage';
  @override
  _FertiliserCalculatorPageState createState() =>
      _FertiliserCalculatorPageState();
}

class _FertiliserCalculatorPageState extends State<FertiliserCalculatorPage> {
  TextEditingController areaText = new TextEditingController();

  TextEditingController nitrorText = new TextEditingController();

  TextEditingController nitrofText = new TextEditingController();

  String dropdownValue = 'Nitrogen'; 

  double area = 0.0;

  double nitror = 0.0;

  double nitrof = 0.0;

  double resultantValue = 0.0;

  int amt = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Fertiliser Calculator"),
          // centerTitle: false,
          backgroundColor: Colors.deepPurpleAccent,
          // leading: Padding(
          //   padding: EdgeInsets.all(8.0),
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: areaText,
                  decoration: InputDecoration(
                    labelText: "Total Area(Acres)",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.number,
                ),
                Text(
                  '',
                ),
                Align(
                 alignment: Alignment.centerLeft,
                  child:Text(
                  'Select the Deficient Nutrient',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                  },
                  items: <String>['Nitrogen', 'Phosphate', 'Potash'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
              );
            }).toList(),
          ),
                ),
                TextField(
                  controller: nitrorText,
                  decoration: InputDecoration(
                    labelText: "Recommended Nutrient(lbs)",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: nitrofText,
                  decoration: InputDecoration(
                    labelText: "Nutrient Content Of Fertiliser(%)",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 30),
                Text(
                  'Amount Of Fertiliser: $amt lbs',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.attach_money),
          onPressed: () {
            area = double.parse(areaText.text);
            nitror = double.parse(nitrorText.text);
            nitrof = double.parse(nitrofText.text);
            nitrof = nitrof / 100;

            resultantValue = (nitror / nitrof) * area;
            int x = resultantValue.round();
            print(x);

            setState(() {
              amt = x;
            });
          },
          backgroundColor: Colors.purpleAccent,
        ),
      ),
    );
  }
}
