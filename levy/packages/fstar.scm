(define-module (levy packages fstar)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system ocaml)
  #:use-module (guix build-system dune)
  #:use-module (gnu packages ocaml))

(define-public ocaml-process
  (package
    (name "ocaml-process")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri "https://github.com/dsheets/ocaml-process/archive/0.2.1.tar.gz")
        (sha256
          (base32
            "0gns3bxp03zgsz4x9rvfphp4h8a8a69p3nfs7aipc8dl7lgpbl4h"))))
    (build-system ocaml-build-system)
    (arguments
      '(#:phases
        (modify-phases %standard-phases
          (delete 'configure))))
    (native-inputs
      `(("ocaml-findlib" ,ocaml-findlib)
        ("ocaml-alcotest" ,ocaml-alcotest)
        ("ocamlbuild" ,ocamlbuild)))
    (home-page
      "https://github.com/dsheets/ocaml-process")
    (synopsis "Easy process control")
    (description
      "process makes it easy to use commands like functions.")
    (license #f)))

(define-public ocaml-ppx-deriving-yojson
  (package
    (name "ocaml-ppx-deriving-yojson")
    (version "3.5.1")
    (source
      (origin
        (method url-fetch)
        (uri "https://github.com/ocaml-ppx/ppx_deriving_yojson/archive/v3.5.1.tar.gz")
        (sha256
          (base32
            "1549arsx6p6zp1aca6y8cs9gxa9jwfjabk7dp6zf43ig7xkrrzmf"))))
    (build-system ocaml-build-system)
    (inputs
      `(("ocaml-yojson" ,ocaml-yojson)
        ("ocaml-result" ,ocaml-result)
        ("ocaml-ppx-deriving" ,ocaml-ppx-deriving)
        ("dune" ,dune)))
    (native-inputs
      `(("ocaml-ppx-tools" ,ocaml-ppx-tools)
        ("ocaml-ppxfind" ,ocaml-ppxfind)
        ("ocaml-cppo" ,ocaml-cppo)
        ("ocaml-ounit" ,ocaml-ounit)))
    (properties
      `((upstream-name . "ppx_deriving_yojson")))
    (home-page
      "https://github.com/whitequark/ppx_deriving_yojson")
    (synopsis "JSON codec generator for OCaml")
    (description
      "ppx_deriving_yojson is a ppx_deriving plugin that provides
a JSON codec generator.")
    (license #f)))

(define-public ocaml-ppxfind
  (package
    (name "ocaml-ppxfind")
    (version "1.3")
    (source
      (origin
        (method url-fetch)
        (uri "https://github.com/diml/ppxfind/releases/download/1.3/ppxfind-1.3.tbz")
        (sha256
          (base32
            "1r4jp0516378js62ss50a9s8ql2pm8lfdd3mnk214hp7s0kb17fl"))))
    (build-system ocaml-build-system)
    (inputs
      `(("dune" ,dune)
        ("ocaml-migrate-parsetree"
         ,ocaml-migrate-parsetree)))
    (home-page "https://github.com/diml/ppxfind")
    (synopsis "Tool combining ocamlfind and ppx")
    (description
      "Ppxfind is a small command line tool that among other things allows
to use old style ppx rewriters with jbuilder.
")
    (license #f)))

(define-public ocaml-pprint
  (package
    (name "ocaml-pprint")
    (version "20180528")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/fpottier/pprint/archive/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0ad86yapx0ylgdkzb4z9wpbvfk5lzwgirib4b6gj2cj84gjxn906"))))
    (build-system ocaml-build-system)
    (arguments
      '(#:phases
        (modify-phases %standard-phases
          (delete 'configure))))
    (native-inputs
      `(("ocaml-findlib" ,ocaml-findlib)
        ("ocamlbuild" ,ocamlbuild)))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public ocaml-ppx-deriving
  (package
    (name "ocaml-ppx-deriving")
    (version "4.4")
    (source
      (origin
        (method url-fetch)
        (uri "https://github.com/ocaml-ppx/ppx_deriving/archive/v4.4.tar.gz")
        (sha256
          (base32
            "0d6cdgk6kdi64l4q4l6hs2zln5js76q0yn94yriz38b5rgs5mn62"))))
    (build-system ocaml-build-system)
    (inputs
      `(("dune" ,dune)
        ("ocaml-migrate-parsetree"
         ,ocaml-migrate-parsetree)
        ("ocaml-ppx-derivers" ,ocaml-ppx-derivers)
        ("ocaml-ppx-tools" ,ocaml-ppx-tools)
        ("ocaml-result" ,ocaml-result)))
    (native-inputs
      `(("ocaml-cppo" ,ocaml-cppo)
        ("ocaml-ppxfind" ,ocaml-ppxfind)
        ("ocaml-ounit" ,ocaml-ounit)))
    (properties `((upstream-name . "ppx_deriving")))
    (home-page
      "https://github.com/ocaml-ppx/ppx_deriving")
    (synopsis
      "Type-driven code generation for OCaml >=4.02.2")
    (description
      "ppx_deriving provides common infrastructure for generating
code based on type definitions, and a set of useful plugins
for common tasks.
")
    (license #f)))

(define-public ocaml-stdint
  (package
    (name "ocaml-stdint")
    (version "0.5.1")
    (source
      (origin
        (method url-fetch)
        (uri "https://github.com/andrenth/ocaml-stdint/archive/0.5.1.tar.gz")
        (sha256
          (base32
            "0mw781mwqv3qm707kaa72js2j2zrgsknl9ynnn04d3lvmxfasyfq"))))
    (build-system dune-build-system)
    (arguments
      '(#:phases
        (modify-phases %standard-phases
          (add-after 'unpack 'dune-upgrade
            (lambda _
              (invoke "dune" "upgrade"))))))
    (home-page
      "https://github.com/andrenth/ocaml-stdint")
    (synopsis
      "signed and unsigned integer types having specified widths")
    (description
      "The stdint library provides signed and unsigned integer types of various
fixed widths: 8, 16, 24, 32, 40, 48, 56, 64 and 128 bit.
This interface is similar to Int32 and Int64 from the base library but provides
more functions and constants like arithmetic and bit-wise operations, constants
like maximum and minimum values, infix operators conversion to and from every
other integer type (including int, float and nativeint), parsing from and
conversion to readable strings (binary, octal, decimal, hexademical),
conversion to and from buffers in both big endian and little endian byte order.")
    (license #f)))

(define-public ocaml-fstar
  (package
    (name "ocaml-fstar")
    (version "0.9.7.0-alpha1")
    (source
      (origin
        (method url-fetch)
        (uri "https://github.com/FStarLang/FStar/archive/V0.9.7.0-alpha1.zip")
        (sha256
          (base32
            "1jmsy0pz2vd9xhi3nddjyqsiv72gzai6f00j7kzz3mnd1qbb2cxw"))))
    (build-system ocaml-build-system)
    (inputs
      `(("ocaml-batteries" ,ocaml-batteries)
        ("ocaml-zarith" ,ocaml-zarith)
        ("ocaml-stdint" ,ocaml-stdint)
        ("ocaml-yojson" ,ocaml-yojson)
        ("ocaml-fileutils" ,ocaml-fileutils)
        ("ocaml-menhir" ,ocaml-menhir)
        ("ocaml-pprint" ,ocaml-pprint)
        ("ocaml-ulex" ,ocaml-ulex)
        ("ocaml-ppx-deriving" ,ocaml-ppx-deriving)
        ("ocaml-ppx-deriving-yojson"
         ,ocaml-ppx-deriving-yojson)
        ("ocaml-process" ,ocaml-process)
        ("ocaml-migrate-parsetree"
         ,ocaml-migrate-parsetree)))
    (native-inputs `(("ocamlbuild" ,ocamlbuild)))
    (home-page "http://fstar-lang.org")
    (synopsis
      "Verification system for effectful programs")
    (description #f)
    (license #f)))

ocaml-fstar
