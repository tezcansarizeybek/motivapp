class Comment {
  Comment({
    String? uuid,
    String? comment,
    String? motive,
    String? local,
  }) {
    _uuid = uuid;
    _comment = comment;
    _motive = motive;
    _local = local;
  }

  Comment.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _comment = json['comment'];
    _motive = json['motive'];
    _local = json['local'];
  }
  String? _uuid;
  String? _comment;
  String? _motive;
  String? _local;
  Comment copyWith({
    String? uuid,
    String? comment,
    String? motive,
    String? local,
  }) =>
      Comment(
        uuid: uuid ?? _uuid,
        comment: comment ?? _comment,
        motive: motive ?? _motive,
        local: local ?? _local,
      );
  String? get uuid => _uuid;
  String? get comment => _comment;
  String? get motive => _motive;
  String? get local => _local;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['comment'] = _comment;
    map['motive'] = _motive;
    map['local'] = _local;
    return map;
  }
}
