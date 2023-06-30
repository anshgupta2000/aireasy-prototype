import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import './passenger_main_menu_screen.dart';
import '../../models/user.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _interestController = TextEditingController();
  late TextEditingController _dateController;
  String? gender;
  List<String> interests = [];
  PhoneNumber? phoneNumber;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    phoneNumber = PhoneNumber(isoCode: 'US');
  }

  @override
  void dispose() {
    _dateController.dispose();
    _interestController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    if (_isEditing) {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime.now(),
      );
      if (picked != null) {
        setState(() {
          _dateController.text = picked.toIso8601String().split('T')[0];
        });
      }
    }
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveProfile() {
    print("User profile saved");
    _toggleEditing();
  }

  @override
  Widget build(BuildContext context) {
    User user = User(
      id: '1',
      firstName: 'John',
      lastName: 'Doe',
      email: 'johndoe@example.com',
      phoneNumber: '+1234567890',
      gender: 'Male',
      birthday: DateTime.parse('1990-01-01'),
      hometown: 'New York',
      aboutMe: 'Hello, I am John Doe. Nice to meet you!',
      profession: 'Engineer',
      interests: 'Music, Tech, Art',
      role: 'passenger',
      flightReference: null,
      profilePicture: 'assets/blank_profile.png',
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home, size: 40.0),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PassengerMainMenuScreen()),
          ),
        ),
        title: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(user.profilePicture!),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                readOnly: !_isEditing,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                readOnly: !_isEditing,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                isEnabled: _isEditing,
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle:
                    TextStyle(color: Colors.black, inherit: false),
                initialValue: phoneNumber,
                textFieldController: TextEditingController(),
                formatInput: false,
                spaceBetweenSelectorAndTextField: 10,
                inputDecoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Phone Number",
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Birthdate',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: gender,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gender',
                ),
                items: ['Male', 'Female', 'Other', 'Prefer not to say']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: _isEditing
                    ? (value) {
                        setState(() {
                          gender = value!;
                        });
                      }
                    : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                readOnly: !_isEditing,
                decoration: const InputDecoration(
                  labelText: 'Hometown',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                readOnly: !_isEditing,
                decoration: const InputDecoration(
                  labelText: 'Profession',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                children: interests
                    .map((interest) => Chip(
                          label: Text(interest),
                          onDeleted: () {
                            setState(() {
                              interests.remove(interest);
                            });
                          },
                        ))
                    .toList(),
              ),
              TextFormField(
                readOnly: !_isEditing,
                controller: _interestController,
                decoration: InputDecoration(
                  labelText: 'Enter interests',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (_interestController.text.isNotEmpty) {
                        setState(() {
                          interests.add(_interestController.text);
                          _interestController.clear();
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                readOnly: !_isEditing,
                decoration: const InputDecoration(
                  labelText: 'About Me',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: _isEditing ? null : _toggleEditing,
                        child: const Text(
                          'Edit',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: _isEditing ? _saveProfile : null,
                        child: const Text(
                          'Save',
                          style: TextStyle(fontSize: 20),
                        ),
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
