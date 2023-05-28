import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import '../login/login_screen1.dart';
import '../passenger/passenger_main_menu_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final PageController _controller = PageController(initialPage: 0);
  bool _hidePassword = true;
  final _formKey = GlobalKey<FormState>();
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'US');
  String? verificationCode;
  File? _imageFile;
  DateTime selectedDate = DateTime.now();
  String? gender;
  List<String> interests = [];
  String? hometown;
  String? profession;
  String? aboutMe;
  final TextEditingController _interestController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _pnrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA8DDFF),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          _buildPersonalDetailsPage(context),
          _buildPhoneVerificationPage(context),
          _buildOTPVerificationPage(context),
          _buildAccountDetailsPage(context),
          _buildBookingConfirmationPage(context),
        ],
      ),
    );
  }

  Widget _buildPersonalDetailsPage(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/logo.jpeg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Create your AirEasy Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: _hidePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(_hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: _hidePassword,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        suffixIcon: IconButton(
                          icon: Icon(_hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Use 8 or more characters with a mix of letters, numbers & symbols',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen1(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Log in instead',
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                }
                              },
                              child: const Text(
                                'Next',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneVerificationPage(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/logo.jpeg'),
              ),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Verify your phone number',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'For your security, AirEasy wants to make sure it’s really you. AirEasy will send a text message with a 6-digit verification code.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
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
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Standard rates apply',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        _controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'Back',
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
                      onPressed: () {
                        // TODO: Handle phone verification and sending of OTP here.
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPVerificationPage(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/logo.jpeg'),
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'Verify your phone number',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'For your security, AirEasy wants to make sure it’s really you. AirEasy will send a text message with a 6-digit verification code.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Text(
                phoneNumber.phoneNumber ?? '+1 1234567890',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Verification Code',
                ),
                onChanged: (value) => verificationCode = value,
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Standard rates apply',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {
                          _controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: const Text(
                          'Back',
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
                        onPressed: () {
                          // TODO: Verify the OTP and if it's correct then navigate to the next page
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: const Text(
                          'Verify',
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

  Widget _buildAccountDetailsPage(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _pickImage(),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!)
                      : const AssetImage('assets/blank_profile.png')
                          as ImageProvider<Object>,
                ),
              ),
              TextButton(
                child: Text(
                  "Upload Profile Picture",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                onPressed: _pickImage,
              ),
              const SizedBox(height: 30),
              // Birthdate
              GestureDetector(
                onTap: _selectDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Birthdate',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Gender
              DropdownButtonFormField<String>(
                value: gender,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gender',
                ),
                items: ['Male', 'Female', 'Other', 'Prefer not to say']
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Hometown
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Hometown',
                ),
                onChanged: (value) => hometown = value,
              ),
              const SizedBox(height: 20),
              // Profession
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Profession',
                ),
                onChanged: (value) => profession = value,
              ),
              const SizedBox(height: 20),
              // Interests
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
                controller: _interestController,
                decoration: InputDecoration(
                  labelText: 'Enter interests',
                  border: OutlineInputBorder(),
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
              // About me
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'About Me',
                ),
                onChanged: (value) => aboutMe = value,
                maxLines: 3,
              ),
              const SizedBox(height: 40),
              // Next Button
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookingConfirmationPage(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/logo.jpeg'),
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'Add your Flight Details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Enter your 6-character Flight Booking Confirmation Code or Passenger Name Record (PNR) to start chatting with fellow passengers.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _pnrController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Booking Confirmation Code/PNR',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                            'Where to find Booking Confirmation Code/PNR?'),
                        content: Text(
                            'You can find your Booking Confirmation Code/PNR in your flight ticket.'),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 120),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PassengerMainMenuScreen()),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        if (_pnrController.text.length == 6) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PassengerMainMenuScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Invalid PNR. Please check again.')),
                          );
                        }
                      },
                      child: Text(
                        'Verify',
                        style: TextStyle(fontSize: 20),
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

  Future _pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = path.basename(file.path);
      final savedImage = await file.copy('${appDir.path}/$fileName');

      setState(() {
        _imageFile = savedImage;
      });
    } else {
      // User canceled the picker
    }
  }

  Future _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        _dateController.text =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
    }
  }
}
