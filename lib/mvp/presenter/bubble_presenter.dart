import 'package:cmd_behavioral/mvp/data/bubble_data.dart';
import 'package:cmd_behavioral/mvp/data/bubble_data_injector.dart';
import 'package:cmd_behavioral/mvp/ui/bubble_layer.dart';
import 'package:flutter/material.dart';

abstract class ViewContract {
  void onLoadContactsComplete(List<Contact> items);

  void onLoadContactsError();
}

typedef RC RepoCreator<RC>();

class BubbleLayerPresenter<R extends BubbleRepo>  {
  ViewContract _view;
  RepoCreator<R> _creator;
  R mRepo;

  BubbleLayerPresenter(this._view, this._creator){
    mRepo = _creator();
  }

  void loadContacts() {
    assert(_view != null);
    mRepo
        .fetch()
        .then((contacts) => _view.onLoadContactsComplete(contacts))
        .catchError((onError) => _view.onLoadContactsError());
  }
}