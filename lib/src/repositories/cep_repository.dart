import 'dart:convert';

import 'package:buscacep/src/models/cep_model.dart';
import 'package:buscacep/src/utils/contains_only_number.dart';
import 'package:http/http.dart' as http;

class CEPRepository {
  Future<CEPModel> getCep(String cep) async {
    if (containsOnlyNumbers(cep)) {
      var response =
          await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json'));
      var json = jsonDecode(response.body);
      return CEPModel.fromJson(json);
    }
    return CEPModel();
  }
}
