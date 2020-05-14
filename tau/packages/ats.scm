(define-module (tau packages ats)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages multiprecision)
  #:use-module (guix licenses))

(define-public ats2
  (package
    (name "ats2-postiats")
    (version "0.3.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/project/ats2-lang/ats2-lang/ats2-postiats-"
                    version
                    "/ATS2-Postiats-"
                    version
                    ".tgz"))
              (sha256
                (base32
                  "08rwhbpx17vzhafy92lxdbarhyly3dxlw06f3n1vkjamz9dzymh0"))))
    (build-system gnu-build-system)
    (arguments
      '(#:tests? #f
        #:phases
        (modify-phases %standard-phases
          (replace 'build
            (lambda _
              (system* "make" "all")
              #t))
          (delete 'validate-runpath))))
    (inputs
      `(("gmp" ,gmp)))
    (description "")
    (synopsis "")
    (home-page "")
    (license expat)))
