(define-module (tau packages xorg)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages xorg))

(define-public catwm
  (let ((commit "0d9294b29dee440099b9290adb290dd36b9ec5f9"))
    (package
      (name "catwm")
      (version "0.0.0")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/pyknite/catwm")
                       (commit commit)))
                (sha256
                  (base32
                    "1sdcgz05y1fjk8dqskppv2pspqzsjfm8v6gyr9jrcisspsrk15gp"))))
      (build-system gnu-build-system)
      (arguments
       `(#:phases (modify-phases %standard-phases (delete 'configure))
         #:tests? #f ; No tests
         #:make-flags (list "CC=gcc"
                            (string-append "PREFIX=" %output))))
      (inputs
       `(("libx11" ,libx11)))
      (home-page "https://git.2f30.org/xbattmon/")
      (synopsis "Simple battery monitor for X")
      (description
       "Xbattmon is a simple battery monitor for X.")
      (license license:isc))))
