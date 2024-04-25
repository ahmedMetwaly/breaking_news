import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class Name extends StatefulWidget {
  const Name({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.nameController,
      validator: (value) {
        if (value!.isEmpty) {
          return S.current.requiredField;
        } else if (value.contains("[0-9]")) {
          print(value);
          return S.current.notValidName;
        }
        return null;
      },
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: S.current.name,
      ),
    );
  }
}
