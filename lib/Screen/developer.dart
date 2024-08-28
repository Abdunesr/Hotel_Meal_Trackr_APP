

import 'package:flutter/material.dart';


class Developer extends StatelessWidget {
  const Developer({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Developer'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/abd.jpg'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'HI 👋🏿 i am Abdelah I am a Software Enginering Student  ',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(125, 76, 145, 200),
                        Color.fromARGB(125, 122, 187, 241)
                      ])),
                  child: const Icon(
                    Icons.facebook_outlined,
                    size: 60,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(125, 77, 145, 200),
                        Color.fromARGB(125, 122, 187, 241)
                      ])),
                  child: ElevatedButton(
                    child: const ImageIcon(
                      AssetImage('assets/images/github.png'),
                      size: 60,
                      color: Colors.white, 
                    ),
                    onPressed: (){

                    },
                    
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(125, 77, 145, 200),
                        Color.fromARGB(125, 122, 187, 241)
                      ])),
                  child: const Icon(
                    Icons.telegram_outlined,
                    size: 60,
                  ),
                ),
              ],
            ),
            const Text('Click the icon to Contact')
          ],
        ),
      ),
    );
  }
}
