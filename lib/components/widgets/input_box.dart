import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputBox extends StatelessWidget {
  final String label;
  final String hint;
  final Function onSaved;
  final IconData icon;
  const InputBox(
      {Key key, this.label, this.hint, this.onSaved, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        icon: Icon(icon),
        hintText: hint,
        labelText: label,
        prefixText: '+1 ',
      ),
      keyboardType: TextInputType.phone,
      onSaved: onSaved,
      //maxLength: 14,
      maxLengthEnforced: false,
      // validator: _validatePhoneNumber,
      // TextInputFormatters are applied in sequence.
      // inputFormatters: <TextInputFormatter>[
      //   FilteringTextInputFormatter.digitsOnly,
      //   // Fit the validating format.
      //   _phoneNumberFormatter,
      // ],
    );
  }

  // String _validateName(String value) {
  //   if (value.isEmpty) {
  //     return GalleryLocalizations.of(context).demoTextFieldNameRequired;
  //   }
  //   final nameExp = RegExp(r'^[A-Za-z ]+$');
  //   if (!nameExp.hasMatch(value)) {
  //     return GalleryLocalizations.of(context)
  //         .demoTextFieldOnlyAlphabeticalChars;
  //   }
  //   return null;
  // }
}
