enum NavigateRoutes {
  home,
  signIn,
  signUp,
  verification,
  landing,
  vacancy,
  result,
  profile,
  search,
  settings,
}

extension NavigateExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
