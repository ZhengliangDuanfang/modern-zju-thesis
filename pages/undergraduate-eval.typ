#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
#import "./template-individual.typ": template-individual
#import "../utils/twoside.typ": *

#let undergraduate-eval(scores: none, comment) = {
  template-individual("毕  业  论  文（设计）考  核", alter-pagetitle: "本科生毕业论文（设计）考核表", outlined: true, insert-emptypage: true, titletext-settings: (size: 字号.小二, font: 字体.仿宋), title-bottom: 0pt)[
    #set text(size: 字号.小四)
    #grid(
      columns: (1fr, 16pt),
      [
    #h(-2em)#text(size: 字号.四号)[#strong[一、指导教师对毕业论文（设计）的评语：<mzt:no-header-footer>]]

    #comment

    #v(8.5em)
    #strong(
      align(right)[
        指导教师（签名）#box(width: 7.5em, stroke: (bottom: 0.5pt))#h(15pt)\
        年#h(2em)月#h(2em)日#h(15pt)
      ],
    )

    #v(.4em)
    #h(-2em)#text(size: 字号.四号)[#strong[二、答辩小组对毕业论文（设计）的答辩评语及总评成绩：]]
    #v(11.5em)

    #strong[
      // #h(.5em)
      #{
        show grid: it => {
          set text(font: 字体.仿宋, size: 字号.五号)
          it
        }
        grid(
          columns: (.6em, 1fr),
          [],
          grid(
            columns: (55pt, 62pt, 66pt, 66pt, 85pt, 65pt),
            rows: (70pt, 34pt),
            align: left+horizon,
            inset: (x:5pt, y:4pt),
            stroke: .6pt,
            [成绩\ 比例],
            [文献综述/\ 中期报告\ 占（10%）],
            [开题报告\ 占（15%）],
            [外文翻译\ 占（5%）],
            [毕业论文(设计)\ 质量及答辩\ 占（70%）],
            [总评成绩],

            [#h(2pt)分值], ..(
              if scores == none {
                ()
              } else {
                (
                  [#scores.at(0)],
                  [#scores.at(1)],
                  [#scores.at(2)],
                  [#scores.at(3)],
                  [#scores.sum()],
                )
              }
            )
          )
        )
      }
      #v(1.5em)
      #align(right)[
        答辩小组负责人（签名）#box(width: 6em, stroke: (bottom: 0.5pt))#h(15pt)\
        年#h(2em)月#h(2em)日#h(15pt)
      ]
    ]],[])
  ]
}
