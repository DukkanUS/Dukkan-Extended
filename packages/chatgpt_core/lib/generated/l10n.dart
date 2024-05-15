// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm if you wish to proceed with the deletion of this item. You can't undo this action.`
  String get confirmDelete {
    return Intl.message(
      'Please confirm if you wish to proceed with the deletion of this item. You can\'t undo this action.',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you wish to delete this item?`
  String get confirmDeleteItem {
    return Intl.message(
      'Are you sure you wish to delete this item?',
      name: 'confirmDeleteItem',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Regenerate response`
  String get regenerateResponse {
    return Intl.message(
      'Regenerate response',
      name: 'regenerateResponse',
      desc: '',
      args: [],
    );
  }

  /// `Clear conversation`
  String get clearConversation {
    return Intl.message(
      'Clear conversation',
      name: 'clearConversation',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `Copied content to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'Copied content to clipboard',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Listening...`
  String get listening {
    return Intl.message(
      'Listening...',
      name: 'listening',
      desc: '',
      args: [],
    );
  }

  /// `Type a message...`
  String get typeAMessage {
    return Intl.message(
      'Type a message...',
      name: 'typeAMessage',
      desc: '',
      args: [],
    );
  }

  /// `Speech not available`
  String get speechNotAvailable {
    return Intl.message(
      'Speech not available',
      name: 'speechNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Tap the mic to talk`
  String get tapTheMicToTalk {
    return Intl.message(
      'Tap the mic to talk',
      name: 'tapTheMicToTalk',
      desc: '',
      args: [],
    );
  }

  /// `Chat with Bot`
  String get chatWithBot {
    return Intl.message(
      'Chat with Bot',
      name: 'chatWithBot',
      desc: '',
      args: [],
    );
  }

  /// `Image generate`
  String get imageGenerate {
    return Intl.message(
      'Image generate',
      name: 'imageGenerate',
      desc: '',
      args: [],
    );
  }

  /// `Text generate`
  String get textGenerate {
    return Intl.message(
      'Text generate',
      name: 'textGenerate',
      desc: '',
      args: [],
    );
  }

  /// `Options`
  String get options {
    return Intl.message(
      'Options',
      name: 'options',
      desc: '',
      args: [],
    );
  }

  /// `Image size`
  String get imageSize {
    return Intl.message(
      'Image size',
      name: 'imageSize',
      desc: '',
      args: [],
    );
  }

  /// `View type`
  String get viewType {
    return Intl.message(
      'View type',
      name: 'viewType',
      desc: '',
      args: [],
    );
  }

  /// `No image generate`
  String get noImageGenerate {
    return Intl.message(
      'No image generate',
      name: 'noImageGenerate',
      desc: '',
      args: [],
    );
  }

  /// `More options`
  String get moreOptions {
    return Intl.message(
      'More options',
      name: 'moreOptions',
      desc: '',
      args: [],
    );
  }

  /// `Generate`
  String get generate {
    return Intl.message(
      'Generate',
      name: 'generate',
      desc: '',
      args: [],
    );
  }

  /// `Up to {limit} messages can only be displayed in the free version.`
  String limitTheText(Object limit) {
    return Intl.message(
      'Up to $limit messages can only be displayed in the free version.',
      name: 'limitTheText',
      desc: '',
      args: [limit],
    );
  }

  /// `There is only {limit}x image search in the free version.`
  String limitImage(Object limit) {
    return Intl.message(
      'There is only ${limit}x image search in the free version.',
      name: 'limitImage',
      desc: '',
      args: [limit],
    );
  }

  /// `Something went wrong! Please try again later. Thank you so much!`
  String get somethingWhenWrong {
    return Intl.message(
      'Something went wrong! Please try again later. Thank you so much!',
      name: 'somethingWhenWrong',
      desc: '',
      args: [],
    );
  }

  /// `Page`
  String get page {
    return Intl.message(
      'Page',
      name: 'page',
      desc: '',
      args: [],
    );
  }

  /// `Grid`
  String get grid {
    return Intl.message(
      'Grid',
      name: 'grid',
      desc: '',
      args: [],
    );
  }

  /// `Number of images`
  String get numberOfImages {
    return Intl.message(
      'Number of images',
      name: 'numberOfImages',
      desc: '',
      args: [],
    );
  }

  /// `The number of images to generate. Must be between 1 and 10.`
  String get numberOfImagesCondition {
    return Intl.message(
      'The number of images to generate. Must be between 1 and 10.',
      name: 'numberOfImagesCondition',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all fields`
  String get pleaseInputFillAllFields {
    return Intl.message(
      'Please fill in all fields',
      name: 'pleaseInputFillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Failed to generate`
  String get failedToGenerate {
    return Intl.message(
      'Failed to generate',
      name: 'failedToGenerate',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Please check your connection and try again!`
  String get pleaseCheckConnection {
    return Intl.message(
      'Please check your connection and try again!',
      name: 'pleaseCheckConnection',
      desc: '',
      args: [],
    );
  }

  /// `Clear content`
  String get clearContent {
    return Intl.message(
      'Clear content',
      name: 'clearContent',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to clear content?`
  String get clearConfirm {
    return Intl.message(
      'Are you sure to clear content?',
      name: 'clearConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Choose use case`
  String get chooseUseCase {
    return Intl.message(
      'Choose use case',
      name: 'chooseUseCase',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Write`
  String get write {
    return Intl.message(
      'Write',
      name: 'write',
      desc: '',
      args: [],
    );
  }

  /// `Style`
  String get style {
    return Intl.message(
      'Style',
      name: 'style',
      desc: '',
      args: [],
    );
  }

  /// `Choose style for your image`
  String get choseStyle {
    return Intl.message(
      'Choose style for your image',
      name: 'choseStyle',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Choose medium for your image`
  String get chooseMedium {
    return Intl.message(
      'Choose medium for your image',
      name: 'chooseMedium',
      desc: '',
      args: [],
    );
  }

  /// `Mood`
  String get mood {
    return Intl.message(
      'Mood',
      name: 'mood',
      desc: '',
      args: [],
    );
  }

  /// `Choose mood for your image`
  String get chooseMood {
    return Intl.message(
      'Choose mood for your image',
      name: 'chooseMood',
      desc: '',
      args: [],
    );
  }

  /// `Artist`
  String get artist {
    return Intl.message(
      'Artist',
      name: 'artist',
      desc: '',
      args: [],
    );
  }

  /// `Choose artist for your image`
  String get chooseArtist {
    return Intl.message(
      'Choose artist for your image',
      name: 'chooseArtist',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get detail {
    return Intl.message(
      'Detail',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Choose detail for your image`
  String get chooseDetail {
    return Intl.message(
      'Choose detail for your image',
      name: 'chooseDetail',
      desc: '',
      args: [],
    );
  }

  /// `Reset Settings`
  String get resetSettings {
    return Intl.message(
      'Reset Settings',
      name: 'resetSettings',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Search by Prompt...`
  String get searchByPrompt {
    return Intl.message(
      'Search by Prompt...',
      name: 'searchByPrompt',
      desc: '',
      args: [],
    );
  }

  /// `New Chat`
  String get newChat {
    return Intl.message(
      'New Chat',
      name: 'newChat',
      desc: '',
      args: [],
    );
  }

  /// `Layout Style`
  String get layoutStyle {
    return Intl.message(
      'Layout Style',
      name: 'layoutStyle',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Text Generator`
  String get textGenerator {
    return Intl.message(
      'Text Generator',
      name: 'textGenerator',
      desc: '',
      args: [],
    );
  }

  /// `Chat Detail`
  String get chatDetail {
    return Intl.message(
      'Chat Detail',
      name: 'chatDetail',
      desc: '',
      args: [],
    );
  }

  /// `Delete Failed`
  String get deleteFailed {
    return Intl.message(
      'Delete Failed',
      name: 'deleteFailed',
      desc: '',
      args: [],
    );
  }

  /// `Select Prompt`
  String get selectPrompt {
    return Intl.message(
      'Select Prompt',
      name: 'selectPrompt',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Section Topic`
  String get sectionTopic {
    return Intl.message(
      'Section Topic',
      name: 'sectionTopic',
      desc: '',
      args: [],
    );
  }

  /// `Section Keywords`
  String get sectionKeywords {
    return Intl.message(
      'Section Keywords',
      name: 'sectionKeywords',
      desc: '',
      args: [],
    );
  }

  /// `Interest`
  String get interest {
    return Intl.message(
      'Interest',
      name: 'interest',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get skills {
    return Intl.message(
      'Skills',
      name: 'skills',
      desc: '',
      args: [],
    );
  }

  /// `Job Role`
  String get jobRole {
    return Intl.message(
      'Job Role',
      name: 'jobRole',
      desc: '',
      args: [],
    );
  }

  /// `Job Skills`
  String get jobSkills {
    return Intl.message(
      'Job Skills',
      name: 'jobSkills',
      desc: '',
      args: [],
    );
  }

  /// `Prompt`
  String get prompt {
    return Intl.message(
      'Prompt',
      name: 'prompt',
      desc: '',
      args: [],
    );
  }

  /// `ChatGPT`
  String get chatGPT {
    return Intl.message(
      'ChatGPT',
      name: 'chatGPT',
      desc: '',
      args: [],
    );
  }

  /// `Create Chat Failed`
  String get createChatFailed {
    return Intl.message(
      'Create Chat Failed',
      name: 'createChatFailed',
      desc: '',
      args: [],
    );
  }

  /// `Select Chat Failed`
  String get selectChatFailed {
    return Intl.message(
      'Select Chat Failed',
      name: 'selectChatFailed',
      desc: '',
      args: [],
    );
  }

  /// `Save Key Failed`
  String get saveKeyFailed {
    return Intl.message(
      'Save Key Failed',
      name: 'saveKeyFailed',
      desc: '',
      args: [],
    );
  }

  /// `Saved Key Successfully`
  String get saveKeySuccess {
    return Intl.message(
      'Saved Key Successfully',
      name: 'saveKeySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Save Key`
  String get saveKey {
    return Intl.message(
      'Save Key',
      name: 'saveKey',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Key`
  String get invalidKey {
    return Intl.message(
      'Invalid Key',
      name: 'invalidKey',
      desc: '',
      args: [],
    );
  }

  /// `Load Key Failed`
  String get loadKeyFailed {
    return Intl.message(
      'Load Key Failed',
      name: 'loadKeyFailed',
      desc: '',
      args: [],
    );
  }

  /// `Load Key Success`
  String get loadKeySuccess {
    return Intl.message(
      'Load Key Success',
      name: 'loadKeySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Remove Key Failed`
  String get removeKeyFailed {
    return Intl.message(
      'Remove Key Failed',
      name: 'removeKeyFailed',
      desc: '',
      args: [],
    );
  }

  /// `Removed Key Successfully`
  String get removeKeySuccess {
    return Intl.message(
      'Removed Key Successfully',
      name: 'removeKeySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Please input key`
  String get pleaseInputKey {
    return Intl.message(
      'Please input key',
      name: 'pleaseInputKey',
      desc: '',
      args: [],
    );
  }

  /// `Input Key`
  String get inputKey {
    return Intl.message(
      'Input Key',
      name: 'inputKey',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Put your key here`
  String get putKeyHere {
    return Intl.message(
      'Put your key here',
      name: 'putKeyHere',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!!!`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong!!!',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to remove key?`
  String get confirmRemoveKey {
    return Intl.message(
      'Are you sure to remove key?',
      name: 'confirmRemoveKey',
      desc: '',
      args: [],
    );
  }

  /// `Your API Key is stored locally on your mobile and never sent anywhere else. You can save your key to use it later. You can also remove your key if you don't want to use it anymore.`
  String get introAboutKey {
    return Intl.message(
      'Your API Key is stored locally on your mobile and never sent anywhere else. You can save your key to use it later. You can also remove your key if you don\'t want to use it anymore.',
      name: 'introAboutKey',
      desc: '',
      args: [],
    );
  }

  /// `Generate ({number} {number, plural, =1 {time} other {times}})`
  String timeGenerate(num number) {
    return Intl.message(
      'Generate ($number ${Intl.plural(number, one: 'time', other: 'times')})',
      name: 'timeGenerate',
      desc: '',
      args: [number],
    );
  }

  /// `Subscription expired date {date}`
  String subscriptionExpiredDate(Object date) {
    return Intl.message(
      'Subscription expired date $date',
      name: 'subscriptionExpiredDate',
      desc: '',
      args: [date],
    );
  }

  /// `Manage`
  String get manage {
    return Intl.message(
      'Manage',
      name: 'manage',
      desc: '',
      args: [],
    );
  }

  /// `remaining`
  String get remaining {
    return Intl.message(
      'remaining',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send message`
  String get failedToSendMessage {
    return Intl.message(
      'Failed to send message',
      name: 'failedToSendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please input value`
  String get pleaseInputValue {
    return Intl.message(
      'Please input value',
      name: 'pleaseInputValue',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get none {
    return Intl.message(
      'None',
      name: 'none',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'az'),
      Locale.fromSubtags(languageCode: 'bn'),
      Locale.fromSubtags(languageCode: 'bs'),
      Locale.fromSubtags(languageCode: 'cs'),
      Locale.fromSubtags(languageCode: 'da'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'el'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fa'),
      Locale.fromSubtags(languageCode: 'fi'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'he'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'hu'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'kk'),
      Locale.fromSubtags(languageCode: 'km'),
      Locale.fromSubtags(languageCode: 'kn'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'ku'),
      Locale.fromSubtags(languageCode: 'lo'),
      Locale.fromSubtags(languageCode: 'lt'),
      Locale.fromSubtags(languageCode: 'mr'),
      Locale.fromSubtags(languageCode: 'ms'),
      Locale.fromSubtags(languageCode: 'my'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'PT'),
      Locale.fromSubtags(languageCode: 'ro'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'sk'),
      Locale.fromSubtags(languageCode: 'sq'),
      Locale.fromSubtags(languageCode: 'sr'),
      Locale.fromSubtags(languageCode: 'sv'),
      Locale.fromSubtags(languageCode: 'sw'),
      Locale.fromSubtags(languageCode: 'ta'),
      Locale.fromSubtags(languageCode: 'th'),
      Locale.fromSubtags(languageCode: 'ti'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'uk'),
      Locale.fromSubtags(languageCode: 'ur'),
      Locale.fromSubtags(languageCode: 'uz'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
