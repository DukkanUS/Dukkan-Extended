// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  static String m0(limit) => "무료 버전에는 ${limit}x 이미지 검색만 있습니다.";

  static String m1(limit) => "최대 ${limit} 개의 메시지는 무료 버전에서만 표시될 수 있습니다.";

  static String m2(date) => "구독 만료일 ${date}";

  static String m3(number) =>
      "생성(${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("약"),
        "apply": MessageLookupByLibrary.simpleMessage("대다"),
        "artist": MessageLookupByLibrary.simpleMessage("예술가"),
        "cancel": MessageLookupByLibrary.simpleMessage("취소"),
        "chat": MessageLookupByLibrary.simpleMessage("잡담"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("채팅 세부정보"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("채팅 GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("봇과 채팅"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage("이미지의 아티스트 선택"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage("이미지 세부 정보 선택"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage("이미지의 매체 선택"),
        "chooseMood": MessageLookupByLibrary.simpleMessage("이미지의 분위기를 선택하세요"),
        "chooseUseCase": MessageLookupByLibrary.simpleMessage("사용 사례 선택"),
        "choseStyle": MessageLookupByLibrary.simpleMessage("이미지 스타일 선택"),
        "clear": MessageLookupByLibrary.simpleMessage("명확한"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage("콘텐츠를 삭제하시겠습니까?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("콘텐츠 지우기"),
        "clearConversation": MessageLookupByLibrary.simpleMessage("명확한 대화"),
        "confirm": MessageLookupByLibrary.simpleMessage("확인"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "이 항목의 삭제를 계속하려면 확인하십시오. 이 작업은 실행취소할 수 없습니다."),
        "confirmDeleteItem":
            MessageLookupByLibrary.simpleMessage("이 항목을 삭제 하시겠습니까?"),
        "confirmRemoveKey":
            MessageLookupByLibrary.simpleMessage("키를 제거하시겠습니까?"),
        "copiedToClipboard":
            MessageLookupByLibrary.simpleMessage("클립보드에 복사된 내용"),
        "copy": MessageLookupByLibrary.simpleMessage("부"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage("채팅 만들기 실패"),
        "delete": MessageLookupByLibrary.simpleMessage("지우다"),
        "deleteFailed": MessageLookupByLibrary.simpleMessage("삭제 실패"),
        "detail": MessageLookupByLibrary.simpleMessage("세부 묘사"),
        "download": MessageLookupByLibrary.simpleMessage("다운로드"),
        "edit": MessageLookupByLibrary.simpleMessage("편집하다"),
        "failedToGenerate": MessageLookupByLibrary.simpleMessage("생성 실패"),
        "generate": MessageLookupByLibrary.simpleMessage("일으키다"),
        "grid": MessageLookupByLibrary.simpleMessage("그리드"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("이미지 생성"),
        "imageSize": MessageLookupByLibrary.simpleMessage("이미지 크기"),
        "inputKey": MessageLookupByLibrary.simpleMessage("입력 키"),
        "interest": MessageLookupByLibrary.simpleMessage("관심"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "API 키는 모바일에 로컬로 저장되며 다른 곳으로 전송되지 않습니다. 나중에 사용할 수 있도록 키를 저장할 수 있습니다. 키를 더 이상 사용하지 않으려면 키를 제거할 수도 있습니다."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("유효하지 않은 키"),
        "jobRole": MessageLookupByLibrary.simpleMessage("직무"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("직업 기술"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("레이아웃 스타일"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("청취..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage("키 로드 실패"),
        "loadKeySuccess": MessageLookupByLibrary.simpleMessage("키 성공 로드"),
        "manage": MessageLookupByLibrary.simpleMessage("꾸리다"),
        "medium": MessageLookupByLibrary.simpleMessage("매질"),
        "mood": MessageLookupByLibrary.simpleMessage("분위기"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("더 많은 옵션"),
        "newChat": MessageLookupByLibrary.simpleMessage("새 채팅"),
        "noImageGenerate": MessageLookupByLibrary.simpleMessage("이미지 생성 없음"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("이미지 수"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "생성할 이미지 수입니다. 1에서 10 사이여야 합니다."),
        "options": MessageLookupByLibrary.simpleMessage("옵션"),
        "page": MessageLookupByLibrary.simpleMessage("페이지"),
        "pleaseCheckConnection":
            MessageLookupByLibrary.simpleMessage("연결을 확인하고 다시 시도하십시오!"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("모든 칸을 채워주세요"),
        "pleaseInputKey": MessageLookupByLibrary.simpleMessage("키를 입력하세요"),
        "prompt": MessageLookupByLibrary.simpleMessage("신속한"),
        "putKeyHere": MessageLookupByLibrary.simpleMessage("여기에 열쇠를 두세요"),
        "regenerateResponse": MessageLookupByLibrary.simpleMessage("응답 재생성"),
        "remaining": MessageLookupByLibrary.simpleMessage("남은"),
        "remove": MessageLookupByLibrary.simpleMessage("풀다"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage("키 제거 실패"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("키를 성공적으로 제거했습니다."),
        "reset": MessageLookupByLibrary.simpleMessage("다시 놓기"),
        "resetSettings": MessageLookupByLibrary.simpleMessage("설정 재설정"),
        "save": MessageLookupByLibrary.simpleMessage("구하다"),
        "saveKey": MessageLookupByLibrary.simpleMessage("키 저장"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage("키 저장 실패"),
        "saveKeySuccess": MessageLookupByLibrary.simpleMessage("성공적으로 저장된 키"),
        "searchByPrompt": MessageLookupByLibrary.simpleMessage("프롬프트로 검색..."),
        "sectionKeywords": MessageLookupByLibrary.simpleMessage("섹션 키워드"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("섹션 주제"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage("채팅 선택 실패"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("프롬프트 선택"),
        "settings": MessageLookupByLibrary.simpleMessage("설정"),
        "share": MessageLookupByLibrary.simpleMessage("몫"),
        "skills": MessageLookupByLibrary.simpleMessage("기술"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("뭔가 잘못됐어!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "문제가 발생했습니다. 나중에 다시 시도 해주십시오. 매우 감사합니다!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("음성을 사용할 수 없음"),
        "style": MessageLookupByLibrary.simpleMessage("스타일"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk":
            MessageLookupByLibrary.simpleMessage("말하려면 마이크를 탭하세요."),
        "textGenerate": MessageLookupByLibrary.simpleMessage("텍스트 생성"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("텍스트 생성기"),
        "timeGenerate": m3,
        "typeAMessage": MessageLookupByLibrary.simpleMessage("메시지를 입력하십시오 ..."),
        "view": MessageLookupByLibrary.simpleMessage("전망"),
        "viewType": MessageLookupByLibrary.simpleMessage("보기 유형"),
        "write": MessageLookupByLibrary.simpleMessage("쓰다")
      };
}
