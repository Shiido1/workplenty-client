class CheckBoxModel {
  final String? title;
  final int? index;

  CheckBoxModel({this.title, this.index});

  static List<CheckBoxModel> getCovers() {
    List<CheckBoxModel> _box = [];
    CheckBoxModel _data = CheckBoxModel(title: 'Required', index: 0);
    _box.add(_data);
    _data = CheckBoxModel(title: 'Optional', index: 1);
    _box.add(_data);
    _data = CheckBoxModel(title: 'Not Required', index: 2);
    _box.add(_data);
    return _box;
  }
}
