#import "../utils/fonts.typ": 字号, 字体
#import "../utils/datetime-display.typ": datetime-display
#import "./template-individual.typ": template-individual

#let undergraduate-proposal-eval(
  comment,
  comment-college,
  scores-supervisor: none,
  scores-college: none,
) = {
  template-individual(
    "毕业论文（设计）文献综述和开题报告考核", 
    outlined: true, 
    insert-emptypage: true,
    titletext-settings: (size: 字号.三号, font: 字体.仿宋),
    )[
    #set text(size: 字号.小四)
    #h(-2em)#text(size: 字号.四号)[*导师对开题报告、外文翻译和文献综述的评语及成绩评定：*]<mzt:no-header-footer>\

    #comment

    #v(1fr)
    #align(right)[
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
              columns: (80pt, 66pt, 66pt, 66pt),
              rows: (40pt, 35pt),
              align: left+horizon,
              inset: (x:5pt, y:4pt),
              stroke: .6pt,
              text(size: 字号.四号)[成绩比例], [文献综述#linebreak() （10%）], [开题报告#linebreak()（15%）], [外文翻译#linebreak()（5%）],
              text(size: 字号.四号)[分 值], ..(
                if scores-supervisor == none {
                  ()
                } else {
                  (
                    [#scores-supervisor.at(0)],
                    [#scores-supervisor.at(1)],
                    [#scores-supervisor.at(2)],
                  )
                }
              )
            )
          )
        }
        #v(1.5em)
        #align(right)[
          导师签名#box(width: 6em, stroke: (bottom: 0.5pt))#h(15pt)
          
          年#h(2em)月#h(2em)日#h(30pt)
        ]
      ]
    ]

    #v(2.5em)
    #h(-2em)#text(size: 字号.四号)[*学院盲审专家对开题报告、外文翻译和文献综述的评语及成绩评定：*]

    #text(size: 字号.小四)[#comment-college]

    #v(1fr)
    #align(right)[
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
              columns: (80pt, 66pt, 66pt, 66pt),
              rows: (40pt, 35pt),
              align: left+horizon,
              inset: (x:5pt, y:4pt),
              stroke: .6pt,
              text(size: 字号.四号)[成绩比例], [文献综述#linebreak() （10%）], [开题报告#linebreak()（15%）], [外文翻译#linebreak()（5%）],
              text(size: 字号.四号)[分 值], ..(
                if scores-supervisor == none {
                  ()
                } else {
                  (
                    [#scores-supervisor.at(0)],
                    [#scores-supervisor.at(1)],
                    [#scores-supervisor.at(2)],
                  )
                }
              )
            )
          )
        }
        #v(1.5em)
        #align(right)[
          开题报告审核负责人（签名/签章）#box(width: 6em, stroke: (bottom: 0.5pt))#h(15pt)
          
          年#h(2em)月#h(2em)日#h(30pt)
        ]
      ]
    ]
  ]
}
