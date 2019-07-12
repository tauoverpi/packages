(define-module (levy packages catwm)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages xorg))

(define-public catwm-xcb
  (let ((commit "5025c6e10244899d9ed681e6493385230469102b")
	(revision "1"))
    (package
     (name "catwm-xcb")
     (version (string-append name "-" revision "." (string-take commit 7)))
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/Mrktn/catwm-xcb")
		    (commit commit)))
	      (sha256
	       (base32
		"1mawk7p277hqg32nj8magxcbncfkrdzys2ymvsxxpni2aqm9lypx"))))
     (build-system gnu-build-system)
     (arguments
      '(#:tests? #f			; no tests
	#:make-flags (list "CC=gcc"
			   (string-append "PREFIX=" %output))
	#:phases (modify-phases %standard-phases (delete 'configure))))
     (inputs
      `(("libxcb" ,libxcb)
	("xcb-util" ,xcb-util)
	("xcb-util-wm" ,xcb-util-wm)
	("xcb-util-keysyms" ,xcb-util-keysyms)))
     (synopsis "")
     (description "")
     (home-page "")
     (license #f))))
