import 'package:uas_praktikum_pbm/Api/connect_api.dart';
import 'package:flutter/material.dart';

class inputAbsenPage extends StatefulWidget {
  const inputAbsenPage({super.key});

  @override
  State<inputAbsenPage> createState() => _inputAbsenPageState();
}

class _inputAbsenPageState extends State<inputAbsenPage> {
  final tcNama = TextEditingController();
  final tcNpm = TextEditingController();
  final List _kelas = ['5A', '5B', '5C', '5D'];
  DateTime selectedDate = DateTime.now();
  // ignore: non_constant_identifier_names
  final tcKet = TextEditingController();


  String Nama = '', Npm ='', Kelas ='', Tgl ='', Ket ='';

  Future<Null> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate){
      setState(() {
        selectedDate = picked;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: tcNama,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nama',
              hintText: 'ex. Your Name'
            ),
          ),
          TextField(
            controller: tcNpm,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'NPM',
              hintText: 'ex. 201063117###'
            ),
          ),
          DropdownButton(
            hint: const Text('Kelas'),
            value: Kelas.isNotEmpty ? Kelas : null,
            items: _kelas.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                Kelas = value.toString();
                print(Kelas);
              });
            },
          ),
          Text("${selectedDate.toLocal()}".split(' ')[0]),
          ElevatedButton(
              onPressed: () => {
                _selectDate(context),
                print(selectedDate.day + selectedDate.month + selectedDate.year )
              },
              
              child: Text('Pilih Tanggal'),
            ),
          TextField(
            controller: tcKet,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Keterangan',
              hintText: 'ex. Hadir'
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Nama = tcNama.text;
              Npm = tcNpm.text;
              Ket = tcKet.text;
              Tgl = "${selectedDate.toLocal()}".split(' ')[0];
              inputAbsen.connectAPI(Nama, Npm, Kelas, Tgl, Ket).then(
                (value) {
                  print('data ${value.Nama} berhasil diinput');
                }
              );
              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back'),
          )
        ],
      ),
    );
  }
}