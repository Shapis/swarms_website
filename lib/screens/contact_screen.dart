import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimal/screens/base_screen.dart';

class ContactScreen extends StatelessWidget {
  static const String id = 'contact_screen';

  final Widget sizedBox = SizedBox(height: 30);

  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: [
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            icon: const Icon(Icons.person),
            hintText: 'What do people call you?',
            labelText: 'Name*',
          ),
          keyboardType: TextInputType.name,
          onChanged: (value) {
            print(value);
          },
          //maxLength: 14,
          maxLengthEnforced: false,
          // validator: _validatePhoneNumber,
          // TextInputFormatters are applied in sequence.
          // inputFormatters: <TextInputFormatter>[
          //   FilteringTextInputFormatter.digitsOnly,
          //   // Fit the validating format.
          //   _phoneNumberFormatter,
          // ],
        ),
        sizedBox,
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            icon: const Icon(Icons.phone),
            hintText: 'Where can we reach you?',
            labelText: 'Phone number',
            prefixText: '+1 ',
          ),
          keyboardType: TextInputType.phone,
          onSaved: (value) {
            print(value);
          },
          maxLength: 14,
          maxLengthEnforced: false,

          // validator: _validatePhoneNumber,
          // TextInputFormatters are applied in sequence.
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            // Fit the validating format.
            _phoneNumberFormatter,
          ],
        ),
        sizedBox,
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            icon: const Icon(Icons.email),
            hintText: 'Your email address',
            labelText: 'Email*',
          ),
          keyboardType: TextInputType.emailAddress,
          onSaved: (value) {
            print(value);
          },
          //maxLength: 14,
          maxLengthEnforced: false,
          // validator: _validatePhoneNumber,
          // TextInputFormatters are applied in sequence.
          // inputFormatters: <TextInputFormatter>[
          //   FilteringTextInputFormatter.digitsOnly,
          //   // Fit the validating format.
          //   _phoneNumberFormatter,
          // ],
        ),
        sizedBox,
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText:
                'Tell us how Tyler can help you (e.g. write down what services you require)',
            helperText: 'We\'ll get back to you as soon as possible',
            labelText: 'Talk to us',
          ),
          maxLines: 3,
        ),
        sizedBox,
        Center(
          child: RaisedButton(
            child: Text('SUBMIT'),
            onPressed: () {},
          ),
        ),
        sizedBox,
        Text(
          '* indicates required field',
          style: Theme.of(context).textTheme.caption,
        ),
        sizedBox,
      ],
    );
  }
}

/// Format incoming numeric text to fit the format of (###) ###-#### ##
class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newTextLength = newValue.text.length;
    final newText = StringBuffer();
    var selectionIndex = newValue.selection.end;
    var usedSubstringIndex = 0;
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
