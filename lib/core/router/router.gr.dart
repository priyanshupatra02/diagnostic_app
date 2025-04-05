// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:diagnostic_app/features/contact_details/view/contact_details_page.dart'
    as _i1;
import 'package:diagnostic_app/features/counter/view/counter_page.dart'
    deferred as _i2;
import 'package:diagnostic_app/features/home/view/home_page.dart' as _i3;
import 'package:diagnostic_app/features/terms_and_conditions/view/terms_and_conditions_page.dart'
    as _i4;
import 'package:flutter/material.dart' as _i6;

/// generated route for
/// [_i1.ContactDetailsPage]
class ContactDetailsRoute extends _i5.PageRouteInfo<void> {
  const ContactDetailsRoute({List<_i5.PageRouteInfo>? children})
    : super(ContactDetailsRoute.name, initialChildren: children);

  static const String name = 'ContactDetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.ContactDetailsPage();
    },
  );
}

/// generated route for
/// [_i2.CounterPage]
class CounterRoute extends _i5.PageRouteInfo<void> {
  const CounterRoute({List<_i5.PageRouteInfo>? children})
    : super(CounterRoute.name, initialChildren: children);

  static const String name = 'CounterRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.DeferredWidget(_i2.loadLibrary, () => _i2.CounterPage());
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.TermsAndConditionPage]
class TermsAndConditionRoute
    extends _i5.PageRouteInfo<TermsAndConditionRouteArgs> {
  TermsAndConditionRoute({
    _i6.Key? key,
    required String contentBody,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         TermsAndConditionRoute.name,
         args: TermsAndConditionRouteArgs(key: key, contentBody: contentBody),
         initialChildren: children,
       );

  static const String name = 'TermsAndConditionRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TermsAndConditionRouteArgs>();
      return _i4.TermsAndConditionPage(
        key: args.key,
        contentBody: args.contentBody,
      );
    },
  );
}

class TermsAndConditionRouteArgs {
  const TermsAndConditionRouteArgs({this.key, required this.contentBody});

  final _i6.Key? key;

  final String contentBody;

  @override
  String toString() {
    return 'TermsAndConditionRouteArgs{key: $key, contentBody: $contentBody}';
  }
}
