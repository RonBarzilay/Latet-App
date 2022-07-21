import 'package:intl/intl.dart';

class Volunteer {
  late final int _id;
  late final String _firstName;
  late final String _lastName;
  late final String _birthDate;
  late final String _city;
  late final String _unit;
  late final String _populationType;
  late final int _managerId;
  late final String _insuranceDateStart;
  late final String _insuranceDateEnd;
  late final int _limitHours;
  late final String _association;
  late final String _notes;

  Volunteer(
      this._id,
      this._firstName,
      this._lastName,
      this._birthDate,
      this._city,
      this._unit,
      this._populationType,
      this._managerId,
      this._insuranceDateStart,
      this._insuranceDateEnd,
      this._limitHours,
      this._association,
      this._notes);

  Volunteer.setVolunteer(Volunteer vol) {
    vol._id = this._id;
    vol._firstName = this._firstName;
    vol._lastName = this._lastName;
    vol._birthDate = this._birthDate;
    vol._city = this._city;
    vol._unit = this._unit;
    vol._populationType = this._populationType;
    vol._managerId = this._managerId;
    vol._insuranceDateStart = this._insuranceDateStart;
    vol._insuranceDateEnd = this._insuranceDateEnd;
    vol._limitHours = this._limitHours;
    vol._association = this._association;
    vol._notes = this._notes;
  }

  String get notes => _notes;

  String age() {
    DateTime birthDay = DateFormat('y-MM-dd').parse(_birthDate);
    DateTime now = DateTime.now();
    int age = (now.difference(birthDay).inDays) ~/ 365;
    return age.toString();
  }

  set notes(String value) {
    _notes = value;
  }

  String get association => _association;

  set association(String value) {
    _association = value;
  }

  int get limitHours => _limitHours;

  set limitHours(int value) {
    _limitHours = value;
  }

  String get insuranceDateEnd => _insuranceDateEnd;

  set insuranceDateEnd(String value) {
    _insuranceDateEnd = value;
  }

  String get insuranceDateStart => _insuranceDateStart;

  set insuranceDateStart(String value) {
    _insuranceDateStart = value;
  }

  int get managerId => _managerId;

  set managerId(int value) {
    _managerId = value;
  }

  String get populationType => _populationType;

  set populationType(String value) {
    _populationType = value;
  }

  String get unit => _unit;

  set unit(String value) {
    _unit = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  String get birthDate => _birthDate;

  String dateToView(String date) {
    return DateFormat('dd.MM.yyyy').format(DateFormat('y-MM-dd').parse(date));
  }

  String checkForNotes(String notes) {
    if (_notes == '') {
      return 'אין';
    } else {
      return _notes;
    }
  }

  set birthDate(String value) {
    _birthDate = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get fullName => "$_firstName $_lastName";
  @override
  String toString() {
    return 'Volunteer{id: $_id, firstName: $_firstName, lastName: $_lastName, birthDate: $_birthDate, city: $_city, unit: $_unit, populationType: $_populationType, managerId: $_managerId, insuranceDateStart: $_insuranceDateStart, insuranceDateEnd: $_insuranceDateEnd, limitHours: $_limitHours, association: $_association, notes: $_notes}';
  }
}
