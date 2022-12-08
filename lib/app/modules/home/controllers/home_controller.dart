import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> images = [
    "https://media.tenor.com/C_ciVkqgnvoAAAAC/hbd-birthday.gif",
    "https://media.tenor.com/5cvWDBC8HXwAAAAi/sardar-creativehatti.gif",
    "https://media.tenor.com/ZboI1cuS9rMAAAAC/family-hug.gif",
  ];

  TextEditingController ageCnt = TextEditingController();
  TextEditingController nameCnt = TextEditingController();

  @override
  void onInit() {
    log("Controller Init...");
    super.onInit();
  }
}
