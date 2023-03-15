import 'package:firenase_crud2/controllers/users_controller.dart';
import 'package:firenase_crud2/models/users_model.dart';
import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class AddOrUpdate extends StatefulWidget {
  final UserModel? user;
  final index;
  const AddOrUpdate({super.key, this.user, this.index});

  @override
  State<AddOrUpdate> createState() => _AddOrUpdateState();
}

class _AddOrUpdateState extends State<AddOrUpdate> {
  static final formkey = GlobalKey<FormState>(); //formlardan gelen keyleri kontrol etmek için
  bool isEditingMode = false; //add mi upgrade mi olmasını kontrol etmek için
  final TextEditingController idController = TextEditingController(); //text controllerlar
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    //bu kısımda edit iconuna basında bastığımız veri gelsin diye yapıldı
    if (widget.index != null) {
      isEditingMode = true;
      idController.text = widget.user!.id!;
      usernameController.text = widget.user!.username!;
      ageController.text = widget.user!.age.toString();
    } else {
      isEditingMode = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        //update modu mu add modu mu kontrol
        title: isEditingMode == true ? const Text('Update Users Page') : const Text('Add Users Page'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Users',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Type your Username',
                      icons: const Icon(Icons.person),
                      labelText: 'Username',
                      myController: usernameController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Type your Age',
                      icons: const Icon(Icons.numbers),
                      labelText: 'Age',
                      myController: ageController,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Colors.deepOrange,
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        //keyler kontrol edip saveledik
                        //formkey.currentState!.save();
                        if (isEditingMode == true) {
                          //Mode true ise update
                          UsersController().updateUsers(
                            //update yaptıgımız yer usermodelin içinden vektik
                            UserModel(
                              //username ve age kısmına controller texti yazdırdık
                              username: usernameController.text,
                              age: int.parse(ageController.text),
                              id: idController.text,
                            ),
                          );
                        } else {
                          //değilse add işlemi yapıyoruz
                          UsersController().addUsers(
                            UserModel(
                              //username ve age kısmına controller texti yazdırdık
                              username: usernameController.text,
                              age: int.parse(ageController.text),
                            ),
                          );
                        }
                      }
                      Navigator.pop(context);
                    },
                    child: isEditingMode == true ? const Text('Update') : const Text('Save')),
              ),
            )
          ],
        ),
      )),
    );
  }
}
