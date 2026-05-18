#import "../utils/fonts.typ": 字体, 字号
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/twoside.typ": twoside-pagebreak, twoside-emptypage

#let template-individual(
  outlined: false,
  indent-first-par: true,
  insert-emptypage: false,
  titlelevel: 2,
  titletext-settings: (size: 字号.小三, font: 字体.仿宋),
  bodytext-settings: (size: 字号.四号),
  title-upedge: 0pt,
  title-bottom: 1em,
  alter-pagetitle: none, 
  pagetitle,
  s,
) = {
  let outline-pagetitle = if alter-pagetitle != none {
    alter-pagetitle
  } else {
    pagetitle
  }

  context {
    twoside-pagebreak

    align(
      center,
      text(size: titletext-settings.size, weight: "bold")[
        #show heading: x => text(pagetitle, ..titletext-settings)
        #v(title-upedge)
        #heading(outline-pagetitle, numbering: none, level: 1, outlined: outlined)
        #v(title-bottom)],
    )

    block(width: 100%)[
      #set par(justify: true)
      #set text(..bodytext-settings)
      #s
    ]

    if insert-emptypage {
      twoside-emptypage
    }else{
      twoside-pagebreak
    }
  }
}
