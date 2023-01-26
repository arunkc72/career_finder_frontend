import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextField extends ConsumerWidget {
  final String? text;

  const CustomTextField({this.text, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 10,
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: text,
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter valid $text';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
