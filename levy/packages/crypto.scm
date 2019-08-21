(define-module (levy packages crypto)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system cmake))

(define-public olm
  (package
    (name "olm")
    (version "3.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.matrix.org/matrix-org/olm/-/archive/"
                                  version
                                  "/olm-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1zr6bi9kk1410mbawyvsbl1bnzw86wzwmgc7i5ap6i9l96mb1zqh"))))
    (build-system cmake-build-system)
    (arguments
     '(#:tests? #f))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))
