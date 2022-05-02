class LeaseContracts {
  LeaseContracts({
    required this.data,
  });
  late final List<LeaseData> data;

  LeaseContracts.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => LeaseData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class LeaseData {
  LeaseData({
    required this.name,
    required this.materialNo,
    required this.spaceLocation,
  });
  late final String name;
  late final String materialNo;
  late final String spaceLocation;

  LeaseData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    materialNo = json['material_no'];
    spaceLocation = json['space_location'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['material_no'] = materialNo;
    _data['space_location'] = spaceLocation;
    return _data;
  }
}
