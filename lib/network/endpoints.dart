class EndPoints {
  static final String _baseUrl = "https://cms.kochimetro.org/api/";

  //get districts

  static final String loginWithMobile =
      "${_baseUrl}method/a3_property_management.api.get";
  static final String verifyOTP =
      "${_baseUrl}method/a3_property_management.api.authenticate";
  static final String salesInvoicePending =
      "${_baseUrl}resource/Sales Invoice?${Fields.PENDING_INVOINCE_FIELD}";
  static final String getCustomer =
      "${_baseUrl}resource/Customer?${Fields.GET_CUSTOMER_FIELDS}";
  static final String salesInvoiceAll =
      "${_baseUrl}resource/Sales Invoice?${Fields.SALES_INVOINCE_FIELD}";
  static final String contractListActive =
      "${_baseUrl}resource/Contract?${Fields.CONTRACT_LIST_ACTIVE_FILTER}";
  static final String leaseAccounts =
      "${_baseUrl}resource/Contract?${Fields.LEASE_ACCOUNT_FILTER}";
  static final String leaseListActive =
      "${_baseUrl}resource/Contract?${Fields.LEASE_LIST_FILTER}";

  static final String getContactDetails = "${_baseUrl}resource/Contract/";
  static final String getPaymnets =
      "${_baseUrl}resource/Payment Entry?${Fields.PAYMENTS_FILTER}";
  static final String createTicket = "${_baseUrl}resource/Issue";
  static final String getTicket =
      "${_baseUrl}resource/Issue?${Fields.GET_TICKETS_FIELD}";
  static final String postMeterReading = "${_baseUrl}resource/Meter Reading";
  static final String getCurrentMeterReading =
      "${_baseUrl}resource/Meter Reading?${Fields.GET_METER_READINGS_FIELD}";
  static final String getElectricityMeterReading =
      "${_baseUrl}resource/Meter Reading?${Fields.GET_ELECTRICITY_READINGS_FIELD}";
  static final String getWaterMeterReading =
      "${_baseUrl}resource/Meter Reading?${Fields.GET_WATER_READINGS_FIELD}";
}

class Fields {
  static const String PENDING_INVOINCE_FIELD =
      'fields=["name","status","due_date","posting_date","outstanding_amount","contact_mobile","due_date","grand_total","`tabSales Invoice Item`.description","`tabSales Invoice Item`.item_name","`tabSales Invoice Item`.description", "customer"]';
  // 'fields=["name","status","due_date","posting_date","outstanding_amount","rounded_total","`tabSales Invoice Item`.item_name","`tabSales Invoice Item`.description"]';
  static const String GET_CUSTOMER_FIELDS = 'fields=["name","email_id"]';

  static const CONTRACT_LIST_ACTIVE_FILTER =
      'fields=["name","status","space_location","licence_agreement_no","material_no"]&limit_page_length=100&limit_start=0';
  static const LEASE_ACCOUNT_FILTER =
      'fields=["name","status","space_location","licence_agreement_no"]&limit_page_length=100&limit_start=0';
  static const LEASE_LIST_FILTER =
      'fields=["name","material_no","space_location", "party_name"]';
  static const String SALES_INVOINCE_FIELD =
      'fields=["name","contact_mobile","status","due_date","outstanding_amount","grand_total","`tabSales Invoice Item`.item_name","`tabSales Invoice Item`.description"]';

  static const String PAYMENTS_FILTER =
      'fields=["name","status","posting_date","mode_of_payment","paid_amount","remarks"]&limit_page_length=100&limit_start=0';
  static const String GET_TICKETS_FIELD =
      'fields=["name","subject","status","issue_type","opening_date","opening_time","description"]&limit_page_length=100&limit_start=0';
  static const String GET_METER_READINGS_FIELD =
      'fields=["name","current_reading", "reading_type", "date_of_entry","invoiced_amount"]&limit_page_length=100&limit_start=0';
  static const String GET_ELECTRICITY_READINGS_FIELD =
      'fields=["name","current_reading", "reading_type", "date_of_entry","invoiced_amount"]&limit_page_length=100&limit_start=0&filters=[["reading_type","=","Electricity"]]';
  static const String GET_WATER_READINGS_FIELD =
      'fields=["name","current_reading", "reading_type", "date_of_entry","invoiced_amount"]&limit_page_length=100&limit_start=0&filters=[["reading_type","=","Water"]]';
}
