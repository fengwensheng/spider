# 爬虫项目

这是一个前后端全栈项目。

1. 后端使用Dart实现，爬取个人博客网站数据，为前端提供相应API接口。
2. 前端使用Flutter实现，展示后端爬取到的数据。

## Dart后端项目创建

需要使用Dart SDK提供的命令行工具创建项目目录结构，对应的命令为`dart`。使用`dart --help`查看所有可使用的命令。

其中`dart create`用以创建项目，使用`dart help create`查看其使用帮助，及所有可用参数。`-t`表示指定项目类型，这里要创建命令行工具应用，则使用`console`参数值。

故，有Dart后端项目创建命令，如下：

```shell
dart create dart_spider -t console
```

生成的项目目录结构，如下：

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

运行项目：

```shell
dart bin/dart_spider.dart
```

## 添加Dart项目依赖

在pubspec.yaml文件中添加Dart项目远程库依赖。在vs code中保存文件自动拉取依赖，或在Dart项目根目录路径下使用`dart pub get`命令。

1. http。用作网络请求库。
2. html。用以解析http语法。

## 爬虫类设计

所谓爬虫，是用代码自动化访问网页。关键在于模拟用户访问行为，欺骗浏览器。主要有2个入参。

1. user-agent。伪造用户身份。整个应用内不变，设为成员变量。
2. url。所要访问的目标网页地址，设为类的实例方法入参。

将入参作为json格式配置文件，与源代码分隔开，通过Dart SDK读取文件，再decode为`Map<String, String>`格式的json表示。

## 爬虫实现原理

1. 发起Http请求，获取Response响应数据。
2. 解析Html语法，主要通过CSS选择器或正则。

## 具体实现注意点

1. Html解析时部分元素可能为空，要判空。
2. 构造爬虫数据实体类，进行数据封装。