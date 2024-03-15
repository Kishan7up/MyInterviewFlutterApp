import 'package:flutter/material.dart';

Future navigateTo(BuildContext context, String routeName,
    {Object? arguments,
      bool clearAllStack = false,
      bool clearSingleStack = false,
      bool useRootNavigator = false,
      String? clearUntilRoute})
async {
  if (clearAllStack) {
    await Navigator.of(context, rootNavigator: useRootNavigator)
        .pushNamedAndRemoveUntil(routeName, (route) => false,
        arguments: arguments);
  } else if (clearSingleStack) {
    await Navigator.of(context, rootNavigator: useRootNavigator)
        .popAndPushNamed(routeName, arguments: arguments);
  } else if (clearUntilRoute != null) {
    await Navigator.of(context, rootNavigator: useRootNavigator)
        .pushNamedAndRemoveUntil(
        routeName, ModalRoute.withName(clearUntilRoute),
        arguments: arguments);
  } else {
    return await Navigator.of(context, rootNavigator: useRootNavigator)
        .pushNamed(routeName, arguments: arguments);
  }
}

MaterialPageRoute getMaterialPageRoute(Widget screen) {
  return MaterialPageRoute(
    builder: (context) {
      return screen;

    },
  );
}
