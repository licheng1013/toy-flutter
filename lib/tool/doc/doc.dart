import 'dart:convert';

class Doc {
  // 接口名,一般来说是方法名
  String name = "";

  // 接口描述
  String desc = "";

  // 请求方式
  String method = "";

  // 请求地址
  String url = "";

  // 请求参数
  List<Param> params = [];

  // 返回参数
  List<Param> returns = [];

  // 反序列化
  Doc.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    desc = json['desc'] ?? "";
    method = json['method'] ?? "";
    url = json['url'] ?? "";
    if (json['params'] != null) {
      json['params'].forEach((v) {
        params.add(Param.fromJson(v));
      });
    }
    if (json['returns'] != null) {
      json['returns'].forEach((v) {
        returns.add(Param.fromJson(v));
      });
    }
  }
}

class Param {
  // 参数名
  String name = "";

  // 参数类型
  String type = "";

  // 参数描述
  String desc = "";

  // 是否必须
  bool required = false;

  // 默认值
  String defaultValue = "";

  // 反序列化
  Param.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    type = json['type'] ?? "";
    desc = json['desc'] ?? "";
    required = json['required'] ?? false;
    defaultValue = json['defaultValue'] ?? "";
  }
}

class Group {
  // 分组名
  String name = "";

  // 分组描述
  String desc = "";

  // 分组接口列表
  List<Doc> docList = [];

  // 反序列化
  Group.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    desc = json['desc'] ?? "";
    if (json['docList'] != null) {
      json['docList'].forEach((v) {
        docList.add(Doc.fromJson(v));
      });
    }
  }
}

class Md {
  // 项目名称
  String name = "";

  // 项目接口列表
  List<Group> docList = [];

  // 反序列化
  Md.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    if (json['docList'] != null) {
      json['docList'].forEach((v) {
        docList.add(Group.fromJson(v));
      });
    }
  }
}

// 构建接口文档
String buildMd(String json) {
  try {
    jsonDecode(json);
  } catch (e) {
    print(e);
    return json;
  }

  var md = Md.fromJson(jsonDecode(json));
  var sb = StringBuffer();
  sb.writeln("# ${md.name}");
  sb.writeln("");
  for (var group in md.docList) {
    sb.writeln("## ${group.name}");
    if (group.desc.isNotEmpty) {
      sb.writeln("- ${group.desc}");
    }
    for (var doc in group.docList) {
      sb.writeln(buildGroupDoc(doc));
    }
  }
  return sb.toString();
}

String buildGroupDoc(Doc doc) {
  var sb = StringBuffer();
  sb.writeln("### ${doc.name}");
  sb.writeln("- 请求方式 ${doc.method} 请求路径 ${doc.url}");
  sb.writeln("- 描述 ${doc.desc}");
  if (doc.params.isNotEmpty) {
    sb.writeln("- 请求参数");
    sb.writeln("");
    sb.writeln("|参数名|参数类型|是否必须|默认值|描述|");
    sb.writeln("|:---|:---|:---|:---|:---|");
    for (var param in doc.params) {
      sb.writeln(
          "|${param.name}|${param.type}|${param.required}|${param.defaultValue}|${param.desc}|");
    }
    sb.writeln("");
  }
  if (doc.returns.isNotEmpty) {
    sb.writeln("- 返回参数");
    sb.writeln("");
    sb.writeln("|参数名|参数类型|是否必须|默认值|描述|");
    sb.writeln("|:---|:---|:---|:---|:---|");
    for (var param in doc.returns) {
      sb.writeln(
          "|${param.name}|${param.type}|${param.required}|${param.defaultValue}|${param.desc}|");
    }
    sb.writeln("");
  }
  return sb.toString();
}
