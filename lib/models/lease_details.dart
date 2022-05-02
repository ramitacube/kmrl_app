class LeaseDetails {
  LeaseDetails({
    required this.data,
  });
  late final Data data;

  LeaseDetails.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.idx,
    required this.docstatus,
    required this.partyType,
    required this.isSigned,
    required this.partyName,
    required this.status,
    required this.fulfilmentStatus,
    required this.agreementDate,
    required this.startDate,
    required this.contractDuration,
    required this.fitmentPeriod,
    required this.lockInPeriod,
    required this.endDate,
    required this.fitmentPeriodEndDate,
    required this.handoverDate,
    required this.noticePeriod,
    required this.billingCycleStartDate,
    required this.contractTemplate,
    required this.contractTerms,
    required this.requiresFulfilment,
    required this.signedByCompany,
    required this.documentType,
    required this.licenseAgreementNo,
    required this.loa,
    required this.rfpNo,
    required this.purpose,
    required this.loaDate,
    required this.rfpDate,
    required this.rfpDescription,
    required this.nameOfAuthorisedSignatory,
    required this.designationOfAuthorisedSignatory,
    required this.materialNo,
    required this.spaceLocation,
    required this.spaceMeasurementValue,
    required this.spaceUom,
    required this.licenseeName,
    required this.licenseeAadharNo,
    required this.licenseePanNo,
    required this.licenseeAge,
    required this.awardedAmount,
    required this.camChargesPercentage,
    required this.licenseFees,
    required this.annualEscalationPercentage,
    required this.securityDeposit,
    required this.gstPercentage,
    required this.gstAmount,
    required this.creditPeriod,
    required this.invoiceByPeriod,
    required this.interestPercentage,
    required this.doctype,
    required this.fulfilmentTerms,
  });
  late final String? name;
  late final String? owner;
  late final String? creation;
  late final String? modified;
  late final String? modifiedBy;
  late final num idx;
  late final num docstatus;
  late final String? partyType;
  late final num isSigned;
  late final String? partyName;
  late final String? status;
  late final String? fulfilmentStatus;
  late final String? agreementDate;
  late final String? startDate;
  late final num contractDuration;
  late final num fitmentPeriod;
  late final num lockInPeriod;
  late final String? endDate;
  late final String? fitmentPeriodEndDate;
  late final String? handoverDate;
  late final num noticePeriod;
  late final String? billingCycleStartDate;
  late final String? contractTemplate;
  late final String? contractTerms;
  late final num requiresFulfilment;
  late final String? signedByCompany;
  late final String? documentType;
  late final String? licenseAgreementNo;
  late final String? loa;
  late final String? rfpNo;
  late final String? purpose;
  late final String? loaDate;
  late final String? rfpDate;
  late final String? rfpDescription;
  late final String? nameOfAuthorisedSignatory;
  late final String? designationOfAuthorisedSignatory;
  late final String? materialNo;
  late final String? spaceLocation;
  late final String? spaceMeasurementValue;
  late final String? spaceUom;
  late final String? licenseeName;
  late final String? licenseeAadharNo;
  late final String? licenseePanNo;
  late final String? licenseeAge;
  late final num awardedAmount;
  late final num camChargesPercentage;
  late final num licenseFees;
  late final num annualEscalationPercentage;
  late final num securityDeposit;
  late final num gstPercentage;
  late final num gstAmount;
  late final num creditPeriod;
  late final num invoiceByPeriod;
  late final num interestPercentage;
  late final String? doctype;
  late final List<dynamic> fulfilmentTerms;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    partyType = json['party_type'];
    isSigned = json['is_signed'];
    partyName = json['party_name'];
    status = json['status'];
    fulfilmentStatus = json['fulfilment_status'];
    agreementDate = json['agreement_date'];
    startDate = json['start_date'];
    contractDuration = json['contract_duration'];
    fitmentPeriod = json['fitment_period'];
    lockInPeriod = json['lock_in_period'];
    endDate = json['end_date'] ?? "";
    fitmentPeriodEndDate = json['fitment_period_end_date'];
    handoverDate = json['handover_date'] ?? "";
    noticePeriod = json['notice_period'];
    billingCycleStartDate = json['billing_cycle_start_date'] ?? "";
    contractTemplate = json['contract_template'];
    contractTerms = json['contract_terms'];
    requiresFulfilment = json['requires_fulfilment'];
    signedByCompany = json['signed_by_company'] ?? "";
    documentType = json['document_type'];
    licenseAgreementNo = json['license_agreement_no'] ?? "";
    loa = json['loa'] ?? "";
    rfpNo = json['rfp_no'];
    purpose = json['purpose'];
    loaDate = json['loa_date'];
    rfpDate = json['rfp_date'];
    rfpDescription = json['rfp_description'];
    nameOfAuthorisedSignatory = json['name_of_authorised_signatory'];
    designationOfAuthorisedSignatory =
        json['designation_of_authorised_signatory'];
    materialNo = json['material_no'];
    spaceLocation = json['space_location'];
    spaceMeasurementValue = json['space_measurement_value'];
    spaceUom = json['space_uom'];
    licenseeName = json['licensee_name'];
    licenseeAadharNo = json['licensee_aadhar_no'];
    licenseePanNo = json['licensee_pan_no'];
    licenseeAge = json['licensee_age'];
    awardedAmount = json['awarded_amount'];
    camChargesPercentage = json['cam_charges_percentage'];
    licenseFees = json['license_fees'];
    annualEscalationPercentage = json['annual_escalation_percentage'];
    securityDeposit = json['security_deposit'];
    gstPercentage = json['gst_percentage'];
    gstAmount = json['gst_amount'];
    creditPeriod = json['credit_period'];
    invoiceByPeriod = json['invoice_by_period'];
    interestPercentage = json['interest_percentage'];
    doctype = json['doctype'];
    fulfilmentTerms = List.castFrom<dynamic, dynamic>(json['fulfilment_terms']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['owner'] = owner;
    _data['creation'] = creation;
    _data['modified'] = modified;
    _data['modified_by'] = modifiedBy;
    _data['idx'] = idx;
    _data['docstatus'] = docstatus;
    _data['party_type'] = partyType;
    _data['is_signed'] = isSigned;
    _data['party_name'] = partyName;
    _data['status'] = status;
    _data['fulfilment_status'] = fulfilmentStatus;
    _data['agreement_date'] = agreementDate;
    _data['start_date'] = startDate;
    _data['contract_duration'] = contractDuration;
    _data['fitment_period'] = fitmentPeriod;
    _data['lock_in_period'] = lockInPeriod;
    _data['end_date'] = endDate;
    _data['fitment_period_end_date'] = fitmentPeriodEndDate;
    _data['handover_date'] = handoverDate;
    _data['notice_period'] = noticePeriod;
    _data['billing_cycle_start_date'] = billingCycleStartDate;
    _data['contract_template'] = contractTemplate;
    _data['contract_terms'] = contractTerms;
    _data['requires_fulfilment'] = requiresFulfilment;
    _data['signed_by_company'] = signedByCompany;
    _data['document_type'] = documentType;
    _data['license_agreement_no'] = licenseAgreementNo;
    _data['loa'] = loa;
    _data['rfp_no'] = rfpNo;
    _data['purpose'] = purpose;
    _data['loa_date'] = loaDate;
    _data['rfp_date'] = rfpDate;
    _data['rfp_description'] = rfpDescription;
    _data['name_of_authorised_signatory'] = nameOfAuthorisedSignatory;
    _data['designation_of_authorised_signatory'] =
        designationOfAuthorisedSignatory;
    _data['material_no'] = materialNo;
    _data['space_location'] = spaceLocation;
    _data['space_measurement_value'] = spaceMeasurementValue;
    _data['space_uom'] = spaceUom;
    _data['licensee_name'] = licenseeName;
    _data['licensee_aadhar_no'] = licenseeAadharNo;
    _data['licensee_pan_no'] = licenseePanNo;
    _data['licensee_age'] = licenseeAge;
    _data['awarded_amount'] = awardedAmount;
    _data['cam_charges_percentage'] = camChargesPercentage;
    _data['license_fees'] = licenseFees;
    _data['annual_escalation_percentage'] = annualEscalationPercentage;
    _data['security_deposit'] = securityDeposit;
    _data['gst_percentage'] = gstPercentage;
    _data['gst_amount'] = gstAmount;
    _data['credit_period'] = creditPeriod;
    _data['invoice_by_period'] = invoiceByPeriod;
    _data['interest_percentage'] = interestPercentage;
    _data['doctype'] = doctype;
    _data['fulfilment_terms'] = fulfilmentTerms;
    return _data;
  }
}
