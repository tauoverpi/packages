(define-module (tau packages haskell)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build utils)
  #:use-module (guix git-download)
  #:use-module (guix build-system haskell)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell))

(define ghc-pgp-wordlist
  (package
    (name "ghc-pgp-wordlist")
    (version "0.1.0.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/pgp-wordlist/pgp-wordlist-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "15g6qh0fb7kjj3l0w8cama7cxgnhnhybw760md9yy7cqfq15cfzg"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-vector" ,ghc-vector)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
        ("ghc-doctest" ,ghc-doctest)))
    (home-page
      "https://github.com/quchen/pgp-wordlist")
    (synopsis
      "Translate between binary data and a human-readable collection of words.")
    (description
      "Translate between binary data and a human-readable collection of words. .
The PGP Word List consists of two phonetic alphabets, each with one word per
possible byte value. A string of bytes is translated with these alphabets,
alternating between them at each byte. . The PGP words corresponding to the
bytes @5B 1D CA 6E@ are \"erase breakaway spellbind headwaters\", for example. .
For further information, see <http://en.wikipedia.org/wiki/PGP_word_list
Wikipedia>.")
    (license license:bsd-3)))

(define ghc-prettyprinter
  (package
    (name "ghc-prettyprinter")
    (version "1.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/prettyprinter/prettyprinter-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "10fphxh8lvdaw7i8jyllwmj87w02db92mf99zfw5vddp9mv6b5rz"))))
    (build-system haskell-build-system)
    (native-inputs
      `(("ghc-doctest" ,ghc-doctest)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-pgp-wordlist" ,ghc-pgp-wordlist)
        ("ghc-quickcheck-instances"
         ,ghc-quickcheck-instances)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
      "http://github.com/quchen/prettyprinter")
    (synopsis
      "A modern, easy to use, well-documented, extensible pretty-printer.")
    (description
      "A modern, easy to use, well-documented, extensible pretty-printer. For
more see README.md")
    (license license:bsd-2)))


(define ghc-prettyprinter-ansi-terminal
  (package
    (name "ghc-prettyprinter-ansi-terminal")
    (version "1.1.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/prettyprinter-ansi-terminal/prettyprinter-ansi-terminal-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0ha6vz707qzb5ky7kdsnw2zgphg2dnxrpbrxy8gaw119vwhb9q6k"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-ansi-terminal" ,ghc-ansi-terminal)
        ("ghc-prettyprinter" ,ghc-prettyprinter)))
    (native-inputs `(("ghc-doctest" ,ghc-doctest)))
    (home-page
      "http://github.com/quchen/prettyprinter")
    (synopsis
      "ANSI terminal backend for the Â»prettyprinterÂ« package.")
    (description "See README.md")
    (license license:bsd-2)))

(define ghc-microlens-0.4.11
  (package/inherit ghc-microlens
    (name "ghc-microlens")
    (version "0.4.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://hackage.haskell.org/package/"
                           "microlens-" version "/"
                           "microlens-" version ".tar.gz"))
       (sha256
        (base32
         "0alp144r3i2mv8gvdfylc3lrp0z9kvwq1vnya58gz8d3k4pmvwh8"))))))

