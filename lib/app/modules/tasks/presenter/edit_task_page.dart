import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reward_yourself/app/modules/tasks/presenter/edit_task_controller.dart';
import 'package:reward_yourself/app/modules/tasks/models/task_model.dart';
import 'package:reward_yourself/components/text_field.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({
    Key? key,
    required this.editTaskController,
    required this.id,
  })
      : super(key: key);

  final EditTaskController editTaskController;
  final String? id;

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final _titleController = TextEditingController();
  final _durationController = TextEditingController();
  final _rewardController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool permanent = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loadTask();
  }

  void loadTask() async {
    TaskModel task = await widget.editTaskController.getTask(widget.id, FirebaseAuth.instance.currentUser!.uid);
    _titleController.text = task.title;
    _durationController.text = task.duration.toString();
    _rewardController.text = task.reward.toString();
    _descriptionController.text = task.description.toString();
  }

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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Editar Tarefa",
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
                    const Text(
                      "Fixa",
                      style: TextStyle(
                          fontFamily: "Poppins", color: Color(0xFF9C98A6)),
                    ),
                  ],
                ),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  label: "Tarefa*",
                  controller: _titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  label: "Tempo (hora)",
                  controller: _durationController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow((RegExp("[.0-9]"))),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  label: "Recompensa*",
                  controller: _rewardController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  textInputAction: TextInputAction.done,
                  label: "Descrição",
                  controller: _descriptionController,
                  minLines: 3,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final taskModel = TaskModel(
                              user: FirebaseAuth.instance.currentUser!.uid,
                              title: _titleController.text,
                              reward: int.parse(_rewardController.text),
                              duration: _durationController.text.isNotEmpty
                                  ? double.parse(_durationController.text)
                                  : null,
                              permanent: permanent,
                              description: _descriptionController.text,
                            );
                            widget.editTaskController
                              .editTask(taskModel, widget.id, FirebaseAuth.instance.currentUser!.uid);
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 56),
                          backgroundColor: const Color(0xFFFDA951),
                          textStyle: const TextStyle(
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        child: const Text("Editar"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}