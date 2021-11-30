import 'package:ewawepay/Networkhandler.dart';
import 'package:flutter/material.dart';

NetworkHandler networkHandler = NetworkHandler();

getProperty() async {
  var res = await await networkHandler.get("/api/v1/all/property/listed");
  var dataProperty = res['data'];
  return dataProperty;
}

getInvoiceReport() async {
  var res = await await networkHandler.get("/api/v1/report/dashboard");
  var data = res;
  return data;
}

getTenants() async {
  var res = await await networkHandler.get("/api/v1/list/customers");
  var dataTenant = res['listTenant'];
  return dataTenant;
}

getContract() async {
  var res = await await networkHandler.get("/api/v1/list/contract");
  var dataTenant = res['listContract'];
  return dataTenant;
}

getInvoice() async {
  var res = await await networkHandler.get("/api/v1/invoices/list");
  var dataTenant = res['listInvoice'];
  return dataTenant;
}

getOneInvoice(int id) async {
  var res = await await networkHandler.get("/api/v1/invoice/receipt/$id");
  var response = res;

  return response;
}

deleteInvoice(int id) async {
  var res = await await networkHandler.delete("/api/v1/invoice/delete/$id");
  print(res);
  return res;
}
