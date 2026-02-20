import 'package:contacts/model/contact.dart';

List<Contact> contacts = [];

/*
   it's unProfessional  to put contacts (data) in the same File with the operation
   like add or delete but Just for practice :D
*/

bool addContactToContacts(Contact contact) {
  bool isContactFound = contacts.any(
    (item) => item.phone == contact.phone,
  );

  if (isContactFound) return false;

  contacts.add(contact);
  return true;
}

void removeContact(Contact contact) {
  contacts.remove(contact);
}

void deleteContacts() {
  contacts.clear();
}
