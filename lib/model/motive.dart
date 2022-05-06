class Motive {
  Motive({
    String? uuid,
    String? category,
    int? order,
    String? icon,
    String? local,
  }) {
    _uuid = uuid;
    _category = category;
    _order = order;
    _icon = icon;
    _local = local;
  }

  Motive.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _category = json['category'];
    _order = json['order'];
    _icon = json['icon'];
    _local = json['local'];
  }

  String? _uuid;
  String? _category;
  int? _order;
  String? _icon;
  String? _local;

  Motive copyWith({
    String? uuid,
    String? category,
    int? order,
    String? icon,
    String? local,
  }) =>
      Motive(
        uuid: uuid ?? _uuid,
        category: category ?? _category,
        order: order ?? _order,
        icon: icon ?? _icon,
        local: local ?? _local,
      );

  String? get uuid => _uuid;
  String? get category => _category;
  int? get order => _order;
  String? get icon => _icon;
  String? get local => _local;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['category'] = _category;
    map['order'] = _order;
    map['icon'] = _icon;
    map['local'] = _local;
    return map;
  }
}
