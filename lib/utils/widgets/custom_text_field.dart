import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:mawdo333/utils/constant/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType keyboardType;
  final Widget? prefixIcon, suffixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;
  final bool? disable;
  final List<TextInputFormatter>? inputFormatters;
  final bool? border;
  final Color? borderColor;
  final Color? backGroundColor;
  final TextAlign? textAlignment;
  final Color? textColor;
  final bool? label;
  final Color? activeBorderColor;
  final bool? enableSuffix;
  final bool? enablePrefix;

  const CustomTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.validator,
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines,
      this.hintStyle,
      this.maxLength,
      this.contentPadding,
      this.disable,
      this.inputFormatters,
      this.border,
      this.borderColor,
      this.textAlignment,
      this.textColor,
      this.label,
      this.backGroundColor,
      this.activeBorderColor,
      this.enableSuffix,
      this.enablePrefix});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorMessage;
  bool obscureText = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return IgnorePointer(
      ignoring: widget.disable ?? false,
      child: TextFormField(
        focusNode: _focusNode,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        scrollPadding: EdgeInsets.zero,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        textAlign:
            isRtl ? TextAlign.right : widget.textAlignment ?? TextAlign.left,
        onChanged: (val) {
          if (widget.validator != null) {
            errorMessage = widget.validator!(val);
          }
          if (widget.onChanged != null) {
            widget.onChanged!(val);
          }
          setState(() {});
        },
        style: Get.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: widget.textColor ?? AppColors.grey,
            fontFamily: 'Raleway'),
        obscureText: widget.keyboardType == TextInputType.visiblePassword
            ? obscureText
            : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backGroundColor ?? AppColors.white,
          hintStyle: widget.hintStyle ??
              Get.textTheme.bodyLarge?.copyWith(
                  color: AppColors.grey, fontSize: 12, fontFamily: 'Raleway'),
          hintText: widget.label == true ? null : widget.hintText?.tr,
          prefixIcon: widget.enableSuffix == true
              ? widget.prefixIcon
              : _focusNode.hasFocus
                  ? null
                  : widget.prefixIcon,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: widget.enableSuffix == true
                ? widget.suffixIcon
                : _focusNode.hasFocus
                    ? widget.suffixIcon
                    : null,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.grey,
            ),
          ),
          labelText: widget.label == true ? widget.hintText?.tr : null,
          labelStyle: widget.hintStyle ??
              Get.textTheme.bodyLarge?.copyWith(
                  color: AppColors.grey, fontSize: 14, fontFamily: 'Raleway'),
          alignLabelWithHint: false,
          errorText: null,
          helperText: null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: errorMessage == null
                  ? widget.borderColor ?? AppColors.grey
                  : AppColors.error,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: errorMessage == null
                  ? widget.activeBorderColor ?? AppColors.primary
                  : AppColors.error,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.error,
            ),
          ),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
