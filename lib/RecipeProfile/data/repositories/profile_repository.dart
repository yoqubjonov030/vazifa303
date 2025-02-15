import '../../../core/client.dart';
import '../models/profile_model.dart';

class ProfileRepository {
  ProfileRepository({required this.client});

  final ApiClient client;

  ProfileModel? myProfile;

  Future<ProfileModel?> fetchMyProfile() async {
    if (myProfile != null) return myProfile;
    var rawProfile = await client.fetchMyProfile();
    myProfile = ProfileModel.fromJson(rawProfile);
    return myProfile;
  }
}