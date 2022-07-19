# 爬虫项目

这是一个前后端全栈项目。

1. 后端使用Dart实现，爬取个人博客网站数据，为前端提供相应API接口。
2. 前端使用Flutter实现，展示后端爬取到的数据。

## Dart后端项目创建

需要使用Dart SDK提供的命令行工具创建项目目录结构，对应的命令为`dart`。使用`dart --help`查看所有可使用的命令。

其中`dart create`用以创建项目，使用`dart help create`查看其使用帮助，及所有可用参数。`-t`表示指定项目类型，这里要创建命令行工具应用，则使用`console`参数值。

故，有Dart后端项目创建命令，如下。

```shell
dart create dart_spider -t console
```

生成项目的目录结构，如下。

```markdown
dart_spider
├── CHANGELOG.md
├── README.md
├── analysis_options.yaml
├── bin
│   └── dart_spider.dart
├── lib
│   └── dart_spider.dart
├── pubspec.lock
├── pubspec.yaml
└── test
    └── dart_spider_test.dart
```

