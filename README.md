# Hnotes

Typst Template 

## Features
- Center 1 level header
- Name and mail in the footer
- Page number in the footer
- One level 2 header per page
- Pretty code blocks
- Content index
- Figure index
- Bibliography

## Usage
```typ
#import "hnotes.typ": conf, fimage
#show: doc => conf(
  author: "Hugo Coto Flórez",
  mail: "me@hugocoto.com",
  doc,
)
```

### Options
```typ
#conf(
  author: "", // Author name
  mail: "", // Author mail
  lang: "es", // document language
  index: true, // add (or not) content index 
  figure-index: true, // add (or not) figure index
  bib: "", // bibliography file (or none)
  doc,
)
```
