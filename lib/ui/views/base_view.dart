import 'package:edenmovies/app/locator.dart';
import 'package:edenmovies/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


///Creates a wrapper that makes the [StateController] available to all descendants in the widget tree
class BaseView<T extends StateController> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;

  const BaseView({Key? key, required this.builder, this.onModelReady})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends StateController> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
