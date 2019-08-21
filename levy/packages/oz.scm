(define-module (levy packages oz)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages java)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages tcl))

(define-public mozart ; FIX ME: currently requires i386
  (package
    (name "mozart")
    (version "1-4-0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mozart/mozart/archive/mozart-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0zambhvgg5h7mwf9vf6qsrqkn7vdpqbgr3990yqbncp15hanmaz4"))))
    (build-system gnu-build-system)
    (native-inputs
      `(("flex" ,flex)
        ("bison" ,bison)))
    (inputs
      `(("gmp" ,gmp)
        ("tklib" ,tklib)
        ("zlib" ,zlib)))
    (description "")
    (synopsis "")
    (home-page "")
    (license #f)))

(define-public mozart2 ; FIX ME: build fails
  (package
    (name "mozart2")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mozart/mozart2/archive/v"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1dp2fm12g8whc8kfj45bks2n5cfj1ip22zibwk68g2q6j1gyjw06"))))
    (build-system cmake-build-system)
    (inputs
      `(("boost" ,boost)
        ("gmp" ,gmp)
        ("icedtea" ,icedtea)
        ("tk" ,tk)
        ("tcl" ,tcl)))
    (synopsis "")
    (description "")
    (home-page "")
    (license #f)))

mozart2

