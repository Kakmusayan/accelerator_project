import 'package:flutter/material.dart';
import 'package:accelerator_project/constants/app_colors.dart';
import 'package:accelerator_project/constants/app_styles.dart';
import 'package:accelerator_project/model/person.dart';
import 'package:accelerator_project/generated/l10n.dart';

import './widgets/person_grid_tile.dart';
import './widgets/person_list_tile.dart';
import './widgets/search_field.dart';

part './widgets/_grid_view.dart';
part './widgets/_list_view.dart';

class PersonsList extends StatefulWidget {
  const PersonsList({Key? key}) : super(key: key);

  @override
  State<PersonsList> createState() => _PersonsListState();
}

class _PersonsListState extends State<PersonsList> {
  bool isGridView = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SearchField(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      S
                          .of(context)
                          .personsTotal(_personsList.length)
                          .toUpperCase(),
                      style: AppStyles.s10w500.copyWith(
                        letterSpacing: 1.5,
                        color: AppColors.neutral2,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(isGridView ? Icons.grid_view : Icons.list),
                    iconSize: 28.0,
                    color: AppColors.neutral2,
                    onPressed: () {
                      setState(() {
                        isGridView = !isGridView;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: isGridView
                  ? _GridView(personsList: _personsList)
                  : _ListView(personsList: _personsList),
            ),
          ],
        ),
      ),
    );
  }
}

final _list = [
  const Person(
    name: 'Рик Санчез',
    species: 'Человек',
    status: 'Alive',
    gender: 'Мужской',
  ),
  const Person(
    name: 'Алан Райс',
    species: 'Человек',
    status: 'Dead',
    gender: 'Мужской',
  ),
  const Person(
    name: 'Саммер Смит',
    species: 'Человек',
    status: 'Alive',
    gender: 'Женский',
  ),
  const Person(
    name: 'Морти Смит',
    species: 'Человек',
    status: 'Alive',
    gender: 'Мужской',
  ),
];

final _personsList = [
  ..._list,
  ..._list,
  ..._list,
  ..._list,
];
