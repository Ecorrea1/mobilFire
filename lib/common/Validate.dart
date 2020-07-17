import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mobilfire/common/Constant.dart';

typedef void VoidCallBackParam(Map parameters);

class Validate {
  var data;
  Validate(this.data);

  static Widget errorWidget(String error, {String content = ""}) {
    switch (error) {
      case Constant.CONNECTION_DISABLED:
        return textError("Error en la Conexion $content ");
        break;
      case Constant.WIFI_DISABLED:
        return textError("Error en el Wifi $content ");
        break;
      case Constant.SERVER_ERROR:
        return textError("Error de Servidor $content ");
        break;
      case Constant.MESSEGE:
        return textError(content);
        break;
    }
  }

  static textError(text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: 40),
    );
  }

  static emptyMap(parameters) {
    return parameters.toString() == "[]" ? null : parameters;
  }

  static connectionError(
      {VoidCallback method,
      VoidCallBackParam methodparam,
      Map parameters}) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return errorWidget(Constant.CONNECTION_DISABLED);
    } else {
      return (emptyMap(parameters) != null)
          ? methodparam(parameters)
          : method();
    }
  }

  isWidget(VoidCallBackParam method) {
    return (data is Widget)
        ? data
        : data.isNotEmpty ? method(json.decode(data)) : null;
  }

  keyExist(String key, {var defaul = ""}) {
    return (data.containsKey(key) && data[key] != null) ? data[key] : defaul;
  }
}
