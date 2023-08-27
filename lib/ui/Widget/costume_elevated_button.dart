import 'package:flutter/material.dart';
import 'package:pokemon/Constants/app_theme.dart';

class CostumeElevatedButton extends StatefulWidget {
  final Widget? child;
  final void Function()? onPressedFun;
  final int type;
  final bool enable;
  final bool isBrown;
  final Color color;
  const CostumeElevatedButton({
    required this.child,
    required this.onPressedFun,
    this.type = 1,
    this.enable = true,
    this.isBrown = false,
    this.color = AppColors.blue,
  });

  @override
  _CostumeElevatedButtonState createState() => _CostumeElevatedButtonState();
}

class _CostumeElevatedButtonState extends State<CostumeElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        clipBehavior: Clip.hardEdge,
        onPressed: widget.onPressedFun,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(widget.color),
        ),
        child: widget.child,
      ),
    );
  }
}
