import 'dart:ui';

import 'package:flutter/material.dart';

void showStateSnackBar(BuildContext context, String message, String state) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          height: 70,
          decoration: BoxDecoration(
            color: state == 'success'
                ? Colors.green.withOpacity(0.2)
                : state == 'info'
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.red.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Icon(
                  state == 'success'
                      ? Icons.check_circle
                      : state == 'info'
                          ? Icons.info
                          : Icons.error,
                  color: Colors.white),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ))
            ],
          ),
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 3),
  ));
}
