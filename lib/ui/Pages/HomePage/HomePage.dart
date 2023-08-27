import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pokemon/Constants/app_theme.dart';
import 'package:pokemon/routes.dart';
import 'package:pokemon/ui/Pages/HomePage/HomePageController.dart';
import 'package:pokemon/ui/Widget/costume_elevated_button.dart';
import 'package:pokemon/ui/Widget/custom_text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  StateMVC<HomePage> createState() => _HomePageState();
}

PageController? pageController;

class _HomePageState extends StateMVC<HomePage> {
  late HomePageController con;

  _HomePageState() : super(HomePageController()) {
    con = controller as HomePageController;
  }
  TextEditingController? txtNamecontroller;

  @override
  void initState() {
    txtNamecontroller = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: txtNamecontroller,
              hintText: 'Enter your Name',
              prefixIcon: null,
              validatorFun: (p0) {
                return null;
              },
              onChangedFun: (p0) {
                setState(() {});
                return null;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              txtNamecontroller!.text,
              style: TextStyle(fontSize: 22),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  txtNamecontroller!.clear();
                });
              },
              splashColor: AppColors.transparent,
              overlayColor: MaterialStateProperty.all(AppColors.transparent),
              child: const SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      color: AppColors.redColor,
                    ),
                    Text(
                      "Clear text",
                      style: TextStyle(color: AppColors.redColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CostumeElevatedButton(
                    color: AppColors.darkBlue,
                    child: const Text(
                      "Go to page 1",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    onPressedFun: () {
                      Navigator.pushNamed(context, Routes.animationPage,
                          arguments:
                              StringArguments(name: txtNamecontroller!.text));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CostumeElevatedButton(
                    child: const Text(
                      "Go to page 2",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    onPressedFun: () {
                      Navigator.pushNamed(context, Routes.pokemonsPage);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
