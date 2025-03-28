import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelheroes_app/app/modules/dashboard/dashboard.dart';
import 'package:marvelheroes_app/app/modules/dashboard/presenter/screens/dashboard_mixin.dart';
import 'package:marvelheroes_app/app/modules/dashboard/presenter/widgets/default_carousel.dart';
import 'package:marvelheroes_app/app/modules/dashboard/presenter/widgets/list_items.dart';
import 'package:marvelheroes_app/app/modules/dashboard/presenter/widgets/modals.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with DashboardMixin {
  @override
  void initState() {
    cubit.getCharactersResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is DashboardErrorState) {
            showErrorModal(
                context, state.failure.message ?? 'Ops, ocorreu um erro');
          }
          if (state is DashboardSuccessState) {
            if (state.charactersResponse?.data != null) {
              setState(() {
                resultsList = state.charactersResponse!.data!.results;
              });
            } else {
              setState(() {
                resultsList = [];
              });
            }
          }
        },
        builder: (context, state) {
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DefaultCarousel(
                        results: resultsList,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: ListItems(
                        results: resultsList,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
