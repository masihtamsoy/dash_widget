import 'package:flutter/material.dart';
import 'package:dash_widget/dash_widget.dart';
import 'package:provider/provider.dart';

import 'store/dash_store.dart';

class Journey extends StatelessWidget {
  const Journey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListingUiStoreWizard(
            mode: "application",
            pushRouteName: '/job',
            getCallbackStore: () =>
                Provider.of<DashStore>(context, listen: false).value),
      ],
    );
  }
}
