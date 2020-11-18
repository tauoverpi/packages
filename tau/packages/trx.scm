(define-module (tau packages trx)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages linphone)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public trx
  (package
    (name "trx")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.pogo.org.uk/~mark/trx/releases/trx-" version ".tar.gz"))
              (sha256
                (base32
                  "1jjgca92nifjhcr3n0fmpfr6f5gxlqyal2wmgdlgd7hx834r1if7"))))
    (inputs
    `(("opus" ,opus)
      ("alsa-lib" ,alsa-lib)
      ("bctoolbox" ,bctoolbox)
      ("ortp" ,ortp)))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no tests
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             (string-append "PREFIX=" %output))
       #:phases (modify-phases %standard-phases (delete 'configure))))
    (synopsis "")
    (description "")
    (home-page "http://www.pogo.org.uk/~mark/trx/")
    (license #f)))
