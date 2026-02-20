import 'dart:io';

import 'package:contacts/core/theme/assets_manager.dart';
import 'package:contacts/core/theme/colors_manager.dart';
import 'package:contacts/core/theme/strings_manger.dart';
import 'package:contacts/core/theme/text_style_manager.dart';
import 'package:contacts/model/contact.dart';
import 'package:contacts/ui/screens/home/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onDelete;

  const ContactCard({
    super.key,
    required this.contact,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    final bool hasProfileImage = contact.profilePic != null;

    return Column(children: [imageSection(hasProfileImage), infoSection()]);
  }

  Widget imageSection(bool hasProfileImage) {
    return Container(
      height: 177,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: ColorsManager.creamy,
        image: hasProfileImage
            ? DecorationImage(
                image: FileImage(contact.profilePic!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          if (!hasProfileImage)
            Center(
              child: Lottie.asset(AssetsManager.emptyProfilePic, width: 88),
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: nameBox(hasProfileImage),
          ),
        ],
      ),
    );
  }

  Widget nameBox(bool hasProfileImage) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: hasProfileImage ? ColorsManager.creamy : ColorsManager.darkBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        contact.name,
        maxLines: 1,
        style: TextStyleManager.medium.copyWith(
          fontSize: 14,
          color: hasProfileImage
              ? ColorsManager.darkBlue
              : ColorsManager.creamy,
        ),
      ),
    );
  }

  Widget infoSection() {
    return Container(
      padding: const EdgeInsets.only(right: 8, top: 16, left: 8, bottom: 8),
      decoration: const BoxDecoration(
        color: ColorsManager.creamy,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        spacing: 12,
        children: [
          infoRow(AssetsManager.icEmail, contact.email),
          infoRow(AssetsManager.icPhone, contact.phone),
          CustomButton(
            onPressed: onDelete,
            label: StringsManager.delete,
            iconPath: AssetsManager.icDelete,
            variant: ButtonVariant.secondary,
          ),
        ],
      ),
    );
  }

  Widget infoRow(String iconPath, String value) {
    return Row(
      spacing: 8,
      children: [
        SvgPicture.asset(iconPath),
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyleManager.medium.copyWith(
              fontSize: 10,
              color: ColorsManager.darkBlue,
            ),
          ),
        ),
      ],
    );
  }
}
