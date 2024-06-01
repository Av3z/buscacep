import 'package:buscacep/src/models/cep_model.dart';
import 'package:buscacep/src/repositories/cep_repository.dart';
import 'package:flutter/material.dart';

class HomeController {
  final CEPRepository cepRepository = CEPRepository();
  final TextEditingController cepController = TextEditingController();
  final ValueNotifier<bool> loadingNotifier = ValueNotifier(false);
  final ValueNotifier<CEPModel> cepModelNotifier = ValueNotifier(CEPModel());

  Future<void> onPressed() async {
    loadingNotifier.value = true;
    cepModelNotifier.value = await cepRepository.getCep(cepController.text);
    loadingNotifier.value = false;
  }

}