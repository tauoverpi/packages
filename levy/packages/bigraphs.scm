(define-module (levy packages bigraphs)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix licenses)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system ant)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages readline))

(define-public bigmc
  (package
    (name "bigmc")
    (version "20140204")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bigmc/bigmc/archive/bigmc-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1fdcgq335ddnj1rai6zwf2cjal259h9zry4k845c302qbych1ssn"))))
    (build-system gnu-build-system)
    (arguments
      '(#:tests? #f))
    (native-inputs
      `(("autoconf" ,autoconf)
        ("texinfo" ,texinfo)
        ("libtool" ,libtool)
        ("bison" ,bison)
        ("flex" ,flex)
        ("automake" ,automake)))
    (inputs
      `(("readline" ,readline)))
    (home-page "http://bigraph.org/bigmc/")
    (synopsis
      "BigMC (Bigraphical Model Checker) is a model-checker designed to
operate on Bigraphical Reactive Systems (BRS).")
    (description
      "BigMC (Bigraphical Model Checker) is a model-checker designed to
operate on Bigraphical Reactive Systems (BRS). BRS is a formalism
developed by Robin Milner and colleagues that emphasises the orthogonal
notions of locality and connectivity. Bigraphs have found applications
in ubiquitous computing, computational biology, business workflow
modelling, and context-aware systems.")
    (license gpl3)))

;(let ((commit "560bd5a904a38c8d1b73bfb2ac8394d0a2223c19"))
;  (package
;    (name "bigmc-gui")
;    (version "")
;    (source (origin
;              (method git-fetch)
;              (uri (git-reference
;                     (url "https://github.com/bigmc/bigmc-gui")
;                     (commit commit)))
;              (sha256
;                (base32
;                  "1s6lnyx89kzz1v8lmwmvb2gz204hi7n8iccpp5in7w4nhsp3h59y"))))
;    (build-system ant-build-system)
;    (synopsis "")
;    (description "")
;    (home-page "http://bigraph.org/bigmc/")
;    (license #f)))
