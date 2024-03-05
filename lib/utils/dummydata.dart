String get portraitImage {
  List portraitImages = [
    "https://images.pexels.com/photos/5940841/pexels-photo-5940841.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/8199174/pexels-photo-8199174.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/16716954/pexels-photo-16716954/free-photo-of-light-city-sunset-vacation.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/7973205/pexels-photo-7973205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/16160869/pexels-photo-16160869/free-photo-of-anapriscilla.jpeg?auto=compress&cs=tinysrgb&w=1600",
    "https://images.pexels.com/photos/7683704/pexels-photo-7683704.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/15371598/pexels-photo-15371598/free-photo-of-university-students-in-gowns-after-graduation.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
  ];
  portraitImages.shuffle();
  return portraitImages.first;
}

String get randomAddresses {
  List randomAddressList = [
    "123 Main St, Anytown, USA",
    "456 Elm St, Springfield, USA",
    "789 Oak Ave, Lakeside, USA",
    "321 Maple Dr, Rivertown, USA",
    "987 Pine St, Mountainview, USA",
    "654 Cedar Ln, Hillside, USA",
    "246 Birch Rd, Parkville, USA",
  ];
  randomAddressList.shuffle();
  return randomAddressList.first;
}

String get randomPhoneNumbers {
  List randomPhoneNumbersList = [
    "+14155552671", // United States
    "+447123456789", // United Kingdom
    "+61355555555", // Australia
    "+819012345678", // Japan
    "+490123456789", // Germany
    "+33123456789", // France
    "+34612345678", // Spain
    "+918765432109", // India
    "+5531998765432", // Brazil
    "+8613912345678", // China
    "+27123456789", // South Africa
    "+525511234567", // Mexico
    "+6520123456", // Singapore
    "+6123456789", // New Zealand
    "+59891234567", // Uruguay
    "+5411998765432", // Argentina
    "+5215512345678", // Mexico (cell phone)
    "+622112345678", // Indonesia
    "+541123456789", // Bolivia
    "+56912345678",
  ];
  randomPhoneNumbersList.shuffle();
  return randomPhoneNumbersList.first;
}

String get randomNames {
  List randomNameslist = [
    "Alice Johnson",
    "Bob Smith",
    "Emily Brown",
    "David Wilson",
    "Sophia Martinez",
    "Michael Anderson",
    "Olivia Taylor",
    "James Jackson",
    "Ava Harris",
    "John Thompson",
    "Isabella White",
    "William Garcia",
    "Mia Martinez",
    "Alexander Robinson",
    "Emma Lewis",
    "Daniel Lee",
    "Charlotte Hall",
    "Noah Phillips",
    "Abigail Clark",
    "Ethan Wright",
  ];
  randomNameslist.shuffle();
  return randomNameslist.first;
}
