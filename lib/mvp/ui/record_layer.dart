import 'package:cmd_behavioral/mvp/data/capsule_data.dart';
import 'package:cmd_behavioral/mvp/presenter/bubble_presenter.dart';
import 'package:cmd_behavioral/mvp/presenter/record_presenter.dart';
import 'package:cmd_behavioral/mvp/ui/bubble_layer.dart';
import 'package:flutter/material.dart';

abstract class RecordLayerState<W extends StatefulWidget, P extends RecordLayerPresenter>
    extends BubbleLayerState<W, P> implements ViewContract{
  RecordLayerState(creator) : super(creator);


  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  void onLoadContactsComplete(List<Contact> items){
    super.onLoadContactsComplete(items);
  }

  @override
  void onLoadContactsError() {
    // TODO: implement onLoadContactsError
    super.onLoadContactsError();
  }
}
