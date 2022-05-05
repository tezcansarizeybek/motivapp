class Motive {
  Motive({
    String? uuid,
    String? category,
    int? order,
    String? icon,
  }) {
    _uuid = uuid;
    _category = category;
    _order = order;
    _icon = icon;
  }

  Motive.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _category = json['category'];
    _order = json['order'];
    _icon = json['icon'];
  }

  String? _uuid;
  String? _category;
  int? _order;
  String? _icon;

  Motive copyWith({
    String? uuid,
    String? category,
    int? order,
    String? icon,
  }) =>
      Motive(
        uuid: uuid ?? _uuid,
        category: category ?? _category,
        order: order ?? _order,
        icon: icon ?? _icon,
      );

  String? get uuid => _uuid;
  String? get category => _category;
  int? get order => _order;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['category'] = _category;
    map['order'] = _order;
    map['icon'] = _icon;
    return map;
  }
}
