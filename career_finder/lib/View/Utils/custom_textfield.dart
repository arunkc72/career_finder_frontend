import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextField extends ConsumerWidget {
  final String? text;
  final int? index;
  final TextEditingController? controller;

  const CustomTextField({this.text, super.key,this.index,this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {  
    return Card(
      elevation: 10,
      child: TextFormField(
        controller: controller,
        keyboardType:
            (index == 1) ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: text,
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
