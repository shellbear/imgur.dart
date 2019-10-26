part of imgur.models;

/// An abstract class used as a basis for each model.
abstract class BaseModel {
  BaseModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

DateTime _dateTimeFromTimestamp(int ts) =>
    DateTime.fromMillisecondsSinceEpoch(ts);

int _dateTimeToTimestamp(DateTime dt) => dt.millisecondsSinceEpoch;

String voteToString(VoteType vote) => fmtType(vote);

VoteType stringToVote(String input) {
  for (final vote in VoteType.values) {
    if (fmtType(vote) == input) {
      return vote;
    }
  }

  return VoteType.veto;
}

List<Map<String, dynamic>> baseModelListToJson(List<BaseModel> objects) =>
    objects?.map((obj) => obj.toJson())?.toList();
