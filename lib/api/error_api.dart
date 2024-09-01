import 'dart:async';
import 'dart:io';

checkSnapShotError(dynamic error) {
  if (error is SocketException) {
    return '인터넷 연결 없음';
  } else if (error is TimeoutException) {
    return '요청 시간 초과';
  } else if (error is HttpException) {
    return '잘못된 요청';
  } else if (error is FormatException) {
    return '잘못된 포맷';
  } else {
    return '알 수 없는 오류';
  }
}
