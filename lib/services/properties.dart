import 'package:ewawepay/Networkhandler.dart';

NetworkHandler networkHandler = NetworkHandler();

getProperty() async {
  var res = await await networkHandler.get("/api/v1/all/property/listed");
  var dataProperty = res['listProperty'];
  return dataProperty;
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
  print(res);
  var dataTenant = res['listInvoice'];
  return dataTenant;
}
