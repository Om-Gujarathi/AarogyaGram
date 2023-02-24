import 'package:flutter/material.dart';

class DoctorDetailsInputScreen extends StatefulWidget {
  @override
  _DoctorDetailsInputScreenState createState() => _DoctorDetailsInputScreenState();
}

class _DoctorDetailsInputScreenState extends State<DoctorDetailsInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _experienceController = TextEditingController();
  final _educationController = TextEditingController();


 final List<String> _genders = ['Male', 'Female', 'Other'];
 final List<String> _hospitals = ['Hospital A', 'Hospital B', 'Hospital C'];
 final List<String> _specializations = [
    'Cardiologist',
    'Dermatologist',
    'Pediatrician',
    'Psychiatrist'
  ];

  String _selectedGender = '';
  List<DropdownMenuItem<String>>? _genderDropdownItems;

  String _selectedHospital = '';
  List<DropdownMenuItem<String>>? _hospitalDropdownItems;

  String _selectedSpecialization = '';
  List<DropdownMenuItem<String>>? _specializationDropdownItems;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    _experienceController.dispose();
    _educationController.dispose();
    super.dispose();
  }

  void _saveDoctorDetails() {
    if (_formKey.currentState!.validate()) {
      // Perform save operation here
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedGender = _genders.first;
     _genderDropdownItems = _genders.map((gender) {
      return DropdownMenuItem<String>(
        value: gender,
        child: Text(gender),
      );
    }).toList();

    _selectedHospital = _hospitals.first;
    _hospitalDropdownItems = _genders.map((hospital) {
      return DropdownMenuItem<String>(
        value: hospital,
        child: Text(hospital),
      );
    }).toList();



    _selectedSpecialization = _specializations.first;
    _specializationDropdownItems = _genders.map((specialization) {
      return DropdownMenuItem<String>(
        value: specialization,
        child: Text(specialization),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an age';
                  }
                  int? age = int.tryParse(value);
                  if (age == null || age <= 0) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _experienceController,
                decoration: InputDecoration(
                  labelText: 'Experience',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter experience';
                  }
                  int? experience = int.tryParse(value);
                  if (experience == null || experience < 0) {
                    return 'Please enter a valid experience';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
                items: _genderDropdownItems,
                decoration: InputDecoration(
                  labelText: 'Gender',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a gender';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _educationController,
                decoration: InputDecoration(
                  labelText: 'Educational Details',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter educational details';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedHospital,
                onChanged: (value) {
                  setState(() {
                    _selectedHospital = value!;
                  });
                },
                items: _hospitalDropdownItems,
                decoration: InputDecoration(
                  labelText: 'Hospital Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a hospital';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedSpecialization,
                onChanged: (value) {
                  setState(() {
                    _selectedSpecialization = value!;
                  });
                },
                items: _specializationDropdownItems,
                decoration: InputDecoration(
                  labelText: 'Specialization',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a specialization';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: _saveDoctorDetails,
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
