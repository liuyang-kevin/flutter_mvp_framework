import 'package:cmd_behavioral/mvp/data/capsule_data.dart';
import 'package:cmd_behavioral/mvp/presenter/bubble_presenter.dart';
import 'package:cmd_behavioral/mvp/presenter/record_presenter.dart';

class SearchLayerPresenter extends RecordLayerPresenter {
  SearchLayerPresenter(ViewContract view) : super(view, () => SearchRepo());
}

class SearchRepo extends RecordRepo {
  @override
  Future<List<Contact>> fetch() {
    // TODO: implement fetch
    return super.fetch();
  }
}
