Rmarkdown Styling Refernce for myself
================
Taehoon Ha
11/30/2018

### Choose Output

Write YAML header that explains what thype of document to build from your R markdown file.

| Output command          | Output type               |
|-------------------------|---------------------------|
| `html_document`         | HTML file (web page)      |
| `pdf_document`          | pdf document              |
| `word_document`         | Microsoft word document   |
| `beamer_presentation`   | beamer slideshow (pdf)    |
| `ioslides_presentation` | ioslides slideshow (html) |

<br><br><br><br>

### Basic grammar

| Option                           | Command           |
|:---------------------------------|:------------------|
| horizontal rule (or slide break) | \*\*\*            |
| endash                           | --                |
| emdash                           | ---               |
| image                            | `![](directory)`  |
| link                             | `[](web address)` |

<br><br><br><br>

### Customize R code chunks

| Option             | Display Code | Run Code | Display Result |
|--------------------|--------------|----------|----------------|
| `echo = FALSE`     | No           | Yes      | Yes            |
| `eval = FALSE`     | Yes          | No       | No             |
| `results = 'hide'` | Yes          | Yes      | No             |

-   `message = FALSE`: to remove a message in the output after a chunk is executed.
-   `warning = FALSE`: to remove only warning message in the output.
-   `error = FALSE`: to remove the error message in the output.
-   `tidy = TRUE`: reformat code in a tidy way when displaying it
-   `results =`: results "markup" "markup", "asis", "hold", or "hide"
-   `comment = "##"` : Comment character to preface results with
-   Control the size of the figures
    -   `fig.height =`
    -   `fig.width =`
