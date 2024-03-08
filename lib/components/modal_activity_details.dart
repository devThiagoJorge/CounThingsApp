import 'package:flutter/material.dart';

class ModalActivityDetailsWidget extends StatelessWidget {
  const ModalActivityDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 3,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: 52,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Nome da atividade',
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                        child: Checkbox(
                            value: true,
                            activeColor: Colors.purple,
                            tristate: true,
                            onChanged: null),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: FloatingActionButton.extended(
                          icon: Icon(Icons.save),
                          label: Text(
                            'Salvar',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: null,
                        ),
                      )
                    ],
                  )),
                )
              ],
            ),
          )),
    );
  }
}
