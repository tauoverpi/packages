(define-module (levy packages mono)
  #:use-module (guix packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (gnu packages mono))

(define-public mono-6.0.0.311
  (package
    (inherit mono)
    (version "6.0.0.319")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://download.mono-project.com/sources/mono/mono-"
                                  version
                                  ".tar.xz"))
              (sha256
                (base32
                  "06i6ild0cxn4ygb9fg2121l4rg1x3rlcrzkvg5w82s7pifw80k3b"))))
    (build-system gnu-build-system)
    (arguments
      '(#:tests? #f
        #:phases
        (modify-phases %standard-phases
          (replace 'bootstrap
            (lambda _
              (copy-file "mono/mini/Makefile.am.in" "mono/mini/Makefile.in")
              (invoke "autoreconf" "-vfi"))))))
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("glib" ,glib)
       ("which" ,which)
       ("cmake" ,cmake)
       ("libtool" ,libtool)
       ("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libxslt" ,libxslt)
       ("perl" ,perl)
       ("python" ,python-2)))
    (synopsis "Compiler and libraries for the C# programming language")
    (description "Mono is a compiler, vm, debugger and set of libraries for
C#, a C-style programming language from Microsoft that is very similar to
Java.")
    (home-page "https://www.mono-project.com/")
    (license license:x11)))

(define-public fsharp
  (package
    (name "fsharp")
    (version "10.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/fsharp/fsharp/archive/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "0kfc4kh93qjqqzirrvfjkx6s9vf6nwnwh22nj276cwbdganlnzjj"))))
    (build-system gnu-build-system)
    (arguments
      '(#:phases
        (modify-phases %standard-phases
          (delete 'configure))))
    (native-inputs
     `(("libtool" ,libtool)
       ("autoconf" ,autoconf)
       ("which" ,which)
       ("pkg-config" ,pkg-config)
       ("automake" ,automake)))
    (inputs
      `(("mono-6.0.0.311" ,mono-6.0.0.311)))
    (synopsis "Compiler and libraries for the C# programming language")
    (description "Mono is a compiler, vm, debugger and set of libraries for
C#, a C-style programming language from Microsoft that is very similar to
Java.")
    (home-page "https://www.mono-project.com/")
    (license license:x11)))

fsharp
