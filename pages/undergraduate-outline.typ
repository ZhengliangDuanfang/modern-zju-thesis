#import "./template-individual.typ": template-individual
#import "../utils/fonts.typ": 字体, 字号

#let undergraduate-first-outline(
  title: "目录",
  titlelevel: 2,
  outlined: false,
  bodytext-settings: (size: 字号.四号, font: 字体.仿宋),
  titletext-settings: (
    size: 字号.小三,
    font: 字体.仿宋,
  ),
  ..args,
) = {
  template-individual(
  outlined: outlined,
  titlelevel: titlelevel,
  bodytext-settings: bodytext-settings,
  titletext-settings: titletext-settings,
  text(size: 字号.三号, font: 字体.仿宋, title),
  context {
    let main-chapters = query(
      heading
        .where(
          outlined: true,
        )
        .before(<end-part-1-main>),
    )
    let secondary-chapters = query(
      heading
        .where(
          outlined: true,
        )
        .after(<end-part-1-main>, inclusive: true)
        .before(<end-part-2-main>),
    )
    let proposal-chapters = query(
      heading
        .where(
          level: 1,
          outlined: true,
        )
        .after(<begin-proposal>)
        .before(<end-proposal>),
    )
    {
      pad(left: 0em)[#text(font: 字体.仿宋, size: 字号.四号, strong("第一部分  毕业论文"))]
      set text(size: 字号.小四)
      for chapter in main-chapters {
        let loc = chapter.location()
        let number = counter(heading).at(loc)
        let nr = numbering(
          loc.page-numbering(),
          ..counter(page).at(loc),
        )
        let body = if chapter.level == 1 {
          text(font: 字体.黑体, strong(chapter.body))
        } else {
          chapter.body
        }
        pad(left: (chapter.level - 1) * 1em)[
          #link(chapter.location())[
            #grid(
              columns: (auto, 10pt, auto, 4pt, 1fr, 4pt, auto),
              number.map(str).join("."), [], body, [], repeat(gap: 0.15em)[.], [], nr,
            )
          ]
        ]
      }
      for chapter in secondary-chapters {
        let loc = chapter.location()
        let number = counter(heading).at(loc)
        let nr = numbering(
          loc.page-numbering(),
          ..counter(page).at(loc),
        )
        pad(left: 0em)[
          #link(chapter.location())[
            #grid(
              columns: (auto, 4pt, 1fr, 4pt, auto),
              text(font: 字体.黑体, strong(chapter.body)), [], repeat(gap: 0.15em)[.], [], nr,
            )
          ]
        ]
      }
      pad(left: 0em)[#grid(
        columns: (auto, 4pt, 1fr),
        text(font: 字体.黑体, strong("《浙江大学本科生毕业论文（设计）任务书》")), [], repeat(gap: 0.15em)[.],
      )]
      pad(left: 0em)[#grid(
        columns: (auto, 4pt, 1fr),
        text(font: 字体.黑体, strong("《浙江大学本科生毕业论文（设计）考核表》")), [], repeat(gap: 0.15em)[.],
      )]
      pad(left: 0em, top: 2pt, bottom: 2pt)[#text(
        font: 字体.仿宋,
        size: 字号.四号,
        strong("第二部分  文献综述和开题报告"),
      )]
      pad(left: 0em)[#grid(
        columns: (auto, 4pt, 1fr),
        text(font: 字体.黑体, strong("文献综述和开题报告封面")), [], repeat(gap: 0.15em)[.],
      )]
      pad(left: 0em)[#grid(
        columns: (auto, 4pt, 1fr),
        text(font: 字体.黑体, strong("指导教师对文献综述和开题报告具体内容要求")), [], repeat(gap: 0.15em)[.],
      )]
      pad(left: 0em)[#grid(
        columns: (auto, 4pt, 1fr, 4pt, auto),
        text(font: 字体.黑体, strong("目录")), [], repeat(gap: 0.15em)[.], [], "I"
      )]
      for chapter in proposal-chapters {
        let loc = chapter.location()
        let number = counter(heading).at(loc)
        let nr = numbering(
          loc.page-numbering(),
          ..counter(page).at(loc),
        )
        pad(left: 0em)[
          #link(chapter.location())[
            #grid(
              columns: (auto, 4pt, 1fr, 4pt, auto),
              chapter.body, [], repeat(gap: 0.15em)[.], [], nr,
            )
          ]
        ]
      }
      pad(left: 0em)[#grid(
        columns: (auto, 4pt, 1fr),
        text(font: 字体.黑体, strong("《浙江大学本科生文献综述和开题报告考核表》")), [], repeat(gap: 0.15em)[.],
      )]
    }
  },
  )
}