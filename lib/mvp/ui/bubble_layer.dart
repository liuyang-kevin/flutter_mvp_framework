import 'package:cmd_behavioral/mvp/data/capsule_data.dart';
import 'package:cmd_behavioral/mvp/presenter/bubble_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef IC ItemCreator<IC>(view);

abstract class BubbleLayerState<W extends StatefulWidget, P extends BubbleLayerPresenter> extends State<W>
    implements ViewContract {
  ItemCreator<P> _creator;
  P _presenter;
  List<Contact> _contacts;
  bool _is_searchingi;

  BubbleLayerState(this._creator) {
    _presenter = _creator(this);
    // 检查类型，是最后继承的类型
    print(this.runtimeType);
  }

  @override
  void initState() {
    super.initState();
    _is_searchingi = true;
    _presenter.loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (_is_searchingi) {
      widget = Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      widget = new ListView(padding: new EdgeInsets.symmetric(vertical: 8.0), children: _buildContactList());
    }

    return widget;
  }

  @override
  void onLoadContactsComplete(List<Contact> items) {
    setState(() {
      _contacts = items;
      _is_searchingi = false;
    });
  }

  @override
  void onLoadContactsError() {
    // TODO: implement onLoadContactsError
  }

  List<_ContactListItem> _buildContactList() {
    return _contacts.map((contact) => new _ContactListItem(contact)).toList();
  }
}

class _ContactListItem extends ListTile {
  _ContactListItem(Contact contact)
      : super(
            title: new Text(contact.fullName),
            subtitle: new Text(contact.email),
            leading: new CircleAvatar(child: new Text(contact.fullName[0])));
}
