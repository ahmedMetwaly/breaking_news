import "package:flutter/material.dart";
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../generated/l10n.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/values_manager.dart';

class Phone extends StatefulWidget {
  final TextEditingController controller;
  const Phone({
    super.key,
    required this.controller,
  });

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  String getCountry(String country) {
    switch (country) {
      case "Egypt":
        return "EG";
      case "USA":
        return "US";
      case "France":
        return "FR";
      default:
        return "EG";
    }
  }

  @override
  Widget build(BuildContext context) {
    PhoneNumber number = PhoneNumber(isoCode: "eg");
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        //print(number.phoneNumber);
      },
      onInputValidated: (bool value) {
        //print(value);
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DROPDOWN,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      
      selectorTextStyle:const TextStyle(color: Colors.black),
      spaceBetweenSelectorAndTextField: SizeManager.sSpace,
      inputDecoration: InputDecoration(
        label: Text(S.current.phoneNumber),
      ),
      initialValue: number,
      textFieldController: widget.controller,
      formatInput: true,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(SizeManager.borderRadiusOfInputField),
          borderSide: const BorderSide(
            color: ColorsManager.lightPrimary,
          )),
      onSaved: (PhoneNumber number) {
        //print('On Saved: $number');
      },
    );
  }
}
