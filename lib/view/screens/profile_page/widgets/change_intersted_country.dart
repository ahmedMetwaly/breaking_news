import "package:flutter/material.dart";
import "../../../../generated/l10n.dart";
import "../../init_settings/widgets/select_countries.dart";
import '../../../../resources/values_manager.dart';

class ChangeInterstedCountry extends StatelessWidget {
  const ChangeInterstedCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              useSafeArea: true,
              builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(SizeManager.bottomSheetRadius),
                          topRight:
                              Radius.circular(SizeManager.bottomSheetRadius))),
                  child: const SelectCountry(fromProfile: true)));
        },
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          S.current.selectInterestedCountry,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      
    );
  }
}
