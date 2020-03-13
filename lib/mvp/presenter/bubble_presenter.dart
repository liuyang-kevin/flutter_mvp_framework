import 'package:cmd_behavioral/mvp/data/capsule_data.dart';

abstract class ViewContract {
  void onLoadContactsComplete(List<Contact> items);

  void onLoadContactsError();
}

typedef RC RepoCreator<RC>();

class BubbleLayerPresenter<R extends DataRepo>  {
  ViewContract _view;
  RepoCreator<R> _creator;
  R _Repo;

  BubbleLayerPresenter(this._view, this._creator){
    _Repo = _creator();
    print("BubbleLayerPresenter Repo ->${_Repo.runtimeType}");
  }

  void loadContacts() {
    assert(_view != null);
    _Repo
        .fetch()
        .then((contacts) => _view.onLoadContactsComplete(contacts))
        .catchError((onError) => _view.onLoadContactsError());
  }
}

class BubbleRepo extends DataRepo {
  static const kContacts = const <Contact>[
    const Contact(
        fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
    const Contact(fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com')
  ];

  @override
  Future<List<Contact>> fetch() {
    return Future.value(kContacts);
  }
}