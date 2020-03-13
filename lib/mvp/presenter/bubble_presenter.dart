import 'dart:convert';
import 'package:cmd_behavioral/mvp/data/bubble_data_injector.dart';
import 'package:http/http.dart' as http;

import 'package:cmd_behavioral/mvp/data/capsule_data.dart';

abstract class ViewContract {
  void onLoadContactsComplete(List<Contact> items);

  void onLoadContactsError();
}

typedef RC RepoCreator<RC>();

class BubbleLayerPresenter<R extends DataRepo> {
  ViewContract _view;
  RepoCreator<R> _creator;
  R _Repo;

  BubbleLayerPresenter(this._view, this._creator) {
    _Repo = _creator();
    print("BubbleLayerPresenter Repo ->${_Repo.runtimeType}");
  }

  void loadContacts() {
    assert(_view != null);
    _Repo.fetch()
        .then((contacts) => _view.onLoadContactsComplete(contacts))
        .catchError((onError) => _view.onLoadContactsError());
  }
}

class BubbleRepo extends DataRepo {
  DataRepo _repo = Injector().contactRepository;

//  static const _kRandomUserUrl = 'http://api.randomuser.me/?results=15';
//  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<List<Contact>> fetch() {
    return _repo.fetch();
//    return http.get(_kRandomUserUrl).then((http.Response response) {
//      final String jsonBody = response.body;
//      final statusCode = response.statusCode;
//
//      if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
//        throw new FetchDataException(
//            "Error while getting contacts [StatusCode:$statusCode, Error:${response.toString()}]");
//      }
//
//      final contactsContainer = _decoder.convert(jsonBody);
//      final List contactItems = contactsContainer['results'];
//
//      return contactItems
//          .map((contactRaw) => new Contact.fromMap(contactRaw))
//          .toList();
//    });
  }
}
