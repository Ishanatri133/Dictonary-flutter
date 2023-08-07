import 'package:dictionary/dictclient.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DictClient dClient = DictClient();
  TextEditingController tc = TextEditingController();
  String meaning="null";

callAPI(q) async {
    dClient.searchForWord(query: q);
    //print("The API is called with the following word $q");
    meaning = await dClient.searchForWord(query: q);
    setState(() {});
  }


 @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("DICTIONARY"),
        centerTitle: true,
      ),
      body: SizedBox(
        // color: Colors.teal,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tc,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.clear)),
                    label: const Text("DICT"),
                    hintText: "Enter a Word Here"),
              
                // style: ,
                keyboardType: TextInputType.number,
                onChanged: (string) {

                  // print(textfield.text); //controller--> text
                  print("This is the text from the textfield $string");
                },
                
                onEditingComplete: () {
                  // print(
                  //     // "this is the final submission from the textfield ${txtfld.text}");
                },
              ),
            ),
            OutlinedButton(onPressed: (){callAPI(tc.text);}, child: const Text("SEARCH")),
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height * 0.15 ,
              child: Center(child: Text(meaning, style: TextStyle(color: Colors.white, fontSize: 20),)),
            )
          ],
        ),
      ),
    ));
  }
}
