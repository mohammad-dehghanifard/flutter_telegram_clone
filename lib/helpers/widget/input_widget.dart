import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    this.controller,
    required this.hintText,
    this.icon,
    this.validator,
    this.radius = 12.0,
    this.type = TextInputType.text,
    this.maxLine,
    this.prefixIcon,
    this.isActive = true,
    this.onChange
  });

  final TextEditingController? controller;
  final String hintText;
  final IconData? icon;
  final IconData? prefixIcon;
  final double radius;
  final TextInputType type;
  final int? maxLine;
  final String? Function(String? value)? validator;
  final bool isActive;
  final Function(String? value)? onChange;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.isActive == false,
      obscureText: widget.type == TextInputType.visiblePassword ? _obscure : false,
      controller: widget.controller,
      maxLines: widget.type == TextInputType.visiblePassword? 1 :widget.maxLine,
      keyboardType: widget.type,
      validator: widget.validator,
      onChanged: widget.onChange ,
      style: TextStyle(color: widget.isActive == false ? const Color(0xFF959595) : const Color(0xFF0A0A39)),
      decoration:  InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon,color: const Color(0xFF959595)) : null,
        hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF959595)),
        contentPadding: const EdgeInsets.all(8),
        suffixIcon: GestureDetector(
          onTap: () {
            if(widget.type == TextInputType.visiblePassword){
              _obscure = !_obscure;
              setState(() {});
            }
          },
          child: Icon(
              widget.type == TextInputType.visiblePassword?  (_obscure?  FeatherIcons.eye  : FeatherIcons.eyeOff )
                  : widget.icon,
              color: const Color(0xFF959595)),
        ),
        filled: true,
        fillColor: context.theme.colorScheme.tertiary,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
        ),
      ),
    );
  }
}