// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pokemon/Constants/app_theme.dart';
import 'package:pokemon/routes.dart';
import 'package:pokemon/ui/Pages/AnimationPage/AnimationPageController.dart';

class AnimationPage extends StatefulWidget {
  StringArguments? arguments;
  AnimationPage({super.key, this.arguments});

  @override
  StateMVC<AnimationPage> createState() => _AnimationPageState();
}

PageController? pageController;

class _AnimationPageState extends StateMVC<AnimationPage> {
  late AnimationPageController con;
  double radius = 0;
  Color color = AppColors.darkBlue;
  _AnimationPageState() : super(AnimationPageController()) {
    con = controller as AnimationPageController;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animations',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
              widget.arguments!.name ?? '',
              style: const TextStyle(fontSize: 22),
            )),
            const SizedBox(
              height: 50,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(radius)),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  splashColor: AppColors.transparent,
                  overlayColor:
                      MaterialStateProperty.all(AppColors.transparent),
                  onTap: () {
                    setState(() {
                      radius = 0;
                      color = AppColors.darkBlue;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: AppColors.transparent,
                  overlayColor:
                      MaterialStateProperty.all(AppColors.transparent),
                  onTap: () {
                    setState(() {
                      radius = 25;
                      color = AppColors.blue;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                InkWell(
                  splashColor: AppColors.transparent,
                  overlayColor:
                      MaterialStateProperty.all(AppColors.transparent),
                  onTap: () {
                    setState(() {
                      radius = 125;
                      color = AppColors.redColor;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
