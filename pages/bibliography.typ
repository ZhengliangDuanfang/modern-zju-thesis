#import "./template-individual.typ": template-individual

#let bibliography-page(bib: auto, individual: auto) = {
  individual(
    strong("参考文献"),
    bib,
    outlined: true,
  )
}
