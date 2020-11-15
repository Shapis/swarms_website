import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:minimal/screens/base_screen.dart';
import 'package:minimal/services/mailing_service.dart';

class ContactScreen extends StatefulWidget {
  static const String id = 'contact_screen';

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final Widget sizedBox = SizedBox(height: 30);

  final _requiredValidator =
      RequiredValidator(errorText: 'this field is required');

  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  final GlobalKey<FormState> _formKeyTop = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyBottom = GlobalKey<FormState>();

  bool _submitWasPressed = false;
  bool _isCountryCodeUS = true;

  String _name;
  String _email;
  String _phoneNumber;
  String _textBody;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: [
        Form(
          key: _formKeyTop,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                autovalidateMode: _submitWasPressed
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                decoration: InputDecoration(
                  filled: true,
                  icon: const Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name*',
                ),
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  _name = value;
                },
                validator: _requiredValidator,
              ),
              sizedBox,
              TextFormField(
                autovalidateMode: _submitWasPressed
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                decoration: InputDecoration(
                  filled: true,
                  icon: const Icon(Icons.email),
                  hintText: 'Your email address',
                  labelText: 'Email*',
                ),
                validator: MultiValidator(
                    [EmailValidator(errorText: 'enter a valid email address')]),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _email = value;
                },
                //validator: validators.isEmail,
              ),
              sizedBox,
            ],
          ),
        ),
        IntlPhoneField(
          maxLength: _isCountryCodeUS ? 14 : null,
          initialCountryCode: 'US',
          decoration: InputDecoration(
            filled: true,
            hintText: 'Where can I reach you?',
            labelText: 'Phone number',
          ),
          onChanged: (value) {
            _phoneNumber = value.completeNumber;
            setState(() {
              _isCountryCodeUS = (value.countryISOCode == 'US');
            });
          },

          // TextInputFormatters are applied in sequence.
          inputFormatters: _isCountryCodeUS
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  // Fit the validating format.
                  _phoneNumberFormatter,
                ]
              : null,
        ),
        Form(
          key: _formKeyBottom,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox,
              TextFormField(
                autovalidateMode: _submitWasPressed
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                validator: _requiredValidator,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText:
                      'Tell us how Tyler can help you (e.g. write down what services you require)',
                  helperText: 'We\'ll get back to you as soon as possible',
                  labelText: 'Talk to us',
                ),
                maxLines: 3,
                onChanged: (value) {
                  _textBody = value;
                },
              ),
              sizedBox,
              Center(
                child: RaisedButton(
                  child: Text('SUBMIT'),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    setState(() {
                      _submitWasPressed = true;
                    });
                    if (_formKeyTop.currentState.validate() &&
                        _formKeyBottom.currentState.validate()) {
                      print('attempting to send email');
                      MailingHelper(
                        name: _name,
                        email: _email,
                        phoneNumber: _phoneNumber,
                        textBody: _textBody,
                      ).sendMail();
                    }
                  },
                ),
              ),
              sizedBox,
              Text(
                '* indicates required field',
                style: Theme.of(context).textTheme.caption,
              ),
              sizedBox,
            ],
          ),
        ),
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
