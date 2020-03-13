import 'dart:async';

class Contact {
  final String fullName;
  final String email;

  const Contact({this.fullName, this.email});

  Contact.fromMap(Map<String, dynamic> map)
      : fullName = "${map['name']['first']} ${map['name']['last']}",
        email = map['email'];
}

abstract class DataRepo {
  Future<List<Contact>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  @override
  String toString() {
    return "Exception:$_message";
  }
}
