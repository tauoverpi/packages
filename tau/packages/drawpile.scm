(define-module (tau packages drawpile)
 #:use-module (gnu packages qt)
 #:use-module (guix packages)
 #:use-module (guix download)
 #:use-module (guix build-system cmake)
 #:use-module (gnu packages kde-frameworks))

(define-public drawpile
  (package
    (name "drawpile")
    (version "2.1.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/drawpile/Drawpile/archive/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0brscm95nay31xa1c02n1w144gg9hm8pxwa9sfnis0x5dj2nkrb7"))))
    (build-system cmake-build-system)
    (arguments
      '(#:tests? #f))
    (native-inputs
      `(("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
      `(("qtbase" ,qtbase)
        ("qtmultimedia" ,qtmultimedia)
        ("qtsvg" ,qtsvg)
        ("karchive" ,karchive)))
    (home-page "")
    (description "")
    (synopsis "")
    (license #f)))
