import 'package:flutter/material.dart';
import 'package:marvelheroes_app/app/modules/dashboard/infra/model/characters_response_model/characters_response_model.dart';

class ListItems extends StatefulWidget {
  final List<Result> results;
  const ListItems({super.key, required this.results});

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: widget.results.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage(widget.results[index].thumbnail.extension),
                backgroundColor: Colors.transparent,
              ),
              title: Text(widget.results[index].name),
              subtitle: Text(widget.results[index].description),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_right,
                ),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
