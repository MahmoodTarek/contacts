import 'package:contacts/data.dart';
import 'package:contacts/ui/screens/home/widgets/add_contact_fab.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/assets_manager.dart';
import '../../../../core/theme/colors_manager.dart';
import 'add_contact_bottom_sheet.dart';

Column contactsFabs(
  BuildContext context,
  VoidCallback removeAllContactsCards,
  VoidCallback refresh,
) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.end,
    spacing: 8,
    children: [
      Visibility(
        visible: contacts.isNotEmpty,
        child: CustomFab(
          onAddContactClicked: removeAllContactsCards,
          iconPath: AssetsManager.icDelete,
          backgroundColor: ColorsManager.vividRed,
        ),
      ),

      Visibility(
        visible: contacts.length < 6,
        child: CustomFab(
          onAddContactClicked: () {
            showAddContactSheet(context, refresh);
          },
          iconPath: AssetsManager.icAddContact,
          backgroundColor: ColorsManager.creamy,
        ),
      ),
    ],
  );
}
