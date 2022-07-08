import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          childrenPadding:
                              const EdgeInsets.all(16).copyWith(top: 0),
                          title: const Text('Acknowledgement',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          children: const [
                            ListTile(
                              title: Text(
                                'Alex Maina',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle:
                                  Text('Software Dev,  Bestypie. Nairobi, KE.'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text('API Question v1.0.0')
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
