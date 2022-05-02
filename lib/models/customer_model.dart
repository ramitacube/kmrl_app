class Customer {
  Customer({
    required this.data,
  });
  late final List<CustomerData> data;

  Customer.fromJson(Map<String, dynamic> json) {
    data =
        List.from(json['data']).map((e) => CustomerData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class CustomerData {
  CustomerData({
    required this.name,
    required this.emailId,
  });
  late final String name;
  late final String emailId;

  CustomerData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    emailId = json['email_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email_id'] = emailId;
    return _data;
  }
}
