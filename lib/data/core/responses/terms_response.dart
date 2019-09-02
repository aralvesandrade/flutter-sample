class TermsResponse {
  final String content;

  TermsResponse(this.content);

  TermsResponse.fromJson(Map<String, dynamic> json) : content = json['content'];
}
