import 'package:email_validator/email_validator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:visa_test/models/contact_model.dart';

import 'app_logger.dart';

class Utils {
  static final uuid = Uuid();

  static getNewContact() {
    final Contact newContact = Contact(
      id: getUniqueContactId(),
      firstName: '',
      lastName: '',
      emailAddress: '',
      phoneNumber: '',
    );
    return newContact;
  }

  static getUniqueContactId() {
    return uuid.v1();
  }

  static isValidEmail(String? email) {
    return null != email && EmailValidator.validate(email);
  }

  static isValidPhoneNumber(String? phone) {
    return null != phone && phone.trim().length == 10;
  }

  static sortContacts(List<Contact> contacts) async {
    contacts.sort((a, b) {
      return a.firstName.toLowerCase().compareTo(b.firstName.toLowerCase());
    });
  }

  static Future<void> launchPhoneDialer(String? contactNumber) async {
    if (null == contactNumber || contactNumber.isEmpty) {
      log('No Contact Number');
      return;
    }
    final Uri _phoneUri = Uri(scheme: "tel", path: contactNumber);
    try {
      if (await canLaunch(_phoneUri.toString()))
        await launch(_phoneUri.toString());
    } catch (error) {
      log('Cannot Dial');
    }
  }
}
