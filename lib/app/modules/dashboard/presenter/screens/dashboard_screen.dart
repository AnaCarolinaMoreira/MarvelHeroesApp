import 'package:flutter/material.dart';
import 'package:marvelheroes_app/app/modules/dashboard/presenter/widgets/default_carousel.dart';
import 'package:marvelheroes_app/app/modules/dashboard/presenter/widgets/list_items.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Image.asset(
          height: MediaQuery.of(context).size.height * 0.06,
          'images/logo.png',
          fit: BoxFit.cover,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 51, 35, 35),
            height: MediaQuery.of(context).size.height * 0.30,
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: DefaultCarousel()),
                SizedBox(
                  height: 50,
                ),
                Expanded(child: ListItems())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