(define ghc-microlens-ghc-0.4.11
  (package/inherit ghc-microlens-ghc
    (name "ghc-microlens-ghc")
    (version "0.4.11")
    (inputs `(("ghc-microlens" ,ghc-microlens-0.4.11)))
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/microlens-ghc/microlens-ghc-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1xfkzgkddggwy4smsh1lmpyxx3ppgrbp85arr59mq1hd67iz0kyl"))))))


(define ghc-microlens-mtl-0.2.0
  (package/inherit ghc-microlens-mtl
    (name "ghc-microlens-mtl")
    (version "0.2.0.1")
    (inputs
     `(("ghc-microlens" ,ghc-microlens-0.4.11)
       ("ghc-transformers-compat", ghc-transformers-compat)))
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/microlens-mtl/microlens-mtl-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0ijy7xyd5lbc3calhcrhy8czkf3fjcxrv68p7kd2a5b352rfi7fp"))))))

(define ghc-microlens-th-0.4.3
  (package/inherit ghc-microlens-th
    (name "ghc-microlens-th")
    (version "0.4.3.4")
    (arguments `())
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://hackage.haskell.org/package/"
                           "microlens-th-" version "/"
                           "microlens-th-" version ".tar.gz"))
       (sha256
        (base32
         "08cixz1840ycc1y2b8anf1pqzlhnh89i6wskixd5s5brf8jl0l79"))))))

(define ghc-microlens-platform-0.4.0
  (package/inherit ghc-microlens-platform
    (version "0.4.0")
    (inputs
     `(("ghc-hashable" ,ghc-hashable)
       ("ghc-microlens" ,ghc-microlens-0.4.11)
       ("ghc-microlens-ghc" ,ghc-microlens-ghc-0.4.11)
       ("ghc-microlens-mtl" ,ghc-microlens-mtl-0.2.0)
       ("ghc-microlens-th" ,ghc-microlens-th-0.4.3)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-vector" ,ghc-vector)))
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/"
             "microlens-platform/microlens-platform-" version ".tar.gz"))
       (sha256
        (base32
         "0q90qsrcr6pa0nvzk46573ykxrf21lr4xm0jp5sp5pd30kx21fmx"))))))


(define ghc-optparse-applicative-0.15.0.0
  (package/inherit ghc-optparse-applicative
    (version "0.15.0.0")
    (arguments `())
    (source
     (origin
       (method url-fetch)
       (uri (string-append
              "https://hackage.haskell.org/package/optparse-applicative-"
              version "/optparse-applicative-" version ".tar.gz"))
       (sha256
        (base32
         "0210rv7scp2063n8pr39bzy7dbl2777zwdnnx6kp3c34jilssjxg"))))))

(define-public ghc-entangled
  (let ((commit "04ef9771e5bfe5f354783132db484aed8e803971")
        (revision "0"))
    (package
      (name "ghc-entangled")
      (version (string-append "0.2.0-r" revision "-" (string-take commit 7)))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/tauoverpi/entangled")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32 "0xb8igp0gfr6h3c3ynwy1zlwjbgag11x3w2viijdng87bjfzxi34"))))
      (build-system haskell-build-system)
      (inputs
        `(("ghc-either" ,ghc-either)
          ("ghc-extra" ,ghc-extra)
          ("ghc-fsnotify" ,ghc-fsnotify)
          ("ghc-hspec" ,ghc-hspec)
          ("ghc-microlens-platform"
           ,ghc-microlens-platform-0.4.0)
          ("ghc-optparse-applicative"
           ,ghc-optparse-applicative-0.15.0.0)
          ("ghc-prettyprinter" ,ghc-prettyprinter)
          ("ghc-prettyprinter-ansi-terminal"
           ,ghc-prettyprinter-ansi-terminal)
          ("ghc-random" ,ghc-random)
          ("ghc-regex-tdfa" ,ghc-regex-tdfa)
          ("ghc-terminal-size" ,ghc-terminal-size)
          ("ghc-uuid" ,ghc-uuid)))
      (home-page
        "https://jhidding.github.io/enTangleD")
      (synopsis
        "bi-directional tangle daemon for literate programming")
      (description
        "Makes literate programming easier. EnTangleD allows you to write programs as code blocks in a markdown file. These code blocks are tangled into compilable source files whenever you write the markdown files. The other way around, if you change any of the generated source files, the markdown is updated to match the changes. This way, you can still use your editor, debugger or IDE on the generated code.")
      (license license:expat))))


(define-public ghc-open-browser
  (package
    (name "ghc-open-browser")
    (version "0.2.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/open-browser/open-browser-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0rna8ir2cfp8gk0rd2q60an51jxc08lx4gl0liw8wwqgh1ijxv8b"))))
    (build-system haskell-build-system)
    (home-page
      "https://github.com/rightfold/open-browser")
    (synopsis "Open a web browser from Haskell.")
    (description
      "Open a web browser from Haskell. Currently BSD, Linux, OS X and Windows are supported.")
    (license license:bsd-3)))

