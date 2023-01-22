import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sims/state/models/student.dart';

class StudentListReport extends StatelessWidget {
  const StudentListReport({
    super.key,
    required this.students,
  });

  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) async {
        final pdf = pw.Document();

        pdf.addPage(pw.Page(
          orientation: pw.PageOrientation.landscape,
          build: (context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
              children: [
                pw.Text(
                  'Data Siswa',
                  textAlign: pw.TextAlign.center,
                  style: pw.Theme.of(context).header0,
                ),
                pw.SizedBox(height: 20.0),
                pw.Table.fromTextArray(
                  headerStyle: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                  ),
                  data: [
                    ['NISN', 'Nama', 'Jenis Kelamin', 'Alamat'],
                    for (var student in students)
                      [
                        student.nisn,
                        student.name,
                        student.gender,
                        student.address
                      ]
                  ],
                ),
                pw.SizedBox(height: 32.0),
                pw.Align(
                  alignment: pw.Alignment.centerRight,
                  child: pw.Flexible(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text('10 Januari 2023'),
                        pw.SizedBox(height: 80.0),
                        pw.Text('Kepala Sekolah'),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));

        final docs = await pdf.save();

        return docs;
      },
    );
  }
}
