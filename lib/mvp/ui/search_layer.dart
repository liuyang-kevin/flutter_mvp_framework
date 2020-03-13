import 'dart:ui';

import 'package:cmd_behavioral/mvp/data/capsule_data.dart';
import 'package:cmd_behavioral/mvp/presenter/bubble_presenter.dart';
import 'package:cmd_behavioral/mvp/presenter/record_presenter.dart';
import 'package:cmd_behavioral/mvp/ui/record_layer.dart';
import 'package:flutter/material.dart';

abstract class SearchLayerState<W extends StatefulWidget, P extends RecordLayerPresenter> extends RecordLayerState<W, P>
    implements ViewContract {
  SearchLayerState(creator) : super(creator);

  @override
  Widget build(BuildContext context) {
    Widget superLayer = super.build(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 400,
      ),
      child: Stack(
//      child: IndexedStack( // indexedStack 继承自Stack，表示显示第几个widget
//        index: 2,
        fit: StackFit.expand,

        ///扩展到stack大小
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            color: Color.fromARGB(100, 200, 100, 0),
          ),
          Positioned(
            height: 60,
            left: 10,
            right: 10,
            top: 10,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Color.fromARGB(100, 50, 100, 0),
                child: Center(
                  child: Text(
                    "我设置了左右约束，所以 stack alignment 对我无效",
                    style: TextStyle(color: Color.fromARGB(200, 50, 50, 0)),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            height: 200,
            width: MediaQueryData.fromWindow(window).size.width,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: superLayer,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onLoadContactsComplete(List<Contact> items) {
    super.onLoadContactsComplete(items);
  }

  @override
  void onLoadContactsError() {
    // TODO: implement onLoadContactsError
    super.onLoadContactsError();
  }
}
