import 'package:flutter/material.dart';

import 'package:lastprojects/option/blague.dart';

class AgeSlider extends StatefulWidget {
  final String categoryName;
  final int index;
  const AgeSlider({
    Key? key,
    required this.categoryName,
    required this.index,
  }) : super(key: key);
  @override
  _AgeSliderState createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  double _currentValue = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: Text('Sélection d\'âge'),
        centerTitle: true,
        leading: IconButton(
          style: IconButton.styleFrom(
            fixedSize: const Size(50.0, 50.0),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Âge sélectionné : ${_currentValue.toInt()} ans',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Slider(
              value: _currentValue,
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: (double value) {
                setState(() {
                  _currentValue = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_currentValue < 18) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Votre âge n\'est pas adapté pour ce niveau.'),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlaguePage(
                        categoryName: widget.categoryName,
                        index: widget.index,
                      ),
                    ),
                  );
                }
              },
              child: Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
