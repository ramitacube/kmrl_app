// class SalesInvoiceModel {
//   SalesInvoiceModel({
//     required this.data,
//   });
//   late final List<InvoiceList> data;

//   SalesInvoiceModel.fromJson(Map<String, dynamic> json) {
//     data = List.from(json['data']).map((e) => InvoiceList.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['data'] = data.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class InvoiceList {
//   InvoiceList({
//     required this.name,
//     required this.contactMobile,
//     required this.dueDate,
//     required this.grandTotal,
//     required this.description,
//     required this.itemName,
//     required this.status,
//   });
//   late final String name;
//   late final String? contactMobile;
//   late final String dueDate;
//   late final String grandTotal;
//   late final String description;
//   late final String itemName;
//   late final String status;
//   late final String? outStanding;

//   InvoiceList.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     contactMobile = json['contact_mobile'];
//     dueDate = json['due_date'];
//     grandTotal = json['grand_total'].toString();
//     description = json['description'];
//     itemName = json['item_name'];
//     status = json['status'];
//     outStanding = json['outstanding_amount']?.toString();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['name'] = name;
//     _data['contact_mobile'] = contactMobile;
//     _data['due_date'] = dueDate;
//     _data['grand_total'] = grandTotal;
//     _data['description'] = description;
//     _data['item_name'] = itemName;
//     _data['status'] = status;
//     _data['outstanding_amount'] = outStanding;
//     return _data;
//   }
// }
class SalesInvoiceModel {
  SalesInvoiceModel({
    required this.data,
  });
  late final List<InvoiceList> data;

  SalesInvoiceModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => InvoiceList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class InvoiceList {
  InvoiceList({
    required this.name,
    required this.outstandingAmount,
    required this.contactMobile,
    required this.dueDate,
    required this.grandTotal,
    required this.description,
    required this.itemName,
    required this.status,
  });
  late final String name;
  late final String outstandingAmount;
  late final String contactMobile;
  late final String dueDate;
  late final String grandTotal;
  late final String description;
  late final String itemName;
  late final String status;

  InvoiceList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    outstandingAmount = json['outstanding_amount'].toString();
    contactMobile = json['contact_mobile'];
    dueDate = json['due_date'];
    grandTotal = json['grand_total'].toString();
    description = json['description'];
    itemName = json['item_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['outstanding_amount'] = outstandingAmount;
    _data['contact_mobile'] = contactMobile;
    _data['due_date'] = dueDate;
    _data['grand_total'] = grandTotal;
    _data['description'] = description;
    _data['item_name'] = itemName;
    _data['status'] = status;
    return _data;
  }
}
