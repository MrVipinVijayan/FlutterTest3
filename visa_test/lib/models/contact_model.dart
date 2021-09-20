import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.emailAddress,
  });

  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String emailAddress;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        emailAddress:
            json["email_address"] == null ? null : json["email_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email_address": emailAddress,
      };

  static Contact copyWith({
    required String id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String emailAddress,
  }) =>
      Contact(
        id: id,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        emailAddress: emailAddress,
      );
}
