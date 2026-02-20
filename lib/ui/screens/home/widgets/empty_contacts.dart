import 'package:contacts/core/theme/assets_manager.dart';
import 'package:contacts/core/theme/colors_manager.dart';
import 'package:contacts/core/theme/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyContacts extends StatelessWidget {
  const EmptyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(AssetsManager.contacts),
              Text(
                StringsManager.emptyContacts,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.creamy,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
