import 'package:apirest/shared/helpers/base_state.dart';
import 'package:flutter/material.dart';

import '../helpers/app_state.dart';

class ApiBuilder extends StatelessWidget {
  final BaseState controller;
  final Widget Function(BuildContext context) builderSuccess;
  final Widget Function(BuildContext contex)? builderInitial;
  const ApiBuilder({
    Key? key,
    required this.controller,
    required this.builderSuccess,
    this.builderInitial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          if (controller.state == AppState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.state == AppState.error) {
            return Center(
              child: Text(controller.error!),
            );
          } else if (controller.state == AppState.success) {
            return builderSuccess(context);
          } else {
            if (builderInitial != null) {
              return builderInitial!(context);
            }
            return const SizedBox();
          }
        });
  }
}
