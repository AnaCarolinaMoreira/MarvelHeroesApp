import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelheroes_app/app/modules/dashboard/presenter/cubit/dashboard_cubit.dart';
import 'package:marvelheroes_app/app/modules/dashboard/presenter/widgets/default_carousel.dart';
import 'package:marvelheroes_app/app/modules/dashboard/presenter/widgets/list_items.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardCubit cepCubit = Modular.get<DashboardCubit>();

  @override
  void initState() {
    cepCubit.getCharactersResponse();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFed1a23),
        title: Image.asset(
          height: MediaQuery.of(context).size.height * 0.06,
          'images/logo_heroes.png',
          fit: BoxFit.cover,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black12,
            height: MediaQuery.of(context).size.height * 0.30,
          ),
          const Column(
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
        ],
      ),
    );
  }
}
