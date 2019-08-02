(define-module (levy packages xorg)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages image))

(define-public bgs
  (package
    (name "bgs")
    (version "0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Gottox/bgs/archive/v"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1rw9ingkkpvvr2dixx126ziim67a54r8k49918h1mbph0fjj08n5"))))
    (build-system gnu-build-system)
    (arguments
      '(#:tests? #f ; no tests
        #:make-flags (list "CC=gcc"
                           (string-append "PREFIX=" %output))
        #:phases
        (modify-phases %standard-phases
          (delete 'configure))))
    (native-inputs
      `(("pkg-config" ,pkg-config)))
    (inputs
      `(("imlib2" ,imlib2)
        ("libxinerama" ,libxinerama)
        ("libx11" ,libx11)))
    (description "")
    (synopsis "")
    (home-page "")
    (license #f)))

bgs
