class MockData {
  int delayTime = 2;

  Map<String, dynamic> genericSuccess() {
    return {};
  }

  Map<String, dynamic> exampleMock() {
    return {
      "message": "exampleMock",
      "code": "1",
    };
  }
}