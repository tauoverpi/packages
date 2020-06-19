(define-module (tau packages zig)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages llvm))

(define-public zig-0.5.0
  (package
    (version "0.5.0")
    (name "zig")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ziglang.org/download/"
                                  version "/zig-"
                                  version ".tar.xz"))
              (sha256
                (base32
                  "0ccahg6bfm9m1mzr5gqs2jd5a3idj1q8akwbz6fcnaqm1yb1dbjm"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'fix-build
           (lambda _ (setenv "HOME" "/tmp") #t)))))
    (inputs
      `(("llvm" ,llvm-9)
        ("clang" ,clang-9)
        ("libxml2" ,libxml2)
        ("zlib" ,zlib)))
    (description
      "Programming languaged designed for robustness, optimality, and clarity")
    (synopsis description)
    (home-page "https://ziglang.org")
    (license license:expat)))

(define-public lld-10
  (package
    (name "lld")
    (version "10.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                     "https://github.com/llvm/llvm-project/releases/download/llvmorg-"
                     version "/lld-" version".src.tar.xz"))
              (sha256
                (base32
                  "026pwcbczcg0j5c9h7hxxrn3ki81ia9m9sfn0sy0bvzffv2xg85r"))))
    (build-system cmake-build-system)
    (arguments '(#:tests? #f))
    (inputs `(("llvm" ,llvm-10)))
    (description "")
    (synopsis description)
    (home-page "")
    (license license:expat)))

;https://ziglang.org/builds/zig-0.6.0+6524a64bd.tar.xz
;https://ziglang.org/builds/zig-0.6.0+237c5429b.tar.xz
(define-public zig-0.6.0
  (package
    (version "0.6.0+237c5429b")
    (name "zig-0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ziglang.org/builds/zig-"
                                  version ".tar.xz"))
              (sha256
                (base32
                  "1r94vcf7jjqxy08jdnbrx8f0hysajxn8spyzc31sdpwpwbinn4ka"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'fix-build
           (lambda _
              (setenv "HOME" "/tmp")
              #t)))))
    (inputs
      `(("llvm" ,llvm-10)
        ("clang" ,clang-10)
        ("lld" ,lld-10)
        ("libxml2" ,libxml2)
        ("zlib" ,zlib)))
    (description
      "Programming languaged designed for robustness, optimality, and clarity")
    (synopsis description)
    (home-page "https://ziglang.org")
    (license license:expat)))


(define-public zig-0.5.0+28a6c136e
  (package/inherit zig-0.5.0
    (name "zig-master")
    (version "0.5.0+28a6c136e")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ziglang.org/builds/"
                                  "zig-"
                                  version
                                  ".tar.xz"))
              (sha256
                (base32
                  "0hfr1wm5hsbf8xwpaz680ajzbycjq1xpbsrk2njvpf59gbvy0xq4"))))))

(define-public zig-master zig-0.5.0+28a6c136e)

