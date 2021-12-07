import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workshop7/entities/student.dart';
import 'package:workshop7/service/studentservice.dart';


class AddStudentDialog extends StatefulWidget  {
  final Function()? notifyParent;
  Student? student;

  AddStudentDialog({@required this.notifyParent, this.student});
  @override
  State<AddStudentDialog> createState() => _AddStudentDialogState();
}

class _AddStudentDialogState extends State<AddStudentDialog> {
  TextEditingController nomCtrl =TextEditingController();

  TextEditingController prenomCtrl =TextEditingController();
  TextEditingController dateCtrl =TextEditingController();
  TextEditingController dateNaisCtrl =TextEditingController();

  DateTime selectedDate = DateTime.now();
  String title = "Ajouter Etudiant";
  bool modif = false;

  late int idStudent ;


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      {
        setState(() {
         
          dateCtrl.text=DateFormat("yyyy-MM-dd").format(DateTime.parse(picked.toString()));
        });

      }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.student !=null)
      {
        modif=true;
        title = "Modifier Etudiant";
        nomCtrl.text = widget.student!.nom;
        prenomCtrl.text=widget.student!.prenom;
        dateCtrl.text = DateFormat("yyyy-MM-dd").format(DateTime.parse(widget.student!.dateNais.toString()));
        idStudent = widget.student!.id!;
      }

  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
             Text(title),
            TextFormField(
              controller:nomCtrl ,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Champs est obligatoire";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "nom"
              ),
            ),
            TextFormField(
              controller:prenomCtrl ,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Champs est obligatoire";
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Prénom"
              ),
            ),
             TextFormField(
               controller:dateCtrl ,
                decoration: InputDecoration(
                  labelText: "Date de naissance"
                ),
                onTap:(){


                    _selectDate(context);




                  },



              ),

           // IconButton(onPressed: ()=>_selectDate(context), icon: const Icon(Icons.date_range_outlined)),
            //Text(DateFormat("yyyy-MM-dd").format(DateTime.parse(selectedDate.toString()))),
            ElevatedButton(onPressed: ()async {
              if(modif == false)
                {
                  await addStudent(Student( selectedDate.toString(),nomCtrl.text, prenomCtrl.text));
                  widget.notifyParent!();
                }
              else{
                await updateStudent(Student( selectedDate.toString(),nomCtrl.text, prenomCtrl.text,idStudent));
                widget.notifyParent!();
              }


            }, child: Text("Ajouter"))
          ],
        ),
      ),
    );
  }
}
