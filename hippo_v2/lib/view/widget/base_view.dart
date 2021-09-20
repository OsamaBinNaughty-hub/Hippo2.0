import 'package:flutter/material.dart';
import 'package:hippo_v2/locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(BuildContext context, T controller, Widget? child)
      builder;
  final T controller = locator<T>();

  BaseView({required this.builder, required Function(T) onControllerReady}) {
    onControllerReady(controller);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => controller,
      child: Consumer<T>(
        builder: builder,
      ),
    );
  }
}
