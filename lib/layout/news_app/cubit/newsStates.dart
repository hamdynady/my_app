abstract class NewsStates{}

class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}
class GetBusinessSuccessState extends NewsStates{}
class GetBusinessErrorState extends NewsStates{
  final String error;
  GetBusinessErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}
class GetScienceSuccessState extends NewsStates{}
class GetScienceErrorState extends NewsStates{
  final String error;
  GetScienceErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates{}
class GetSportsSuccessState extends NewsStates{}
class GetSportsErrorState extends NewsStates{
  final String error;
  GetSportsErrorState(this.error);
}

class NewsGetSettingsLoadingState extends NewsStates{}
class GetSettingsSuccessState extends NewsStates{}
class GetSettingsErrorState extends NewsStates{
  final String error;
  GetSettingsErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates{}
class GetSearchSuccessState extends NewsStates{}
class GetSearchErrorState extends NewsStates{
  final String error;
  GetSearchErrorState(this.error);
}