(define-public ghc-roman-numerals
  (package
    (name "ghc-roman-numerals")
    (version "0.5.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/roman-numerals/roman-numerals-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "10da5vls9l5i255bapms4b2r7dnwmxgsaa1cdll2lrmid5dikixr"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-base-unicode-symbols"
         ,ghc-base-unicode-symbols)))
    (home-page
      "https://github.com/roelvandijk/roman-numerals")
    (synopsis
      "Parsing and pretty printing of Roman numerals")
    (description
      "This library provides functions for parsing and pretty printing Roman numerals. Because the notation of Roman numerals has varied through the centuries this package allows for some customisation using a configuration that is passed to the conversion functions.")
    (license license:bsd-3)))

(define-public ghc-data-accessor-template
  (package
    (name "ghc-data-accessor-template")
    (version "0.2.1.16")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/data-accessor-template/data-accessor-template-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "15gd6xlrq5ica514m5rdcz2dl8bibdmbsmnc98ddhx491c9g5rwk"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-data-accessor" ,ghc-data-accessor)
        ("ghc-utility-ht" ,ghc-utility-ht)))
    (home-page
      "http://www.haskell.org/haskellwiki/Record_access")
    (synopsis
      "Utilities for accessing and manipulating fields of records")
    (description
      "Automate generation of @Accessor@'s of the @data-accessor@ package by Template Haskell functions.")
    (license license:bsd-3)))

(define-public ghc-pandoc-crossref
  (package
    (name "ghc-pandoc-crossref")
    (version "0.3.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/pandoc-crossref/pandoc-crossref-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "03bdi57x49rnyi991wzrhqkiz01vv7j9dvc9vwhgfm5x3yhgr0v2"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-data-accessor" ,ghc-data-accessor)
        ("ghc-data-accessor-template"
         ,ghc-data-accessor-template)
        ("ghc-data-accessor-transformers"
         ,ghc-data-accessor-transformers)
        ("ghc-data-default" ,ghc-data-default)
        ("ghc-pandoc" ,ghc-pandoc)
        ("ghc-pandoc-types" ,ghc-pandoc-types)
        ("ghc-roman-numerals" ,ghc-roman-numerals)
        ("ghc-syb" ,ghc-syb)
        ("ghc-utility-ht" ,ghc-utility-ht)
        ("ghc-gitrev" ,ghc-gitrev)
        ("ghc-open-browser" ,ghc-open-browser)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-temporary" ,ghc-temporary)))
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-hspec" ,ghc-hspec)))
    (home-page
      "https://github.com/lierdakil/pandoc-crossref#readme")
    (synopsis "Pandoc filter for cross-references")
    (description
      "pandoc-crossref is a pandoc filter for numbering figures, equations, tables and cross-references to them.")
    (license license:gpl2)))


(define-public ghc-pandoc-filter-graphviz
  (package
    (name "ghc-pandoc-filter-graphviz")
    (version "0.1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/pandoc-filter-graphviz/pandoc-filter-graphviz-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0i4sczbbq5bhhi43dv1z2p06d5wvg8fs17njzdgkvv2l9hd6nxi4"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-pandoc" ,ghc-pandoc)
        ("ghc-base16-bytestring" ,ghc-base16-bytestring)
        ("ghc-cryptonite" ,ghc-cryptonite)
        ("ghc-byteable" ,ghc-byteable)
        ("ghc-pandoc-types" ,ghc-pandoc-types)))
    (home-page
      "https://github.com/jpierre03/pandoc-filter-graphviz")
    (synopsis "A Pandoc filter to use graphviz")
    (description
      "Interpret '~~~ graphviz' bloc as a call to graphviz software and substritude text with produced picture.")
    (license license:bsd-3)))


