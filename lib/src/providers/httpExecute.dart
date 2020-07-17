import 'package:http/http.dart' as http;
import 'package:mobilfire/common/Constant.dart';
import 'package:mobilfire/common/Validate.dart';

class HTTPExecute {
  String endPointUrl;
  HTTPExecute(this.endPointUrl);

  get() async {
    return await Validate.connectionError(method: loadGET);
  }

  post(Map parameters) async {
    return await Validate.connectionError(
        methodparam: loadPOST, parameters: parameters);
  }

  put(Map parameters) async {
    return await Validate.connectionError(
        methodparam: loadPUT, parameters: parameters);
  }

  delete() async {
    return await Validate.connectionError(method: loadDELETE);
  }

  loadGET() async {
    final response = await http.get(this.endPointUrl);
    return validateResponse(response);
  }

  loadPOST(Map parameters) async {
    final response = await http.post(this.endPointUrl, body: parameters);
    return validateResponse(response);
  }

  loadPUT(Map parameters) async {
    final response = await http.put(this.endPointUrl, body: parameters);
    return validateResponse(response);
  }

  loadDELETE() async {
    final response = await http.delete(this.endPointUrl);
    return validateResponse(response);
  }

  validateResponse(response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      return response.body.toString();
    } else {
      return Validate.errorWidget(Constant.SERVER_ERROR,
          content: "${response.statusCode}");
    }
  }
}
