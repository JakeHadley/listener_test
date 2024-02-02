import 'package:flutter/material.dart';

enum Pages {
  login,
  posts,
  postDetail,
  modifyPost,
  events,
  eventDetail,
  modifyEvent,
  resources,
  network,
  profile,
  profileInfo,
  onboarding
}

class PageData {
  PageData({
    required this.path,
    required this.name,
    required this.label,
    this.icon,
  });

  factory PageData.fromEnum(Pages page) {
    switch (page) {
      case Pages.login:
        return PageData(
          path: '/login',
          name: 'login',
          label: 'Login',
        );
      case Pages.posts:
        return PageData(
          path: '/posts',
          icon: const Icon(Icons.home),
          name: 'posts',
          label: 'Posts',
        );
      case Pages.postDetail:
        return PageData(
          path: '/postDetail',
          name: 'postDetail',
          label: 'Post',
        );
      case Pages.modifyPost:
        return PageData(
          path: '/modifyPost',
          name: 'modifyPost',
          label: 'Modify Post',
        );
      case Pages.events:
        return PageData(
          path: '/events',
          icon: const Icon(Icons.calendar_month_outlined),
          name: 'events',
          label: 'Events',
        );
      case Pages.eventDetail:
        return PageData(
          path: '/eventDetail',
          name: 'eventDetail',
          label: 'Event',
        );
      case Pages.modifyEvent:
        return PageData(
          path: '/modifyEvent',
          name: 'modifyEvent',
          label: 'Modify Event',
        );
      case Pages.resources:
        return PageData(
          path: '/resources',
          icon: const Icon(Icons.bookmark),
          name: 'resources',
          label: 'Resources',
        );
      case Pages.network:
        return PageData(
          path: '/network',
          icon: const Icon(Icons.people),
          name: 'network',
          label: 'Network',
        );
      case Pages.profile:
        return PageData(
          path: '/profile',
          name: 'profile',
          label: 'Profile',
        );
      case Pages.profileInfo:
        return PageData(
          path: '/profileInfo',
          name: 'profileInfo',
          label: 'Profile Info',
        );
      case Pages.onboarding:
        return PageData(
          path: '/onboarding',
          name: 'onboarding',
          label: 'Onboarding',
        );
    }
  }

  final String path;
  final String name;
  final String label;
  final Icon? icon;
}

final pageDataMap = Map.fromEntries(
  Pages.values.map((page) => MapEntry(page, PageData.fromEnum(page))),
);

extension AppPageExtension on Pages {
  String get path => pageDataMap[this]!.path;
  String get label => pageDataMap[this]!.label;
  String get name => pageDataMap[this]!.name;
  Icon? get icon => pageDataMap[this]!.icon;
}