(define-public ghc-csv
  (package
    (name "ghc-csv")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/csv/csv-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "00767ai09wm7f0yzmpqck3cpgxncpr9djnmmz5l17ajz69139x4c"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/csv")
    (synopsis "CSV loader and dumper")
    (description
      "CSV loader and dumper . This library parses and dumps documents that are formatted according to RFC 4180, \\\"The common Format and MIME Type for Comma-Separated Values (CSV) Files\\\". This format is used, among many other things, as a lingua franca for spreadsheets, and for certain web services.")
    (license license:expat)))

(define-public ghc-pandoc-csv2table
  (package
    (name "ghc-pandoc-csv2table")
    (version "1.0.8")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/pandoc-csv2table/pandoc-csv2table-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0sf0af2cx5fi3a2iixkjjdpzp0153hxsjzs5wwqssby39g7s24gb"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-csv" ,ghc-csv)
        ("ghc-pandoc" ,ghc-pandoc)
        ("ghc-pandoc-types" ,ghc-pandoc-types)))
    (home-page
      "https://github.com/baig/pandoc-csv2table-filter")
    (synopsis "Convert CSV to Pandoc Table Markdown")
    (description
      "A Pandoc filter that replaces image inline or fenced code blocks with pandoc table markdown. CSV contents will be parsed by the pandoc markdown reader.")
    (license license:expat)))

(define-public ghc-monad-gen
  (package
    (name "ghc-monad-gen")
    (version "0.3.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/monad-gen/monad-gen-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0rc4r6sg29sjgh9xsk7q80h0lixhyxs60bszj5dnn8yf7w18b15y"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/monad-gen")
    (synopsis
      "A simple monad for generating fresh integers")
    (description
      "This module provides a simple monad transformer @GenT@ to enumerate unique values within a monadic computation. It also plays nicely with everything in the MTL.")
    (license license:expat)))

(define-public ghc-pandoc-sidenote
  (package
    (name "ghc-pandoc-sidenote")
    (version "0.19.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/pandoc-sidenote/pandoc-sidenote-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0vz8w1dgzm0hipwfz5a1m41xkjdindr3373x6ip6vqv9h2gzzbb3"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-monad-gen" ,ghc-monad-gen)
        ("ghc-pandoc" ,ghc-pandoc)
        ("ghc-pandoc-types" ,ghc-pandoc-types)))
    (home-page
      "https://github.com/jez/pandoc-sidenote#readme")
    (synopsis
      "Convert Pandoc Markdown-style footnotes into sidenotes")
    (description
      "Convert Pandoc Markdown-style footnotes into sidenotes")
    (license license:expat)))

(define-public ghc-pandoc-include
  (package
    (name "ghc-pandoc-include")
    (version "0.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/pandoc-include/pandoc-include-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1hv8jw6aymlx6hvm1xq9ccsh2vi1y340xnhrysglpggvarim3dnd"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-pandoc" ,ghc-pandoc)
        ("ghc-pandoc-types" ,ghc-pandoc-types)))
    (home-page
      "https://github.com/steindani/pandoc-include")
    (synopsis "Include other Markdown files")
    (description
      "A Pandoc filter that replaces include labeled Code Blocks with the contents of the referenced Markdown files. Even nested, recursive includes.")
    (license license:expat)))

(define-public ghc-pandoc-stylefrommeta
  (package
    (name "ghc-pandoc-stylefrommeta")
    (version "0.2.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/pandoc-stylefrommeta/pandoc-stylefrommeta-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1145flz4jkn5knqkc5cppc1412m6hfzd13124k2kfm8dmw196k31"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-pandoc" ,ghc-pandoc)
        ("ghc-pandoc-types" ,ghc-pandoc-types)
        ("ghc-extra" ,ghc-extra)))
    (home-page
      "http://github.com/lyokha/styleFromMeta")
    (synopsis
      "Pandoc filter to customize links, images and paragraphs")
    (description
      "Pandoc filter to customize links, images and paragraphs (with
      restrictions). Styles are read from the metadata of the document:
      they may reside inside the document or in a separate YAML file.")
    (license license:bsd-3)))

