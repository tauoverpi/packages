(define-module (tau packages flow)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system ocaml)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages ocaml))

(define-public flow
  (package
    (name "flow")
    (version "0.118.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/facebook/flow/refs/tags/v"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "103dgj61qhbqzfgqjbcww2bfipk894glj9xjg1r2zwfsgpxy6x26"))))
    (build-system ocaml-build-system)
    (inputs
     `(("ocaml-lwt" ,ocaml-lwt)))
    (home-page "https://flow.org")
    (synopsis "A static type checker for JavaScript")
    (description "A static type checker for JavaScript")
    (license license:expat)))
