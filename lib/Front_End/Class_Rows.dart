import 'package:flutter/material.dart';

class Rows extends StatelessWidget {
  final Text text;
  final Text text1;
  final VoidCallback onTap;
  final VoidCallback onTap1;
  final Color color;
  final Color color1;

  const Rows(
      {Key key,
        this.text,
        this.onTap,
        this.text1,
        this.onTap1,
        this.color,
        this.color1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              //color: Colors.indigo[100],
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: color),
              height: MediaQuery.of(context).size.height * .08,
              width: MediaQuery.of(context).size.width * .15,
              child: Center(child: text),
            ),
          ),
          GestureDetector(
            onTap: onTap1,
            child: Container(
              //color: Colors.indigo[500],
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: color1),
              height: MediaQuery.of(context).size.height * .08,
              width: MediaQuery.of(context).size.width * .15,
              child: Center(child: text1),
            ),
          ),
        ],
      ),
    );
  }
}