(define-public ghc-pandoc-csv2table
  (package
    (name "ghc-pandoc-csv2table")
    (version "1.0.8")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/pandoc-csv2table/pandoc-csv2table-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0sf0af2cx5fi3a2iixkjjdpzp0153hxsjzs5wwqssby39g7s24gb"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-csv" ,ghc-csv)
        ("ghc-pandoc" ,ghc-pandoc)
        ("ghc-pandoc-types" ,ghc-pandoc-types)))
    (home-page
      "https://github.com/baig/pandoc-csv2table-filter")
    (synopsis "Convert CSV to Pandoc Table Markdown")
    (description
      "A Pandoc filter that replaces image inline or fenced code blocks with
pandoc table markdown. CSV contents will be parsed by the pandoc markdown
reader.")
    (license license:expat)))


(define-public ghc-panpipe
(let ((commit "cea9acb8765122bba4e50c8c7324479cc74829b0"))
    (package
      (name "ghc-panpipe")
      (version "0.4.0.0")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/tauoverpi/panpipe")
                 (commit commit)))
          (sha256
            (base32 "0s9qqbwvkh82xyb5p993hhi9gij7ssnvph9rf7vcsdn2hh4c1hf3"))))
      (build-system haskell-build-system)
      (arguments
       `(#:tests? #f))
      (inputs
        `(("ghc-pandoc" ,ghc-pandoc)
          ("ghc-pandoc-types" ,ghc-pandoc-types)
          ("ghc-temporary" ,ghc-temporary)))
      (native-inputs
        `(("ghc-quickcheck" ,ghc-quickcheck)
          ("ghc-tasty" ,ghc-tasty)
          ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
      (home-page
        "http://chriswarbo.net/projects/activecode")
      (synopsis "Pandoc filter to execute code blocks")
      (description
        "Executes pandoc code blocks annotated with 'pipe'")
      (license license:public-domain))))

(define-public ghc-parallel-io
  (package
    (name "ghc-parallel-io")
    (version "0.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/parallel-io/parallel-io-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0i86x3bf8pjlg6mdg1zg5lcrjpg75pbqs2mrgrbp4z4bkcmw051s"))))
    (build-system haskell-build-system)
    (arguments
      `(#:phases
        (modify-phases %standard-phases
          (add-after 'unpack 'fix-versions
            (lambda _
              (substitute* "parallel-io.cabal"
                (("containers >= 0.2 && < 0.6, random >= 1.0 && < 1.1")
                 "containers >= 0.2, random >= 1.0")))))))
    (inputs
      `(("ghc-extensible-exceptions"
         ,ghc-extensible-exceptions)
        ("ghc-random" ,ghc-random)))
    (home-page
      "http://batterseapower.github.com/parallel-io")
    (synopsis
      "Combinators for executing IO actions in parallel on a thread pool.")
    (description
      "This package provides combinators for sequencing IO actions onto a thread pool. The thread pool is guaranteed to contain no more unblocked threads than a user-specified upper limit, thus minimizing contention. . Furthermore, the parallel combinators can be used reentrantly - your parallel actions can spawn more parallel actions - without violating this property of the thread pool. . The package is inspired by the thread <http://thread.gmane.org/gmane.comp.lang.haskell.cafe/56499/focus=56521>. Thanks to Neil Mitchell and Bulat Ziganshin for some of the code this package is based on.")
    (license license:bsd-3)))


(define-public ghc-optional-args
  (package
    (name "ghc-optional-args")
    (version "1.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/optional-args/optional-args-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1r5hhn6xvc01grggxdyy48daibwzi0aikgidq0ahpa6bfynm8d1f"))))
    (build-system haskell-build-system)
    (arguments
      `(#:cabal-revision
        ("1"
         "0fda6mhm44qpbc9hfkf6jxnm3a7qszabywsmxa2iw0dz734a9xl3")))
    (home-page
      "http://hackage.haskell.org/package/optional-args")
    (synopsis "Optional function arguments")
    (description
      "This library provides a type for specifying `Optional` function arguments . Read the tutorial in \"Data.Optional\" to learn more")
    (license license:bsd-3)))

