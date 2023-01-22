import 'package:flutter/material.dart';
import 'package:sims/state/models/student.dart';

class DataDisplay<T> extends DataTableSource {
  DataDisplay(this.lists);

  List<Student> lists;
  @override
  DataRow? getRow(int index) {
    final student = lists[index];
    int indexNum = index + 1;
    return DataRow(
      cells: [
        DataCell(Text('$indexNum')),
        DataCell(Text(student.nisn)),
        DataCell(Text(student.name)),
        DataCell(Text(student.gender)),
      ],
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => lists.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
