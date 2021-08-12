import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'ui_helpers.dart';

/// A widget that provides frequently required functionality for any screen
class ScreenBuilder<T extends BaseViewModel> extends StatelessWidget {
  /// Indicates if you want Provider to dispose the ViewModel when it's removed from the widget tree.
  ///
  /// default's to true
  final bool disposeViewModel;

  /// Indicate if you want the [builder] function to fire when notifyListeners is called in the ViewModel.
  ///
  /// default's to true
  final bool isReactive;

  /// A builder function that returns the ViewModel for this widget
  final Widget Function(BuildContext, UIHelpers, T) builder;

  final T viewModel;

  /// Fires once when the ViewModel is created or set for the first time
  final Function(T)? onModelReady;

  final Function(T)? onDispose;

  ScreenBuilder(
      {Key? key,
      required this.builder,
      required this.viewModel,
      this.onModelReady,
      this.onDispose,
      this.disposeViewModel: true,
      this.isReactive: true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    UIHelpers uiHelpers = UIHelpers.fromContext(context);

    return (isReactive)
        ? ViewModelBuilder<T>.reactive(
            builder: (context, model, child) => SafeArea(
                left: true,
                right: true,
                top: false,
                bottom: false,
                child: builder(context, uiHelpers, model)),
            disposeViewModel: disposeViewModel,
            onModelReady: onModelReady,
            onDispose: onDispose,
            viewModelBuilder: () => viewModel)
        : ViewModelBuilder<T>.nonReactive(
            builder: (context, model, child) => SafeArea(
                left: true,
                right: true,
                top: false,
                bottom: false,
                child: builder(context, uiHelpers, model)),
            disposeViewModel: disposeViewModel,
            onModelReady: onModelReady,
            onDispose: onDispose,
            viewModelBuilder: () => viewModel);
  }
}
