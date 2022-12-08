// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put<HomeController>(HomeController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey 👋, Zaid Bashir",
                    style: GoogleFonts.redHatDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0XFF1D2D3A),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Want to calculate your Remaining Time till your 100th Birthday 🎂",
                    style: GoogleFonts.redHatDisplay(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0XFF1D2D3A),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 270,
                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(height: 400.0),
                      items: controller.images.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(i),
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.transparent),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0XFFF5F5F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return "Please Enter Name";
                              } else {
                                return null;
                              }
                            }),
                            textAlignVertical: TextAlignVertical.center,
                            controller: controller.nameCnt,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 20, bottom: 15),
                              border: InputBorder.none,
                              hintText: "Enter Your Name",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0XFFF5F5F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return "Please Enter Age";
                              } else {
                                return null;
                              }
                            }),
                            textAlignVertical: TextAlignVertical.center,
                            controller: controller.ageCnt,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 20, bottom: 15),
                              border: InputBorder.none,
                              hintText: "Enter Your Age",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Center(
                                        child: Text(
                                          "Hundred Yeas Checker",
                                          style: GoogleFonts.redHatDisplay(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0XFF1D2D3A),
                                          ),
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 300,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                color: Colors.orange),
                                            child: Image.network(
                                              "https://media.tenor.com/yw7lR4A6vBAAAAAC/fireworks-firework.gif",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Center(
                                            child: Text(
                                              "Hey ${controller.nameCnt.text} You have ${100 - int.parse(controller.ageCnt.text)} Years to be 100 Years Old",
                                              style: GoogleFonts.redHatDisplay(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0XFF1D2D3A),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            } else {}
                          },
                          child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  "Calculate",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