(define-public ghc-managed
  (package
    (name "ghc-managed")
    (version "1.0.7")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/managed/managed-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0wxi6d3kcpc4iyhbrnbapbdgaf46aw0a8d32n2sbs0lbk0pc4c6i"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/managed")
    (synopsis "A monad for managed values")
    (description
      "In Haskell you very often acquire values using the @with...@ idiom using functions of type @(a -> IO r) -> IO r@.  This idiom forms a @Monad@, which is a special case of the @ContT@ monad (from @transformers@) or the @Codensity@ monad (from @kan-extensions@).  The main purpose behind this package is to provide a restricted form of these monads specialized to this unusually common case. . The reason this package defines a specialized version of these types is to: . * be more beginner-friendly, . * simplify inferred types and error messages, and: . * provide some additional type class instances that would otherwise be orphan instances")
    (license license:bsd-3)))

(define-public ghc-turtle
  (package
    (name "ghc-turtle")
    (version "1.5.18")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/turtle/turtle-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0xdkn6vhmir7sxazi5sxrgvwsi8zqyqbcyvjnqvckz0ac5d8zj68"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-ansi-wl-pprint" ,ghc-ansi-wl-pprint)
        ("ghc-async" ,ghc-async)
        ("ghc-clock" ,ghc-clock)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-foldl" ,ghc-foldl)
        ("ghc-hostname" ,ghc-hostname)
        ("ghc-managed" ,ghc-managed)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-system-filepath" ,ghc-system-filepath)
        ("ghc-system-fileio" ,ghc-system-fileio)
        ("ghc-streaming-commons" ,ghc-streaming-commons)
        ("ghc-temporary" ,ghc-temporary)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-optional-args" ,ghc-optional-args)
        ("ghc-unix-compat" ,ghc-unix-compat)))
    (native-inputs
      `(("ghc-doctest" ,ghc-doctest)
        ("ghc-fail" ,ghc-fail)))
    (home-page
      "http://hackage.haskell.org/package/turtle")
    (synopsis "Shell programming, Haskell-style")
    (description
      "@turtle@ is a reimplementation of the Unix command line environment in Haskell so that you can use Haskell as both a shell and a scripting language. . Features include: . * Batteries included: Command an extended suite of predefined utilities . * Interoperability: You can still run external shell commands . * Portability: Works on Windows, OS X, and Linux . * Exception safety: Safely acquire and release resources . * Streaming: Transform or fold command output in constant space . * Patterns: Use typed regular expressions that can parse structured values . * Formatting: Type-safe @printf@-style text formatting . * Modern: Supports @text@ and @system-filepath@ . Read \"Turtle.Tutorial\" for a detailed tutorial or \"Turtle.Prelude\" for a quick-start guide . @turtle@ is designed to be beginner-friendly, but as a result lacks certain features, like tracing commands.  If you feel comfortable using @turtle@ then you should also check out the @Shelly@ library which provides similar functionality.")
    (license license:bsd-3)))


(define-public ghc-tasty-hspec
  (package
    (name "ghc-tasty-hspec")
    (version "1.1.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/tasty-hspec/tasty-hspec-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0i9kdzjpk750sa078jj3iyhp72k0177zk7vxl131r6dkyz09x27y"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-hspec-core" ,ghc-hspec-core)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-smallcheck" ,ghc-tasty-smallcheck)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (arguments
      `(#:cabal-revision
        ("5"
         "1ramy5jn7a6xvxc6s8bvn34m1vzniks05277s3i80cp4qprwx8ri")))
    (home-page
      "https://github.com/mitchellwrosen/tasty-hspec")
    (synopsis
      "Hspec support for the Tasty test framework.")
    (description
      "This package provides a Tasty provider for Hspec test suites.")
    (license license:bsd-3)))

