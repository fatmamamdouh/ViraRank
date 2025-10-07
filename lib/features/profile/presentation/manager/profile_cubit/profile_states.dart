abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates{}

class GetProfileLoadingState extends ProfileStates{}
class GetProfileSuccessState extends ProfileStates{}
class GetProfileFailureState extends ProfileStates{}