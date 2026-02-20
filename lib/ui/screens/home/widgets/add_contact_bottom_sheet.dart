import 'dart:io';

import 'package:contacts/core/theme/assets_manager.dart';
import 'package:contacts/core/theme/colors_manager.dart';
import 'package:contacts/core/theme/strings_manger.dart';
import 'package:contacts/core/theme/text_style_manager.dart';
import 'package:contacts/data.dart';
import 'package:contacts/model/contact.dart';
import 'package:contacts/pick_image.dart';
import 'package:contacts/ui/screens/home/widgets/custom_button.dart';
import 'package:contacts/ui/screens/home/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'custom_text_field.dart';

class AddContactBottomSheet extends StatefulWidget {
  final VoidCallback onContactAdded;

  const AddContactBottomSheet({super.key, required this.onContactAdded});

  @override
  State<AddContactBottomSheet> createState() => _AddContactBottomSheetState();
}

class _AddContactBottomSheetState extends State<AddContactBottomSheet> {
  DraggableScrollableController sheetController =
      DraggableScrollableController();

  File? imageFile;
  String name = StringsManager.userNameExample;
  String email = StringsManager.userEmailExample;
  String phone = '';
  bool hasError = false;
  String errorMessage = '';

  Future<void> handlePickImage() async {
    final file = await pickImage();
    if (file == null) return;

    setState(() {
      imageFile = file;
    });
  }

  void handleSubmit() {
    if (phone.trim().isEmpty) {
      setState(() {
        hasError = true;
        errorMessage = StringsManager.emptyPhoneNumber;
      });

      sheetController.animateTo(
        0.6,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      return;
    }

    final contact = Contact(
      name: name == StringsManager.userNameExample ? 'unknown' : name,
      email: email == StringsManager.userEmailExample ? 'Not Found!' : email,
      phone: phone,
      profilePic: imageFile,
    );

    final isAdded = addContactToContacts(contact);

    if (!isAdded) {
      setState(() {
        hasError = true;
        errorMessage = StringsManager.duplicatedPhoneNumber;
      });

      sheetController.animateTo(
        0.6,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      return;
    }

    widget.onContactAdded();
    Navigator.pop(context);
  }

  @override
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    if (bottomInset > 0) {
      sheetController.animateTo(
        .8,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }

    return DraggableScrollableSheet(
      controller: sheetController,
      initialChildSize: 0.5,
      maxChildSize: .8,
      minChildSize: .5,
      builder: (context, scrollController) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              color: ColorsManager.darkBlue,
            ),
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              children: [
                headerSection(),
                const SizedBox(height: 16),
                if (hasError)
                  Text(
                    errorMessage,
                    style: TextStyleManager.medium.copyWith(
                      color: ColorsManager.vividRed,
                    ),
                  ),
                const SizedBox(height: 16),
                formSection(),
                const SizedBox(height: 16),
                CustomButton(
                  onPressed: handleSubmit,
                  label: StringsManager.addNewContact,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget headerSection() {
    return Row(
      spacing: 12,
      children: [
        GestureDetector(
          onTap: handlePickImage,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: ColorsManager.creamy, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: imageFile != null
                  ? Image.file(imageFile!, fit: BoxFit.cover)
                  : Lottie.asset(AssetsManager.contactPlaceHolder),
            ),
          ),
        ),
        Expanded(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyleManager.medium, maxLines: 1),
              const HorizontalDivider(),
              Text(email, style: TextStyleManager.medium, maxLines: 1),
              const HorizontalDivider(),
              Text(
                phone.isNotEmpty ? phone : StringsManager.userPhoneExample,
                style: TextStyleManager.medium,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget formSection() {
    return Column(
      spacing: 8,
      children: [
        CustomTextField(
          hint: StringsManager.userNameHint,
          onSubmit: (value) {
            setState(() {
              name = value;
            });
          },
        ),
        CustomTextField(
          hint: StringsManager.userEmailHint,
          inputType: TextInputType.emailAddress,
          onSubmit: (value) {
            setState(() {
              email = value;
            });
          },
        ),
        CustomTextField(
          hint: StringsManager.userPhoneHint,
          inputType: TextInputType.number,
          hasError: hasError,
          onSubmit: (value) {
            setState(() {
              phone = value;
            });
          },
        ),
      ],
    );
  }
}

void showAddContactSheet(BuildContext context, VoidCallback onContactAdded) {
  showModalBottomSheet(
    context: context,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => AddContactBottomSheet(onContactAdded: onContactAdded),
  );
}
