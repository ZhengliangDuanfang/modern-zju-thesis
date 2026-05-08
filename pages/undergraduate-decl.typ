#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
// #import "./template-individual.typ": template-individual
#import "../utils/twoside.typ": twoside-pagebreak, twoside-emptypage

#let undergraduate-decl() = {
  
  context {
    twoside-pagebreak
    set underline(offset: 0.2em)
    align(
      center,
      text(size: 字号.三号, weight: "bold")[
        #show heading: x => text(x.body, ..(size: 字号.三号, font: 字体.仿宋))
        #v(0.5em)
        #heading("毕业论文（设计）原创性声明", numbering: none, level: 1, outlined: false)
        #v(0.7em)],
    )

    block(width: 97%)[
      #set par(justify: true, leading: 1.5em)
      #set text(..(size: 字号.四号, ))
      本人郑重声明：所呈交的毕业论文（设计）是本人在导师的指导下，严格按照学校和学院有关规定完成的，不存在学术不端行为。除文中特别加以标注和致谢的地方外，本论文（设计）不包含其他个人或集体已经发表或撰写过的研究成果，也不包含为获得#underline([ *浙江大学* ])或其他教育机构的学位或证书而使用过的材料。对本研究做出贡献的个人和集体，均已在文中明确说明并表示谢意。

      #align(center)[
        #table(
          columns: (4fr, 8fr, 5fr),
          align: (start, right, right),
          stroke: none,
          row-gutter: 0.75em,
          [], [ 毕业论文（设计）作者签名： ], [],
          [], [ 签字日期： ], [ 年#h(1.5em)月#h(1.5em)日],
        )
      ]
    ]
    v(1fr)

    align(
      center,
      text(size: 字号.三号, weight: "bold")[
        #show heading: x => text(x.body, ..(size: 字号.三号, font: 字体.仿宋))
        #v(0.5em)
        #heading("毕业论文（设计）使用授权书", numbering: none, level: 1, outlined: false)
        #v(0.7em)],
    )
    block(width: 97%)[
      #set par(justify: true, leading: 1.5em)
      #set text(..(size: 字号.四号, ))
      本人完全了解#underline([ *浙江大学* ])有权保留并向国家有关部门或机构送交本论文（设计）的复印件和电子版，允许本论文（设计）被查阅和借阅。本人授权#underline([ *浙江大学* ])可以将本论文（设计）的全部或部分内容编入有关数据库进行检索和传播，可以采用影印、缩印或扫描等复制手段保存、汇编本论文（设计）。
      #v(0.5em)
      （涉密毕业论文（设计）在解密后适用本授权书。）
      #v(1.5em)
      #align(center)[
        #table(
          columns: (45%, 1fr, 45%),
          align: (start, right, center),
          stroke: none,
          row-gutter: 1em,
          [ 毕业论文（设计）作者签名： ], [], [导师签名：],
          [ 签字日期：#h(1.5em)年#h(1.5em)月#h(1.5em)日 ], [], [签字日期：#h(1.5em)年#h(1.5em)月#h(1.5em)日],
        )
      ]
      #v(12pt)
    ]
    twoside-emptypage

  }
}
