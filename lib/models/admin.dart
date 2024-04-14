class Admin {
  final int uid;
  final bool isSystem;
  final bool isAdmin;
  final String name;
  final String username;
  final String partnerDisplayName;
  final int companyId;
  final int partnerId;
  final bool homeActionId;
  final Map<String, dynamic> cacheHashes;
  final Map<String, dynamic> currenciesMap;
  final UserCompanies userCompanies;
  final String showEffect;
  final bool displaySwitchCompanyMenu;
  final List<int> userId;
  final int maxTimeBetweenKeysInMs;
  final String sessionId;

  Admin({
    this.uid = 0,
    this.isSystem = false,
    this.isAdmin = true,
    this.name = "",
    this.username = "",
    this.partnerDisplayName = "",
    this.companyId = 0,
    this.partnerId = 0,
    this.homeActionId = false,
    this.cacheHashes = const {},
    this.currenciesMap = const {},
    this.userCompanies = const UserCompanies(),
    this.showEffect = "",
    this.displaySwitchCompanyMenu = false,
    this.userId = const [],
    this.maxTimeBetweenKeysInMs = 0,
    this.sessionId = "",
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      uid: json['uid'],
      isSystem: json['is_system'],
      isAdmin: json['is_admin'],
      name: json['name'],
      username: json['username'],
      partnerDisplayName: json['partner_display_name'],
      companyId: json['company_id'],
      partnerId: json['partner_id'],
      homeActionId: json['home_action_id'],
      cacheHashes: json['cache_hashes'],
      currenciesMap: json['currencies'],
      userCompanies: UserCompanies.fromJson(json['user_companies']),
      showEffect: json['show_effect'],
      displaySwitchCompanyMenu: json['display_switch_company_menu'],
      userId: List.from(json['user_id']),
      maxTimeBetweenKeysInMs: json['max_time_between_keys_in_ms'],
      sessionId: json['session_id'],
    );
  }
}

class UserCompanies {
  final int currentCompany;
  final Map<String, dynamic> allowedCompanies;

  const UserCompanies({
    this.currentCompany = 0,
    this.allowedCompanies = const {},
  });

  factory UserCompanies.fromJson(Map<String, dynamic> json) {
    return UserCompanies(
      currentCompany: json['current_company'] ?? 0,
      allowedCompanies: json['allowed_companies'],
    );
  }
}

class UserContext {
  final String lang;
  final String tz;
  final int uid;

  UserContext({
    required this.lang,
    required this.tz,
    required this.uid,
  });
}
