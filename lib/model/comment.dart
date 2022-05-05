class Comment {
  Comment({
    String? uuid,
    String? comment,
    String? motive,
  }) {
    _uuid = uuid;
    _comment = comment;
    _motive = motive;
  }

  Comment.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _comment = json['comment'];
    _motive = json['motive'];
  }
  String? _uuid;
  String? _comment;
  String? _motive;
  Comment copyWith({
    String? uuid,
    String? comment,
    String? motive,
  }) =>
      Comment(
        uuid: uuid ?? _uuid,
        comment: comment ?? _comment,
        motive: motive ?? _motive,
      );
  String? get uuid => _uuid;
  String? get comment => _comment;
  String? get motive => _motive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['comment'] = _comment;
    map['motive'] = _motive;
    return map;
  }
}
