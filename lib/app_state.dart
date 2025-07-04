import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _clientname = '';
  String get clientname => _clientname;
  set clientname(String value) {
    _clientname = value;
  }

  String _namebuisness = '';
  String get namebuisness => _namebuisness;
  set namebuisness(String value) {
    _namebuisness = value;
  }

  String _addressname = '';
  String get addressname => _addressname;
  set addressname(String value) {
    _addressname = value;
  }

  int _phone = 0;
  int get phone => _phone;
  set phone(int value) {
    _phone = value;
  }

  DateTime? _Iconday = DateTime.fromMillisecondsSinceEpoch(1734806040000);
  DateTime? get Iconday => _Iconday;
  set Iconday(DateTime? value) {
    _Iconday = value;
  }

  String _team = '';
  String get team => _team;
  set team(String value) {
    _team = value;
  }

  String _brand = '';
  String get brand => _brand;
  set brand(String value) {
    _brand = value;
  }

  String _model = '';
  String get model => _model;
  set model(String value) {
    _model = value;
  }

  String _serie = '';
  String get serie => _serie;
  set serie(String value) {
    _serie = value;
  }

  String _code = '';
  String get code => _code;
  set code(String value) {
    _code = value;
  }

  String _location = '';
  String get location => _location;
  set location(String value) {
    _location = value;
  }

  List<String> _workStatusCheckboxes = [
    'VERIFICACIÓN VISUAL Y FUNCIONAMIENTO DEL EQUIPO',
    'REVISIÓN DE SISTEMA MECÁNICO (LUBRICACIÓN, AJUSTES, MOVIMIENTOS, OTROS).',
    'REVISIÓN DE SISTEMA ELECTRÓNICO (TARJETAS ELECTRÓNICAS, DISPOSITIVOS, OTROS).',
    'REVISIÓN DE SISTEMA ELÉCTRICO (FUSIBLES, CABLE DE PODER, OTROS).',
    'REVISIÓN DE SISTEMA HIDRÁULICO (FUGAS, PRESIÓN, AJUSTES, OTROS).',
    'REVISIÓN DE SISTEMA NEUMÁTICO (FUGAS, PRESIÓN, AJUSTES, OTROS).',
    'REVISIÓN DE SOFTWARE Y PROTOCOLOS (VERSIONES, ACTUALIZACIONES, OTROS).',
    'REVISIÓN DE CARCASA Y ACCESORIOS (AJUSTES, OTROS).',
    'REVISIÓN DE DISPOSITIVOS (CABEZALES, CABLES, APLICACIONES, OTROS).',
    'CALIBRACIÓN',
    'PRUEBAS DE FUNCIONAMIENTO.',
    'LIMPIEZA GENERAL.'
  ];
  List<String> get workStatusCheckboxes => _workStatusCheckboxes;
  set workStatusCheckboxes(List<String> value) {
    _workStatusCheckboxes = value;
  }

  void addToWorkStatusCheckboxes(String value) {
    workStatusCheckboxes.add(value);
  }

  void removeFromWorkStatusCheckboxes(String value) {
    workStatusCheckboxes.remove(value);
  }

  void removeAtIndexFromWorkStatusCheckboxes(int index) {
    workStatusCheckboxes.removeAt(index);
  }

  void updateWorkStatusCheckboxesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    workStatusCheckboxes[index] = updateFn(_workStatusCheckboxes[index]);
  }

  void insertAtIndexInWorkStatusCheckboxes(int index, String value) {
    workStatusCheckboxes.insert(index, value);
  }

  String _workstatusother = '';
  String get workstatusother => _workstatusother;
  set workstatusother(String value) {
    _workstatusother = value;
  }

  String _observations = '';
  String get observations => _observations;
  set observations(String value) {
    _observations = value;
  }

  String _recommendations = '';
  String get recommendations => _recommendations;
  set recommendations(String value) {
    _recommendations = value;
  }

  int _startworkhours = 0;
  int get startworkhours => _startworkhours;
  set startworkhours(int value) {
    _startworkhours = value;
  }

  int _endtworkhours = 0;
  int get endtworkhours => _endtworkhours;
  set endtworkhours(int value) {
    _endtworkhours = value;
  }

  int _totalworkhours = 0;
  int get totalworkhours => _totalworkhours;
  set totalworkhours(int value) {
    _totalworkhours = value;
  }

  int _maintenancecontract = 0;
  int get maintenancecontract => _maintenancecontract;
  set maintenancecontract(int value) {
    _maintenancecontract = value;
  }

  int _numberofvisits = 0;
  int get numberofvisits => _numberofvisits;
  set numberofvisits(int value) {
    _numberofvisits = value;
  }

  String _pdfId = '';
  String get pdfId => _pdfId;
  set pdfId(String value) {
    _pdfId = value;
  }

  bool _includeSignatureSpace = false;
  bool get includeSignatureSpace => _includeSignatureSpace;
  set includeSignatureSpace(bool value) {
    _includeSignatureSpace = value;
  }

  String _category = '';
  String get category => _category;
  set category(String value) {
    _category = value;
  }

  String _subcategory = '';
  String get subcategory => _subcategory;
  set subcategory(String value) {
    _subcategory = value;
  }

  String _seconsubcategory = '';
  String get seconsubcategory => _seconsubcategory;
  set seconsubcategory(String value) {
    _seconsubcategory = value;
  }

  String _filter = '';
  String get filter => _filter;
  set filter(String value) {
    _filter = value;
  }

  String _rootPath = '';
  String get rootPath => _rootPath;
  set rootPath(String value) {
    _rootPath = value;
  }

  List<String> _Listsubcategorys = [];
  List<String> get Listsubcategorys => _Listsubcategorys;
  set Listsubcategorys(List<String> value) {
    _Listsubcategorys = value;
  }

  void addToListsubcategorys(String value) {
    Listsubcategorys.add(value);
  }

  void removeFromListsubcategorys(String value) {
    Listsubcategorys.remove(value);
  }

  void removeAtIndexFromListsubcategorys(int index) {
    Listsubcategorys.removeAt(index);
  }

  void updateListsubcategorysAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Listsubcategorys[index] = updateFn(_Listsubcategorys[index]);
  }

  void insertAtIndexInListsubcategorys(int index, String value) {
    Listsubcategorys.insert(index, value);
  }
}
