import 'package:core/errors.dart';
import 'package:core/secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:settings/src/data/datasources/local_data_source.dart';

import 'local_data_source_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  late MockFlutterSecureStorage mockFlutterSecureStorage;
  late LocalDataSource dataSource;

  setUp(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    dataSource = LocalDataSource(storage: mockFlutterSecureStorage);
  });

  const tLanguageCode = 'en';

  group('getLocale', () {
    test('should get locale from the secure storage', () async {
      // arrange
      when(mockFlutterSecureStorage.read(key: LocalDataSource.localeKey))
          .thenAnswer((_) async => tLanguageCode);
      // act
      final result = await dataSource.getLocale();
      // assert
      expect(result.languageCode, tLanguageCode);
      verify(mockFlutterSecureStorage.read(key: LocalDataSource.localeKey));
    });

    test('should throw an exception when there is no data saved', () async {
      // arrange
      when(mockFlutterSecureStorage.read(key: LocalDataSource.localeKey))
          .thenThrow(CacheException());
      // act
      final call = dataSource.getLocale;
      // assert
      expect(() => call(), throwsA(isA<CacheException>()));
      verify(mockFlutterSecureStorage.read(key: LocalDataSource.localeKey));
    });
  });
}
