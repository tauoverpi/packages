(define-module (tau packages microsoft)
 #:use-module (guix packages)
 #:use-module (guix download)
 #:use-module (guix build-system cmake)
 #:use-module (gnu packages ncurses))

(define-public bcc
  (package
    (name "bcc")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/iovisor/bcc/archive/v"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1px95rl8fdq09bhzhvfbj2zps1cbjvrpjkk40kka55ln69msijd6"))))
    (build-system cmake-build-system)
    (inputs
     `(("ncurses", ncurses)))
    (home-page "")
    (description "")
    (synopsis "")
    (license #f)))

(define-public procmon
  (package
    (name "procmon")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/microsoft/ProcMon-for-Linux/archive/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1px95rl8fdq09bhzhvfbj2zps1cbjvrpjkk40kka55ln69msijd6"))))
    (build-system cmake-build-system)
    (inputs
     `(("ncurses", ncurses)
       ("bcc" ,bcc)))
    (home-page "")
    (description "")
    (synopsis "")
    (license #f)))
