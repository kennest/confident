import 'package:contacts_service/contacts_service.dart';

class ContactUtils {
  //Retrieve all contacts
  Future<Iterable<Contact>> getAllContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    return contacts;
  }
}
