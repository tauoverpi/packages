(define-module (tau packages gtk)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk))

(define-public adresia
  (let ((commit "c498be6a4b0da075db35bcee223d467de6921e63"))
    (package
      (name "adresia")
      (version (string-take commit 7))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/tommccallum/ardesia")
                      (commit commit)))
                (sha256
                  (base32
                    "1hn95lcpragr4phr5155wi11w5abi9b6fgpq9g50al0q1a7wwx87"))))
      (build-system gnu-build-system)
      (native-inputs
       `(("autoconf" ,autoconf)
         ("automake" ,automake)
         ("intltool" ,intltool)
         ("libtool" ,libtool)
         ("glib" ,glib "bin")))
      (inputs
       `(("gtk+" ,gtk+)))
      (home-page "")
      (description "")
      (synopsis "")
      (license #f))))

