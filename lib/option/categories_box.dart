import 'package:flutter/material.dart';
import 'package:lastprojects/option/blague.dart';
import 'package:lastprojects/option/options_18ans.dart';

class CategoriesBox extends StatefulWidget {
  final String categoryName;
  final String imagePath;
  final int index;

  const CategoriesBox(
      {required this.categoryName,
      required this.imagePath,
      required this.index});

  @override
  State<CategoriesBox> createState() => _CategoriesBoxState();
}

class _CategoriesBoxState extends State<CategoriesBox> {
  bool isAdulteSelected = false;
  // double ageValue = 18;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.categoryName == "Adulte") {
          setState(() {
            isAdulteSelected = true;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AgeSlider(
                      categoryName: widget.categoryName,
                      index: widget.index,
                    )),
          );
        } else {
          Navigator.push(
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
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(20.0),
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
          ),
          image: DecorationImage(
            image: AssetImage(widget.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            widget.categoryName,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
