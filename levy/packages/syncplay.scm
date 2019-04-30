(define-module (levy packages syncplay)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages python)
  #:use-module (guix build-system python)
  #:use-module (guix licenses)
  #:use-module (guix download)
  #:use-module (gnu packages python-xyz))

(define-public python-syncplay
  (package
    (name "python-syncplay")
    (version "1.6.3")
    (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/Syncplay/syncplay/archive/v"
                                 version
                                 "-RC1.tar.gz"))
             (sha256
              (base32 "0h3vvbbrgwm2c9qnj6ac3shgpbks52kr985b06mrr8im5r2ji3as"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (replace 'build (lambda _ (system* "make" (string-append "PREFIX=" %output))))
         (replace 'install (lambda _ (system* "make" "install" (string-append "PREFIX=" %output))))
         (delete 'configure))))
    (inputs 
     `(("python-twisted" ,python-twisted)
       ("python" ,python)))
    (home-page "")
    (synopsis "")
    (description "")
    (license expat)))
