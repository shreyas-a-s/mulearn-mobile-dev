class Biodata {
  final String name;
  final String gender;
  final int age;
  final String dob;
  final String place;
  final String occupation;
  final String bloodGroup;

  Biodata({
    required this.name,
    required this.gender,
    required this.age,
    required this.dob,
    required this.place,
    required this.occupation,
    required this.bloodGroup,
  });

  // Optional: Factory constructor to create an instance with default values
  factory Biodata.defaultData() {
    return Biodata(
      name: 'Shreyas A S',
      gender: 'Male',
      age: 22,
      dob: '24/11/2001',
      place: 'Kazhakoottam, Trivandrum',
      occupation: 'Student',
      bloodGroup: 'AB -ve',
    );
  }
}
