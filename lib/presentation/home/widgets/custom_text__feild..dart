import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;

  final bool? isPassword;

  final String? hint;

  final bool? enabled;

  final int? maxLines, minLines, maxLength;

  final String? obscuringCharacter, value;

  final String? Function(String?)? onValidate;

  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;

  final void Function()? onTap, onEditingComplete;

  final TextInputType? keyboardType;

  final List<TextInputFormatter>? inputFormatters;

  final Widget? suffixWidget, prefixIcon;

  final IconData? icon;

  final TextInputAction? action;
  final FocusNode? focusNode;
  final Color? hintColor;

  const CustomTextField(
      {super.key,
      this.controller,
      this.isPassword,
      this.hint,
      this.enabled,
      this.maxLines,
      this.minLines,
      this.maxLength,
      this.obscuringCharacter,
      this.value,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      this.onTap,
      this.onEditingComplete,
      this.keyboardType,
      this.inputFormatters,
      this.suffixWidget,
      this.prefixIcon,
      this.icon,
      this.action,
      this.focusNode,
      this.hintColor,
      this.onValidate});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.value,
      validator: widget.onValidate,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      minLines: widget.minLines,
      obscureText: widget.isPassword ?? false ? obscureText : false,
      obscuringCharacter: "*",
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      style: theme.textTheme.bodyLarge,
      textInputAction: widget.action ?? TextInputAction.done,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword ?? false
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              )
            : widget.suffixWidget,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hint,
        hintStyle: TextStyle(fontSize: 14, color: widget.hintColor),
        counterText: "",
        border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1)),
        focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: theme.primaryColor, width: 1)),
        enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1)),
        disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 1)),
        errorMaxLines: 6,
        errorStyle: const TextStyle(color: Colors.deepOrangeAccent),
        errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Colors.deepOrangeAccent, width: 1)),
      ),
    );
  }

  _CustomTextFieldState();
}
