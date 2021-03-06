import '../models/user.dart';

class UserPreferences {
  static const myUser = UserProfile(
      imagePath: 'assets/me.jpeg',
      name: 'Joseph',
      email: 'joeyanyim@gmail.com',
      phone: '+228 97 99 86 21',
      about:
          """I do not beat around the bush, rather, I hit the nail on the head. It's probably why they call me '''Sent Joseph the Worker'''.
      In case you haven't figured, I'm the carpenter you need to make your cross lighter :).
      Please hire me ;)""",
      isDarkmode: false);
}
