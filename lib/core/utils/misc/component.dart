import 'package:flutter/material.dart';

class Component {
  static double sizeWidth(BuildContext context){
    return MediaQuery.sizeOf(context).width;
  }
  
  static double sizeHeight(BuildContext context){
    return MediaQuery.sizeOf(context).height;
  }

  static double scaleWidth(BuildContext context){
    return MediaQuery.sizeOf(context).width / 360;
  }
  static double scaleHeight(BuildContext context){
    return MediaQuery.sizeOf(context).height / 360;
  }
}