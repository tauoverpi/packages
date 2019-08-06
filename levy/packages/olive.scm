(define-module (levy packages olive)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages video)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages kde-frameworks))

(define-public olive
  (package
    (name "olive")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/olive-editor/olive/archive/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0i028h59lcsns8f6744nfxv0njqmvrpba3vdm1rg435fv5zw77q9"))))
    (build-system cmake-build-system)
    (arguments
      `(#:tests? #f))
    (native-inputs
      `(("qtlinguist" ,qttools)))
    (inputs
      `(("qtbase" ,qtbase)
        ("qtmultimedia" ,qtmultimedia)
        ("qtsvg" ,qtsvg)
        ("ffmpeg" ,ffmpeg)))
    (description "")
    (synopsis "")
    (home-page "")
    (license #f)))
