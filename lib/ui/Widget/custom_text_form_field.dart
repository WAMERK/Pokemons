import 'package:flutter/material.dart';
import 'package:pokemon/Constants/app_theme.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? type;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validatorFun;
  final void Function()? suffixIconOnTap;
  final void Function()? onTapFun;
  final String? Function(String?)? onChangedFun;
  final TextInputType? textInputType;
  final bool? isPassword;
  final bool? isEdite;
  final bool? noBorder;
  final String? prefixText;
  final bool isReadOnly;
  final bool isEnabled;
  final int maxLines;
  final TextInputAction textInputAction;

  CustomTextFormField({
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.type = 1,
    required this.validatorFun,
    this.onTapFun,
    this.onChangedFun,
    this.suffixIconOnTap,
    this.textInputType,
    this.isPassword = false,
    this.isEdite = false,
    this.noBorder = true,
    this.prefixText,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 40,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.blackColor.withOpacity(0.06),
          blurRadius: 12,
          spreadRadius: 1,
          offset: Offset(0, 5),
        )
      ]),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: AppColors.secondaryColor,
              ),
        ),
        child: TextFormField(
          textInputAction: widget.textInputAction,
          style: TextStyle(fontSize: 14, color: AppColors.darkGray),
          controller: widget.controller,
          obscureText: widget.isPassword!,
          keyboardType: widget.textInputType != null
              ? widget.textInputType
              : TextInputType.text,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: widget.noBorder != null && widget.noBorder!
                  ? BorderSide.none
                  : widget.isEdite!
                      ? BorderSide(color: AppColors.gray, width: 1)
                      : BorderSide(color: AppColors.lightGrey, width: 0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: widget.noBorder != null && widget.noBorder!
                  ? BorderSide.none
                  : widget.isEdite!
                      ? BorderSide(color: AppColors.gray, width: 1)
                      : BorderSide(color: AppColors.lightGrey, width: 0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.redColor, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.redColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.blue, width: 1),
            ),
            focusColor: AppColors.gray,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.gray),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon == null
                ? Container(
                    width: 0,
                  )
                : widget.suffixIcon,
            prefixText: widget.prefixText,
            prefixStyle: TextStyle(color: AppColors.gray),
          ),
          validator: widget.validatorFun,
          readOnly: widget.isReadOnly,
          enabled: widget.isEnabled,
          onTap: widget.onTapFun,
          maxLines: widget.maxLines,
          onChanged: widget.onChangedFun,
        ),
      ),
    );
  }
}
