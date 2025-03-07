import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.maxLine,
      this.isDense = false,
      this.validator,
      this.controller,
      this.enableFocusBorder = true,
      this.textInputType,
      this.suffixText,
      this.suffixTextStyle,
      this.labelWidget,
      this.borderColor,
      this.borderRadius,
      this.borderWidth,
      this.prefixWidget,
      this.suffixWidget,
      this.textStyle,
      this.enableFill = true,
      this.fillColor,
      this.label,
      this.isObeseureText = false,
      this.labelStyle,
      this.focusBorderColor,
      this.floatingLabelBehavior,
      this.focusNode,
      this.textInputAction,
      this.onFieldSubmitted,
      this.headerText,
      this.isReadOnly = false,
      this.headerTextStyle,
      this.spacing = 0,
      this.initialValue,
      this.inputFormatters,
      this.contentPadding,
      this.maxLength,
      this.textAlign,
      this.onChanged,
      this.onEditingComplete,
      this.onTap,
      this.onSaved,
      this.hintStyle,
      this.hintText,
      this.border,
      this.focusedBorder,
      this.enabledBorder,
      this.disabledBorder});
  final Widget? labelWidget;
  final double? borderRadius;
  final TextAlign? textAlign;
  final String? Function(String? value)? validator;
  final double? borderWidth;
  final Color? borderColor;
  final Color? fillColor;
  final bool enableFill;
  final Widget? suffixWidget;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final Widget? prefixWidget;
  final int? maxLine;
  final double? spacing;
  final TextInputType? textInputType;
  final bool enableFocusBorder;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? label;
  final TextStyle? hintStyle;
  final String? hintText;
  final TextStyle? labelStyle;
  final bool isObeseureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Color? focusBorderColor;
  final FocusNode? focusNode;
  final String? initialValue;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final String? headerText;
  final TextStyle? headerTextStyle;
  final bool isReadOnly;
  final EdgeInsetsDirectional? contentPadding;
  final int? maxLength;
  final bool isDense;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (headerText != null)
          Text(
            headerText ?? "",
            style: headerTextStyle ?? AppFontStyle.medium14,
          ),
        if (headerText != null) const SizedBox(height: 4),
        SizedBox(
          height: spacing,
        ),
        TextFormField(
          obscuringCharacter: "*",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: onSaved,
          onEditingComplete: onEditingComplete,
          onTap: onTap,
          onChanged: onChanged,
          onTapOutside: (pos) {
            FocusScope.of(context).unfocus();
          },
          autofocus: false,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          readOnly: isReadOnly,
          obscureText: isObeseureText,
          validator: validator,
          focusNode: focusNode,
          textInputAction: textInputAction,
          initialValue: initialValue,
          controller: controller,
          maxLines: maxLine,
          textAlign: textAlign ?? TextAlign.start,
          keyboardType: textInputType,
          cursorColor: AppColors.purblePrimary,
          style: textStyle ??
              AppFontStyle.medium15.copyWith(
                fontSize: 14,
              ),
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: enableFill,
            isDense: isDense,
            counterText: "",
            hintText: hintText,
            hintStyle: hintStyle ?? AppFontStyle.regular12.copyWith(color: AppColors.grayE0),
            contentPadding: contentPadding ??
                EdgeInsetsDirectional.only(
                    start: 12, end: 4, bottom: 10, top: 10),
            alignLabelWithHint: true,
            labelText: label,
            labelStyle: labelStyle ??
                AppFontStyle.regular14.copyWith(color: AppColors.grayE0),
            errorStyle: AppFontStyle.medium12.copyWith(color: AppColors.red35),
            focusColor: Colors.black,
            suffixIcon: suffixWidget,
            suffixText: suffixText,
            suffixStyle: suffixTextStyle,
            prefixIcon: prefixWidget,
            label: labelWidget,
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.never,
            errorBorder: enabledBorder ??
                customOutLineBorders(
                  borderRadius: borderRadius,
                  borderColor: AppColors.red35,
                ),
            disabledBorder: disabledBorder ?? customOutLineBorders(),
            border: border ??
                customOutLineBorders(
                    borderColor: AppColors.purblePrimary,
                    borderWidth: 0.1,
                    borderRadius: borderRadius),
            enabledBorder: enabledBorder ??
                customOutLineBorders(borderRadius: borderRadius),
            focusedBorder: focusedBorder ??
                customOutLineBorders(
                  borderRadius: borderRadius,
                  borderColor:
                      enableFocusBorder ? AppColors.purblePrimary : null,
                ),
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder customOutLineBorders(
    {double? borderRadius, Color? borderColor, double? borderWidth}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.scaffoldBackgroundColor,
        width: borderWidth ?? 1,
      ));
}
