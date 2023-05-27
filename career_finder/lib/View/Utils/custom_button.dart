import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants.dart';

class CustomButton extends ConsumerWidget {
  final String? text;
  final String? nextpage;
  final VoidCallback? ontap;
  const CustomButton({this.text, this.nextpage, this.ontap, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: (ontap == null)
          ? () {
              if (nextpage != null) Navigator.pushNamed(context, '$nextpage');
            }
          : ontap,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 45,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: myPrimaryColor,
              offset: Offset(1, 3),
              blurRadius: 5,
              spreadRadius: 0,
            )
          ],
        ),
        child: Text('$text',
            textScaleFactor: 1.5, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
