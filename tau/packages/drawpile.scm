(define-module (tau packages drawpile)
 #:use-module (gnu packages qt)
 #:use-module (guix packages)
 #:use-module (guix download)
 #:use-module (guix build-system cmake)
 #:use-module (gnu packages kde-frameworks))

(define-public drawpile
  (package
    (name "drawpile")
    (version "2.1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/drawpile/Drawpile/archive/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0m3pri9kfz0gplgslcz4sn36khs03g1457xppczw4s87b168gkg7"))))
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
