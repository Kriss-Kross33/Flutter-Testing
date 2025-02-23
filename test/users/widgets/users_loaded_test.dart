import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/core/models/models.dart';
import 'package:flutter_testing/users/users.dart';

void main() {
  group('UsersLoaded', () {
    const users = <User>[
      User(
        id: 1,
        name: "Leanne Graham",
        username: "Bret",
        email: "Sincere@april.biz",
        address: Address(
          street: 'Kulas Light',
          suite: 'Apt. 556',
          city: 'Gwenborough',
          zipcode: '92998-3874',
          geo: Geo(lat: '-37.3159', lng: '81.1496'),
        ),
        phone: "1-770-736-8031 x56442",
        website: "hildegard.org",
        company: Company(
          name: 'Romaguera-Crona',
          catchPhrase: 'Multi-layered client-server neural-net',
          bs: 'harness real-time e-markets',
        ),
      ),
      User(
        id: 2,
        name: "Ervin Howell",
        username: "Antonette",
        email: "Shanna@melissa.tv",
        address: Address(
          street: 'Victor Plains',
          suite: 'Suite 879',
          city: 'Wisokyburgh',
          zipcode: '90566-7771',
          geo: Geo(lat: '-43.9509', lng: '-34.4618'),
        ),
        phone: "010-692-6593 x09125",
        website: "anastasia.net",
        company: Company(
          name: 'Deckow-Crist',
          catchPhrase: 'Proactive didactic contingency',
          bs: 'synergize scalable supply-chains',
        ),
      )
    ];

    testWidgets('renders correct amount of ListTile', (tester) async {
      final key = UniqueKey();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UsersLoaded(
              key: key,
              users: users,
              onRefresh: () async {},
            ),
          ),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(users.length));
      final user1 = users[0];
      expect(find.widgetWithText(CircleAvatar, user1.id.toString()),
          findsOneWidget);
      expect(find.text(user1.id.toString()), findsOneWidget);
      expect(find.text(user1.name), findsOneWidget);
      expect(find.text(user1.username), findsOneWidget);
    });

    testWidgets('renders correct user details', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: UsersLoaded(
            users: users,
            onRefresh: () async {},
          ),
        ),
      ));
      final user1 = users[0];
      expect(find.widgetWithText(CircleAvatar, '${user1.id}'), findsOneWidget);
      expect(find.widgetWithText(ListTile, user1.name), findsOneWidget);
      expect(find.widgetWithText(ListTile, user1.username), findsOneWidget);
      final user2 = users[1];
      expect(find.widgetWithText(CircleAvatar, '${user2.id}'), findsOneWidget);
      expect(find.widgetWithText(ListTile, user2.name), findsOneWidget);
      expect(find.widgetWithText(ListTile, user2.username), findsOneWidget);
    });
  });
}
