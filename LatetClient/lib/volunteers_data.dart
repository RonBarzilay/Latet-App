class VolunteersData {
  List<dynamic> _volunteersList = [];

  VolunteersData(this._volunteersList);

  void set_volunteersList(List<dynamic> data) {
    _volunteersList = data;
  }

  List<dynamic> get_volunteersList() {
    return _volunteersList;
  }

  String getVolunteerId(int index) {
    return _volunteersList[index];
  }

  int get_volunteersListLength() {
    return _volunteersList.length;
  }

  @override
  String toString() {
    print("object");
    return 'toString: $_volunteersList}';
  }
}
