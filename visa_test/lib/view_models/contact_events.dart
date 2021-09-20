import 'package:visa_test/models/contact_model.dart';

class ContactEvents {}

class FetchContactsEvent extends ContactEvents {}

class AddContactEvent extends ContactEvents {}

class ClearAddContactEvent extends ContactEvents {}

class EditContactEvent extends ContactEvents {
  final Contact editingContact;
  EditContactEvent(this.editingContact);
}

class DeleteContactEvent extends ContactEvents {
  final Contact deletingContact;
  DeleteContactEvent(this.deletingContact);
}

class SelectContactEvent extends ContactEvents {
  final Contact selectedContact;
  SelectContactEvent(this.selectedContact);
}
