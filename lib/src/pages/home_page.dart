import 'package:buscacep/src/models/cep_model.dart';
import 'package:buscacep/src/repositories/cep_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CEPRepository cepRepository = CEPRepository();
  TextEditingController cepController = TextEditingController();
  CEPModel cep = CEPModel();
  bool loading = false;

  void onPressed() async {
    loading = true;
    cep = await cepRepository.getCep(cepController.text);
    setState(() {});
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'BuscaCEP',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              maxLength: 8,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors
                          .transparent), // Remover a borda quando não está focado
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.green),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                onPressed: onPressed,
                child: const Text(
                  'Buscar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cep.localidade ?? '',
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              const SizedBox(
                width: 5,
              ),
              Text(cep.uf ?? '',
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ],
          ),
          Text(
            cep.logradouro ?? '',
            style: TextStyle(color: Colors.grey[900]),
          ),
          Text(cep.bairro ?? '', style: TextStyle(color: Colors.grey[900])),
          if (loading) const CircularProgressIndicator(),
        ]),
      ),
    );
  }
}
