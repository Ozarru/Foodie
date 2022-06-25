import '../models/user.dart';

class UserPreferences {
  static const myUser = UserProfile(
      imagePath: 'assets/static/man.webp',
      name: 'Joseph',
      email: 'joeyanyim@gmail.com',
      phone: '+228 97 99 86 21',
      about:
          """Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
          Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
          when an unknown printer took a galley of type and scrambled it to make a type specimen book. """,
      isDarkmode: false);
}
