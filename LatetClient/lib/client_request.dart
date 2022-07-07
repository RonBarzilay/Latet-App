class ClientRequest {
  /// ==============================================
  ///           Properties Declaration
  /// ==============================================

  // chosen unit / default user unit
  String _unit;

  // chosen Population Type
  String _populationType;

  // chosen action that the client would like to Perform (From Final actions class)
  String _action;

  /// ==============================================
  ///           Methods Declaration
  /// ==============================================
  ClientRequest(this._unit, this._populationType, this._action);

  ClientRequest.fromJson(Map<String, dynamic> json)
      : _unit = json['unit'],
        _populationType = json['populationType'],
        _action = json['action'];

  Map<String, dynamic> toJson() =>
      {'unit': _unit, 'populationType': _populationType, 'action': _action};

  void setUnit(String unit) => _unit = unit;

  String getUnit() => _unit;

  void setPopulationType(String populationType) =>
      _populationType = populationType;

  String getPopulationType() => _populationType;

  void setAction(String action) => _action = action;

  String getAction() => _action;

  @override
  String toString() =>
      'ClientRequest{unit: $_unit, populationType: $_populationType, action: $_action}';
}
