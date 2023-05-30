import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final OtpStateProvider = StateProvider<String>((ref) {
  return '';
});


class OtpForm extends ConsumerStatefulWidget {
  const OtpForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtpFormState();
}

class _OtpFormState extends ConsumerState<OtpForm> {
  List<String> otpValues = List.filled(6, '');
  String otp = '';

  updateOtp(String otp, WidgetRef ref) {
  ref.read(OtpStateProvider.notifier).update((state) => otp);
}
  Widget _otpBox(int index) {
    return Container(
      height: 40,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 5),
            blurRadius: 2,
            spreadRadius: 0,
          )
        ],
      ),
      child: TextFormField(
        // maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
            // counter: SizedBox.shrink(),
            border: InputBorder.none),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          otpValues[index] = value;
          otp = otpValues.join();
          updateOtp(otp,ref);
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _otpBox(0),
          _otpBox(1),
          _otpBox(2),
          _otpBox(3),
          _otpBox(4),
          _otpBox(5),
        ],
      ),
    );
  }
}
