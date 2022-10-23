import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reward_yourself/app/modules/create_tasks/create_task_controller.dart';
import 'package:reward_yourself/app/modules/create_tasks/models/task_model.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key, required this.createTaskController})
      : super(key: key);
  final CreateTaskController createTaskController;

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _titleController = TextEditingController();
  final _durationController = TextEditingController();
  final _costController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool permanent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 7,
        leading: Image.asset(
          "assets/images/white_logo.png",
          width: 34,
          height: 32,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 65.0),
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          "Reward Yourself",
          style: TextStyle(
            fontFamily: "MavenPro",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Adicionar Recompensas",
                style: TextStyle(
                  fontFamily: "Archivo",
                  fontSize: 20,
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                    value: permanent,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (bool value) {
                      setState(() {
                        permanent = value;
                      });
                    },
                  ),
                  Text(
                    "Fixa",
                    style: TextStyle(
                        fontFamily: "Poppins", color: Color(0xFF9C98A6)),
                  ),
                ],
              ),
              TextFormField(
                controller: _titleController,
                style: const TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    labelText: "Tarefa",
                    labelStyle: const TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0xFFFDA951),
                        ))),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _durationController,
                style: const TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    labelText: "Tempo (hora)",
                    labelStyle: const TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0xFFFDA951),
                        ))),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _costController,
                style: const TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    labelText: "Custo",
                    labelStyle: const TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0xFFFDA951),
                        ))),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _descriptionController,
                style: const TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    labelText: "Descrição",
                    labelStyle: const TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0xFFFDA951),
                        ))),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final taskModel = TaskModel(
                          user: FirebaseAuth.instance.currentUser!.uid,
                          title: _titleController.text,
                          cost: int.parse(_costController.text),
                          duration: double.parse(_durationController.text),
                          permanent: permanent,
                          description: _descriptionController.text,
                        );
                        widget.createTaskController.createTask(taskModel);
                      },
                      child: Text("Adicionar"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 56),
                        backgroundColor: Color(0xFFFDA951),
                        textStyle: TextStyle(
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
