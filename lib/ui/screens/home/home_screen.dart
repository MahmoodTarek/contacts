import 'package:contacts/core/theme/assets_manager.dart';
import 'package:contacts/core/theme/colors_manager.dart';
import 'package:contacts/data.dart';
import 'package:contacts/model/contact.dart';
import 'package:contacts/ui/screens/home/widgets/contacts.dart';
import 'package:contacts/ui/screens/home/widgets/contacts_fabs.dart';
import 'package:contacts/ui/screens/home/widgets/empty_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static const screenName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void refresh() {
    setState(() {});
  }

  void removeContactCard(Contact contact) {
    setState(() {
      removeContact(contact);
    });
  }

  void removeAllContactsCards() {
    setState(() {
      deleteContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsManager.darkBlue,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: ColorsManager.darkBlue,
        title: SvgPicture.asset(AssetsManager.appLogo),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          child: contacts.isEmpty
              ? const EmptyContacts()
              : Contacts(
                  contacts: contacts,
                  onDeletedContactClick: removeContactCard,
                ),
        ),
      ),
      floatingActionButton: contactsFabs(
        context,
        removeAllContactsCards,
        refresh
      ),
    );
  }
}
