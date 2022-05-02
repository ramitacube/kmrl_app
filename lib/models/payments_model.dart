class PaymentsModel {
  PaymentsModel({
    required this.data,
  });
  late final List<PaymentData> data;
  
  PaymentsModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>PaymentData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PaymentData {
  PaymentData({
    required this.name,
    required this.status,
    required this.postingDate,
     this.modeOfPayment,
    required this.paidAmount,
    required this.remarks,
  });
  late final String name;
  late final String status;
  late final String postingDate;
  late final String? modeOfPayment;
  late final String paidAmount;
  late final String remarks;
  
  PaymentData.fromJson(Map<String, dynamic> json){
    name = json['name'];
    status = json['status'];
    postingDate = json['posting_date'];
    modeOfPayment = null;
    paidAmount = json['paid_amount'].toString();
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['status'] = status;
    _data['posting_date'] = postingDate;
    _data['mode_of_payment'] = modeOfPayment;
    _data['paid_amount'] = paidAmount;
    _data['remarks'] = remarks;
    return _data;
  }
}