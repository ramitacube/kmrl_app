import 'dart:ffi';

class MeterReadingModel {
  MeterReadingModel({
    required this.data,
  });
  late final List<MeterList> data;

  MeterReadingModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => MeterList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class MeterList {
  MeterList({required this.name, required this.current_reading});
  late final String name;
  late final String current_reading;
  late final String reading_type;
  late final String date_of_entry;
  late final double invoiced_amount;

  MeterList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    current_reading = json["current_reading"];
    reading_type = json["reading_type"];
    date_of_entry = json["date_of_entry"];
    invoiced_amount = json["invoiced_amount"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['current_reading'] = current_reading;
    _data['reading_type'] = reading_type;
    _data['date_of_entry'] = date_of_entry;
    _data['invoiced_amount'] = invoiced_amount;
    return _data;
  }
}
