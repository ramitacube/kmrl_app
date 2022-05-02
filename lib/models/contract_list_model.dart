class ContractList {
  ContractList({
    required this.data,
  });
  late final List<ContractData> data;

  ContractList.fromJson(Map<String, dynamic> json) {
    data =
        List.from(json['data']).map((e) => ContractData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ContractData {
  ContractData({
    required this.name,
    required this.status,
    required this.spaceLocation,
    this.licenseAgreementNo,
    required this.materialNo,
  });
  late final String name;
  late final String status;
  late final String? spaceLocation;
  late final String? licenseAgreementNo;
  late final String? materialNo;

  ContractData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
    spaceLocation = json['space_location'];
    licenseAgreementNo = json['license_agreement_no'];
    materialNo = json['material_no'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['status'] = status;
    _data['space_location'] = spaceLocation;
    _data['license_agreement_no'] = licenseAgreementNo;
    _data['material_no'] = materialNo;
    return _data;
  }
}
