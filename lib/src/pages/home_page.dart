import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'BuscaCEP',
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 35),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
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
                onPressed: () {},
                child: const Text(
                  'Buscar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          )
        ]),
      ),
    );
  }
}
