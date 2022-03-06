abstract class UserProfileEvent {}

class InitialEvent extends UserProfileEvent {
  InitialEvent(this.uid);

  final String uid;
}

class FollowEvent extends UserProfileEvent {
  FollowEvent({
    required this.uid,
    required this.followerId,
  });

  final String uid;
  final String followerId;
}

class UnfollowEvent extends UserProfileEvent {}
