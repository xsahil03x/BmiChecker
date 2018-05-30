import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();

  double _weight = 0.0;
  double _height = 0.0;
  double _bmi = 0.0;
  int _finalBMI = 0;
  String _result;

  void _calculateBMI() {
    setState(() {
      _weight = double.parse(_weightController.text);
      _height = double.parse(_heightController.text);
      _bmi = _weight / (_height * _height);
      _finalBMI = _bmi.round();

      if (_finalBMI <= 18) {
        _result = "You are Underweight";
      } else if (_finalBMI > 18 && _finalBMI <= 25) {
        _result = "You are Perfect";
      } else if (_finalBMI > 25 && _finalBMI <= 30) {
        _result = "You are Overweight";
      } else if (_finalBMI > 30) {
        _result = "You are Obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(
            "BMI Calculator",
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new Image.asset('images/bmilogosecond.jpg',
                    width: 500.0, height: 200.0)),
            new Container(
                decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.teal, width: 5.0),
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      bottomRight: const Radius.circular(40.0)),
                ),
                height: 285.0,
                width: 350.0,
                margin: const EdgeInsets.all(10.0),
                child: new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new TextField(
                        controller: _ageController,
                        decoration: new InputDecoration(
                            labelText: "Age",
                            hintText: "Enter Age",
                            icon: new Icon(Icons.person)),
                      ),
                      new TextField(
                        controller: _heightController,
                        decoration: new InputDecoration(
                            labelText: "Height",
                            hintText: "Enter height in meters",
                            icon: new Icon(Icons.assessment)),
                      ),
                      new TextField(
                        controller: _weightController,
                        decoration: new InputDecoration(
                            labelText: "Weight",
                            hintText: "Enter weight in kgs",
                            icon: new Icon(Icons.storage)),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: new RaisedButton(
                          elevation: 5.0,
                          onPressed: _calculateBMI,
                          color: Colors.teal,
                          child: new Text(
                            "Calculate",
                            style: new TextStyle(
                                color: Colors.white, fontSize: 16.9),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            new Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Center(
                    child: new Text(
                        _weightController.text.isNotEmpty
                            ? "Your BMI is $_finalBMI : $_result"
                            : "Please Enter Details to check BMI",
                        style: new TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500))))
          ],
        ),
      ),
    );
  }
}
