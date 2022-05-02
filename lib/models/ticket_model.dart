class TicketModel {
  TicketModel({
    required this.data,
  });
  late final List<TicketData> data;

  TicketModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => TicketData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class TicketData {
  TicketData({
    required this.name,
    required this.subject,
    required this.status,
    required this.issueType,
    required this.openingDate,
    required this.openingTime,
    required this.description,
  });
  late final String name;
  late final String subject;
  late final String status;
  late final String issueType;
  late final String openingDate;
  late final String openingTime;
  late final String description;

  TicketData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subject = json['subject'];
    status = json['status'];
    issueType = json['issue_type'];
    openingDate = json['opening_date'];
    openingTime = json['opening_time'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['subject'] = subject;
    _data['status'] = status;
    _data['issue_type'] = issueType;
    _data['opening_date'] = openingDate;
    _data['opening_time'] = openingTime;
    _data['description'] = description;
    return _data;
  }
}
