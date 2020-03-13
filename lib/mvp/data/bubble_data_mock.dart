import 'dart:async';
import 'capsule_data.dart';

class MockContactRepository implements DataRepo {
  @override
  Future<List<Contact>> fetch() => Future.value(kContacts);
}

const kContacts = const <Contact>[
  const Contact(
      fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
  const Contact(fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com')
];