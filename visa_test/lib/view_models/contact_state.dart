import 'package:equatable/equatable.dart';
import 'package:visa_test/models/contact_model.dart';

abstract class ContactState extends Equatable {
  @override
  List<Object> get props => [];
}

class ContactInitState extends ContactState {}

class ContactLoadingState extends ContactState {}

class ContactLoadedState extends ContactState {
  final List<Contact> contacts;
  ContactLoadedState({required this.contacts});
}

class ContactErrorState extends ContactState {
  final error;
  ContactErrorState({this.error});
}

class AddContactInvalidState extends ContactState {
  final String message;
  AddContactInvalidState({required this.message});
}

class AddContactValidState extends ContactState {}

class AddContactSuccessState extends ContactState {}

class DeleteSuccessState extends ContactState {}

class UpdateSuccessState extends ContactState {}
