import 'package:cmd_behavioral/mvp/data/capsule_data.dart';
import 'package:cmd_behavioral/mvp/presenter/bubble_presenter.dart';

class RecordLayerPresenter extends BubbleLayerPresenter {
  RecordLayerPresenter(ViewContract view, creator) : super(view, creator);

}


class RecordRepo extends BubbleRepo {

  @override
  Future<List<Contact>> fetch() {
    return super.fetch();
  }
}