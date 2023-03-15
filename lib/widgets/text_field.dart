import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Icon icons;
  final TextEditingController myController;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.icons,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: myController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'the $labelText is required';
        }
        return null;
      },
      style: const TextStyle(
        decoration: TextDecoration.underline,
        decorationThickness: 0, //yazdığımız yazının alt çizgisi olmaması
      ),
      cursorColor: Colors.deepOrange, //yazmak için tıkladığımızda yeşil yanıp sönen yer
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: Colors.deepOrange),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: Colors.deepOrange),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 2, color: Colors.red),
          ),
          prefixIcon: icons,
          iconColor: Colors.green,
          prefixIconColor: Colors.black,
          hintStyle: TextStyle(color: Colors.grey[600]),
          labelStyle: const TextStyle(
            color: Colors.black,
          )),
    );
  }
}
