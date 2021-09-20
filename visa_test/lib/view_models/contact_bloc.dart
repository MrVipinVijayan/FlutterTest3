import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visa_test/models/contact_model.dart';
import 'package:visa_test/repo/contact_repo.dart';
import 'package:visa_test/utils/utils.dart';

import 'contact_events.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvents, ContactState> {
  final ContactRepo contactRepo;
  ContactBloc({required this.contactRepo}) : super(ContactInitState());

  List<Contact> contacts = [];
  Contact newContact = Utils.getNewContact();

  @override
  Stream<ContactState> mapEventToState(ContactEvents event) async* {
    yield ContactLoadingState();
    if (event is FetchContactsEvent) {
      if (contacts.isNotEmpty) {
        yield ContactLoadedState(contacts: contacts);
        return;
      }
      await _updateContactList();
      yield ContactLoadedState(contacts: contacts);
      return;
    }
    if (event is ClearAddContactEvent) {
      newContact = Utils.getNewContact();
      return;
    }
    if (event is AddContactEvent) {
      ContactState contactState = _validateUserInput(newContact);
      bool success = contactState is AddContactValidState;
      if (success) {
        await _addNewContact();
        await Utils.sortContacts(contacts);
        yield AddContactSuccessState();
        yield ContactLoadedState(contacts: contacts);
        return;
      }
      yield contactState;
    }
    if (event is EditContactEvent) {
      ContactState contactState = _validateUserInput(event.editingContact);
      if (contactState is AddContactInvalidState) {
        yield contactState;
        return;
      }
      await _updateContact(event);
      await Utils.sortContacts(contacts);
      yield UpdateSuccessState();
      yield ContactLoadedState(contacts: contacts);
    }
    if (event is DeleteContactEvent) {
      _deleteContact(event);
      yield DeleteSuccessState();
      yield ContactLoadedState(contacts: contacts);
    }
  }

  Future<void> _updateContactList() async {
    contacts.clear();
    contacts.addAll(await contactRepo.getContactList());
    await Utils.sortContacts(contacts);
  }

  Future<void> _addNewContact() async {
    contacts.add(newContact);
  }

  Future<void> _deleteContact(DeleteContactEvent event) async {
    Contact deletingContact = event.deletingContact;
    contacts.removeWhere((contact) => contact.id == deletingContact.id);
    await Utils.sortContacts(contacts);
  }

  Future<void> _updateContact(EditContactEvent event) async {
    Contact editingContact = event.editingContact;
    Contact foundContact =
        contacts.firstWhere((contact) => contact.id == editingContact.id);
    foundContact.firstName = editingContact.firstName;
    foundContact.lastName = editingContact.lastName;
    foundContact.emailAddress = editingContact.emailAddress;
    foundContact.phoneNumber = editingContact.phoneNumber;
  }

  ContactState _validateUserInput(Contact contact) {
    if (contact.firstName.isEmpty) {
      return AddContactInvalidState(
        message: 'First name cannot be empty',
      );
    }
    if (contact.lastName.isEmpty) {
      return AddContactInvalidState(
        message: 'Last name cannot be empty',
      );
    }
    if (!Utils.isValidEmail(contact.emailAddress)) {
      return AddContactInvalidState(
        message: 'Please enter a valid email',
      );
    }
    if (!Utils.isValidPhoneNumber(contact.phoneNumber)) {
      return AddContactInvalidState(
        message: 'Please enter a valid phone number',
      );
    }
    return AddContactValidState();
  }
}
