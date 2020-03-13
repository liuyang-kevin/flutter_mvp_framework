import 'package:cmd_behavioral/mvp/data/capsule_data.dart';
import 'package:cmd_behavioral/mvp/presenter/bubble_presenter.dart';
import 'package:cmd_behavioral/mvp/presenter/search_presenter.dart';
import 'package:cmd_behavioral/mvp/ui/bubble_layer.dart';
import 'package:cmd_behavioral/mvp/ui/search_layer.dart';
import 'package:flutter/material.dart';

class CapsuleEditorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Editor Time Capsule")),
      body: CapsuleEditor(),
    );
  }
}

class CapsuleEditor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CapsuleEditorState.get();
  }
}

/// editor -> search_layer -> record_layer -> bubble_layer
class _CapsuleEditorState extends SearchLayerState<CapsuleEditor, SearchLayerPresenter> implements ViewContract {
  factory _CapsuleEditorState.get() => _CapsuleEditorState((v) => SearchLayerPresenter(v));

  _CapsuleEditorState(creator) : super(creator);

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}

/// editor -> bubble_layer
class _TempState extends BubbleLayerState<CapsuleEditor, TempPresent> implements ViewContract {
  factory _TempState.get() {
    return _TempState((v) => TempPresent(v));
  }

  _TempState(creator) : super(creator);

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}

class TempPresent extends BubbleLayerPresenter<TempReop> {
  TempPresent(ViewContract view) : super(view, () => TempReop());
//  ViewContract _view;
//  TempPresent(this._view) : super(_view);

}

class TempReop extends DataRepo {
  static const kContacts = const <Contact>[
    const Contact(fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
    const Contact(fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com')
  ];

  @override
  Future<List<Contact>> fetch() {
    return Future.value(kContacts);
  }
}
