import 'package:flutter/material.dart';
import 'package:vegipak/app/navigation/vegitable/model/vegitable_item.dart';

class VegitableProv extends ChangeNotifier {
  int gridView = 2;

  void setGridView(int value) {
    gridView = value;
    notifyListeners();
  }

  var items = [
    VegitableItem(
        0, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    VegitableItem(
        1, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    VegitableItem(
        2, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    VegitableItem(
        3, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    VegitableItem(
        4, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    VegitableItem(
        5, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    VegitableItem(
        6, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    VegitableItem(
        7, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    VegitableItem(
        8, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    VegitableItem(
        9, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    VegitableItem(
        10, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    VegitableItem(
        11, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    VegitableItem(
        12, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    VegitableItem(
        13, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    VegitableItem(
        14, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    VegitableItem(
        15, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
    VegitableItem(
        16, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    VegitableItem(
        17, "Potato / آلو", "assets/images/vegi/potato.png", "100", "kg"),
    VegitableItem(
        18, "Carrot / گاجر", "assets/images/vegi/carrot.png", "100", "kg"),
  ];
}