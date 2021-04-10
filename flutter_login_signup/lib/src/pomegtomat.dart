import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class PomTom extends StatefulWidget {
  static const routeName = '/tomorpom';
  @override
  _PomTomState createState() => _PomTomState();
}

class _PomTomState extends State<PomTom> {
  List _outputs;
  File _image;
  bool _loading = false, did = false, tomorpom;

  @override
  void didChangeDependencies() {
    if (!did) {
      tomorpom = ModalRoute.of(context).settings.arguments;
      print(tomorpom);
      _loading = true;

      loadModel(tomorpom).then((value) {
        setState(() {
          print('hello');
          _loading = false;
        });
      });

      did = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe46b10),
        title: Text(tomorpom ? 'Tomato' : 'Pomegranate'),
      ),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null ? Container() : Image.file(_image),
                  SizedBox(
                    height: 20,
                  ),
                  _outputs != null
                      ? Text(
                          "${_outputs[0]["label"]}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            background: Paint()..color = Colors.white,
                          ),
                        )
                      : Container()
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 'camera',
              onPressed: pickImage2,
              child: Icon(Icons.camera),
            ),
            FloatingActionButton(
              heroTag: 'picker',
              onPressed: pickImage,
              child: Icon(Icons.image),
            ),
          ],
        ),
      ),
    );
  }

  pickImage2() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }

  pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  loadModel(bool top) async {
    await Tflite.loadModel(
      model: top ? "assets/tom_model.tflite" : "assets/pom_model.tflite",
      labels: top ? "assets/labels_tom.txt" : "assets/labels_pom.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
