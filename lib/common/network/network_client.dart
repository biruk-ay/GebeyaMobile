import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:gebeya/configs/data_configs.dart' as config;

import 'package:gebeya/common/network/request.dart';

class NetworkClient {
  String? _token;
  String? _clientVersion;
  String host;
  String baseUrl = "";
  bool isSSL;

  NetworkClient(this.host, {String? token, baseUrl, clientVersion, this.isSSL = true}) {
    _token = token;
    _clientVersion = clientVersion;
    if (baseUrl != null) {
      this.baseUrl = baseUrl;
    }
  }

  Uri _uri(String host, path, [params]){
    if(isSSL){
      return Uri.https(host, path, params);
    }
    return Uri.http(host, path, params);
  }

  Uri _getCompleteUrl(String path, {params}) {
    path = "$baseUrl/$path".replaceAll("//", "/");
    if (params == null) {
      return _uri(host, path);
    }
    return _uri(host, path, params);
  }

  Map<String, String> _getCompleteHeader(Map<String, String> header) {
    // if (_token != null) {
    //   header[config.authorizationKey] = "${config.authorizationPrefix} $_token";
    // }
    // if (_clientVersion != null){
    //   header[config.clientVersionKey] = _clientVersion!;
    // }
    if(header["Content-Type"] == null){
      header["Content-Type"] = "application/json";
    }
    return header;
  }

  Future<http.Response> _get(
      Request request, Map<String, String> headers) async {
    return http.get(
        _getCompleteUrl(request.getUrl(), params: request.getGetParams()),
        headers: headers);
  }

  Future<http.Response> _post(
      Request request, Map<String, String> headers) async {
    return http.post(_getCompleteUrl(request.getUrl()),
        body: jsonEncode(request.getPostData()), headers: headers);
  }

  Future<http.Response> _patch(
      Request request, Map<String, String> headers) async {
    return http.patch(_getCompleteUrl(request.getUrl()),
        body: jsonEncode(request.getPostData()), headers: headers);
  }

  Future<http.Response> _delete(
      Request request, Map<String, String> headers) async {
    return http.delete(_getCompleteUrl(request.getUrl()), headers: headers);
  }

  Future<T> execute<T>(Request<T> request) async {
    Map<String, String> headers = _getCompleteHeader(request.getHeaders());

    http.Response response;

    switch (request.getMethod()) {
      case Method.get:
        response = await _get(request, headers);
        break;

      case Method.post:
        response = await _post(request, headers);
        break;

      case Method.patch:
        response = await _patch(request, headers);
        break;
      case Method.delete:
        response = await _delete(request, headers);
        break;
    }

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response: response);
    }

    return request.deserializeObject(jsonDecode(response.body));
  }
}

class ApiException implements Exception {
  int statusCode;
  http.Response? response;

  ApiException(this.statusCode, {this.response});

  @override
  String toString() {
    return "ApiException";
  }
}
