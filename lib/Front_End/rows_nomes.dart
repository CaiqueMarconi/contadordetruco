import 'package:flutter/material.dart';

class RowsNomes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Nós",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "vs",
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "Eles",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
        ],
      ),
    );
  }
}
