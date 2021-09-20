import 'package:visa_test/models/contact_model.dart';
import 'package:visa_test/utils/utils.dart';

abstract class ContactRepo {
  Future<List<Contact>> getContactList();
}

class ContactServices implements ContactRepo {
  @override
  Future<List<Contact>> getContactList() async {
    List<Contact> contacts = [];
    // for (int count = 1; count < 11; count++) {
    //   Contact contact = Contact(
    //     id: Utils.getUniqueContactId(),
    //     firstName: 'John',
    //     lastName: 'Appleseed$count',
    //     phoneNumber: '098765432$count',
    //     emailAddress: 'johnappleseed$count@gmail.com',
    //   );
    //   contacts.add(contact);
    // }

    Contact contact = Contact(
      id: Utils.getUniqueContactId(),
      firstName: 'John',
      lastName: 'Appleseed',
      phoneNumber: '0987654321',
      emailAddress: 'johnappleseed@gmail.com',
    );
    contacts.add(contact);
    contact = Contact(
      id: Utils.getUniqueContactId(),
      firstName: 'James',
      lastName: 'Henry',
      phoneNumber: '0987654322',
      emailAddress: 'jameshenry@gmail.com',
    );
    contacts.add(contact);
    contact = Contact(
      id: Utils.getUniqueContactId(),
      firstName: 'Sophia',
      lastName: 'Emma',
      phoneNumber: '0987654323',
      emailAddress: 'sophiaemma@gmail.com',
    );
    contacts.add(contact);
    contact = Contact(
      id: Utils.getUniqueContactId(),
      firstName: 'William',
      lastName: 'Liam',
      phoneNumber: '0987654324',
      emailAddress: 'williamliam@gmail.com',
    );
    contacts.add(contact);
    contact = Contact(
      id: Utils.getUniqueContactId(),
      firstName: 'Isabella',
      lastName: 'sophia',
      phoneNumber: '0987654325',
      emailAddress: 'isabellasophia@gmail.com',
    );
    contacts.add(contact);
    contact = Contact(
      id: Utils.getUniqueContactId(),
      firstName: 'Ava',
      lastName: 'Emily',
      phoneNumber: '0987654326',
      emailAddress: 'avaemily@gmail.com',
    );
    contacts.add(contact);
    return contacts;
  }
}
