import 'package:base_flutter/model/author.dart';
import 'package:base_flutter/model/category.dart';
import 'package:base_flutter/model/chap.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import 'package:dartx/dartx.dart';

class Manga {
  String? name;
  String? url;
  String? image;
  String? content;
  String? updaterAt;
  bool bookMark = false;
  List<Category>? categories;
  List<Author>? authors;
  List<Chap>? chapter;

  Manga({
    this.name,
    this.url,
    this.content,
    this.updaterAt,
    this.image,
    this.bookMark = false,
    this.categories,
    this.authors,
    this.chapter,
  });

  static List<Manga> fromHtmlToMangas(String map) {
    var document = parse(map);

    List<Manga> mangas = [];

    var list = document.querySelectorAll('.items .item');
    list.forEach((e) {
      var jtip = e.querySelector('.jtip');
      var chapters = e.querySelectorAll('.chapter.clearfix');

      var image = e.querySelector('img')!.attributes['data-original'];
      var name = jtip != null ? jtip.text : '';
      var url = jtip != null ? jtip.attributes['href'] : '';

      var listChapter = chapters.map((chapter) {
        var aTagChapter = chapter.querySelector('a');
        var nameChapter = aTagChapter != null ? aTagChapter.text : '';
        var urlChapter =
            aTagChapter != null ? aTagChapter.attributes['href'] : '';
        var time = chapter.querySelector('.time')!.text;
        return Chap(name: nameChapter, url: urlChapter, time: time);
      }).toList();

      var manga = Manga(
        name: name,
        url: url,
        chapter: listChapter,
        image: image,
      );

      mangas.add(manga);
    });

    return mangas;
  }

  static Manga fromHtmlToManga(String map) {
    var document = parse(map);

    Manga manga = Manga();

    // var list = document.querySelectorAll('.items .item');
    // list.forEach((e) {
    //   var jtip = e.querySelector('.jtip');
    //   var chapters = e.querySelectorAll('.chapter.clearfix');
    //
    //   var image = e.querySelector('img')!.attributes['data-original'];
    //   var name = jtip != null ? jtip.text : '';
    //   var url = jtip != null ? jtip.attributes['href'] : '';
    //
    //   var listChapter = chapters.map((chapter) {
    //     var aTagChapter = chapter.querySelector('a');
    //     var nameChapter = aTagChapter != null ? aTagChapter.text : '';
    //     var urlChapter =
    //         aTagChapter != null ? aTagChapter.attributes['href'] : '';
    //     var time = chapter.querySelector('.time')!.text;
    //     return Chap(name: nameChapter, url: urlChapter, time: time);
    //   }).toList();
    //
    //   var manga = Manga(
    //     name: name,
    //     url: url,
    //     chapter: listChapter,
    //     image: image,
    //   );
    //
    //   mangas.add(manga);
    // });

    return manga;
  }
}
