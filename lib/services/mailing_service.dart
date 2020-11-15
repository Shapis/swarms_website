import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import 'email_credentials.dart';

class MailingHelper {
  final String name;
  final String textBody;
  final String email;
  final String phoneNumber;

  MailingHelper({this.name, this.textBody, this.email, this.phoneNumber});

  sendMail() async {
    final smtpServer = gmail(emailingServiceUsername, emailingServicePassword);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(emailingServiceUsername, 'Your name')
      ..recipients.add('shapisftw@gmail.com')
      ..subject = 'Message from the website :: 😀 :: ${DateTime.now()}'
      ..text =
          'Message from\n\nName: $name\nEmail: $email\nPhone Number: ${phoneNumber ?? 'no phone number was provided'}\n\nText Body:\n\n$textBody';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
