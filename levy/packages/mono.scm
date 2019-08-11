(define-module (levy packages mono)
  #:use-module (guix packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (gnu packages mono))

(define-public mono-6.0.0.311
  (package
    (inherit mono)
    (version "6.0.0.319")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mono/mono/archive/mono-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1v2awihsyqziv1a5kzjig6d9b1wxwdrmxrz9810a0mcpj99bl1rs"))))
    (arguments
      (substitute-keyword-arguments (package-arguments mono)
        ((#:phases phases)
         `(modify-phases ,phases
            (add-after 'unpack 'patch-which
              (lambda _
                (substitute* "libgc/autogen.sh"
                  (("/bin/sh") (which "sh")))
                (substitute* "libgc/configure.ac"
                  (("/bin/sh") (which "sh")))
                (substitute* "configure.ac"
                  (("/bin/sh") (which "sh")))
                (substitute* "autogen.sh"
                  (("/bin/sh") (which "sh")))))
            (delete 'make-reproducible)
            (delete 'fix-includes)
            (delete 'patch-tests)))))
    (native-inputs `(("autoconf" ,autoconf)
                     ("automake" ,automake)
                     ("libtool" ,libtool)
                     ("which" ,which)
                     ,@(package-native-inputs mono)))))

mono-6.0.0.311
