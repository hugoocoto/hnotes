/* Usage:
 *
 * #import "hnotes.typ": conf, fimage
 * #show: doc => conf(
 *   author: "Hugo Coto Flórez",
 *   mail: "hugo.coto@rai.usc.es",
 *   doc,
 * )
 *
 */

// template config
#let conf(
  author: "",
  mail: "",
  lang: "es",
  index: true,
  figure-index: true,
  bib: "",
  doc,
) = {
  set text(lang: lang)

  // level 1 header is centered and uses smallcaps
  show heading.where(
    level: 1,
  ): it => block(width: 100%)[
    #set align(center)
    #set text(weight: "regular", size: 1.2em)
    #smallcaps(it.body)
    #v(2em)
  ]

  // each level 2 header in a different page
  let h2-counter = counter("h2-counter")
  show heading.where(level: 2): it => {
    context {
      if h2-counter.get().first() > 0 {
        pagebreak()
      }
    }
    h2-counter.step()
    [#{ h2-counter.get().first() + 1 }. ]
    [#it.body]
  }

  // code blocks
  show raw.where(block: true): it => block(
    width: 100%,
    fill: luma(95%),
    inset: 1em,
    breakable: false,
  )[#it.lang#it]

  // underline links
  show link: it => [#underline(it)]

  // name(mail) and `1 de 1` at the bottom
  set page(footer: context [
    #author (#link("mailto:" + mail))
    #h(1fr)
    #counter(page).display("1 de 1", both: true)
  ])

  // rest of the document
  [#doc]
  if index or figure-index [#pagebreak()]
  if index [#outline()]
  if figure-index [#outline(
    title: [Lista de figuras],
    target: figure,
  )]

  if bib.len() > 0 [#bibliography(bib)]
}

// image inside a figure
#let fimage(path, cap, ..attrs) = [#figure(image(path, ..attrs), caption: [#cap])]

