import 'package:cmd_behavioral/mvp/data/capsule_data.dart';
import 'package:cmd_behavioral/mvp/presenter/bubble_presenter.dart';

class RecordLayerPresenter extends BubbleLayerPresenter {
  RecordLayerPresenter(ViewContract view, creator) : super(view, creator);

}


class RecordRepo extends BubbleRepo {
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