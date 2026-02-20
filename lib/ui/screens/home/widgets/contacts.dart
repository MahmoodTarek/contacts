import 'package:contacts/model/contact.dart';
import 'package:contacts/ui/screens/home/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  final List<Contact> contacts;
  final void Function(Contact contact) onDeletedContactClick;

  const Contacts({
    super.key,
    required this.contacts,
    required this.onDeletedContactClick,
  });

  Widget contactItemsBuilder(BuildContext context, int index) {
    final Contact currentContact = contacts[index];

    return ContactCard(
      contact: currentContact,
      onDelete: () => onDeletedContactClick(currentContact),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 16,
        mainAxisExtent: 320,
        crossAxisCount: 2,
      ),
      itemCount: contacts.length,
      itemBuilder: contactItemsBuilder,
    );
  }
}
