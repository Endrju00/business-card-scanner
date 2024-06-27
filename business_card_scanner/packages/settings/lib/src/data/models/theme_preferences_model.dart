import 'package:core/json_anotation.dart';

import '../../domain/entities/entities.dart';

part 'theme_preferences_model.g.dart';

@JsonSerializable()
class ThemePreferencesModel extends ThemePreferences {
  const ThemePreferencesModel({
    required super.isDarkMode,
  });

  factory ThemePreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$ThemePreferencesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThemePreferencesModelToJson(this);
}
