(define-module (tau packages zig)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages llvm))

(define-public zig-0.6.0
  (package
    (version "0.6.0")
    (name "zig-0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ziglang.org/download/0.6.0/zig-"
                                  version ".tar.xz"))
              (sha256
                (base32
                  "013jkq2lwa39ksgbm978kcxp2qqpkvlkhyyibp9jsa2ljg0ps5jx"))))
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
        ("lld" ,lld)
        ("libxml2" ,libxml2)
        ("zlib" ,zlib)))
    (synopsis
      "Programming languaged designed for robustness, optimality, and clarity")
    (description "Zig is a general-purpose programming language and toolchain
for maintaining robust, optimal, and reusable software.

+Robust - behavior is correct even for edge cases such as out of memory.
+Optimal - write programs the best way they can behave and perform.
+Reusable - the same code works in many environments which have different
constraints.
+Maintainable - precisely communicate intent to the compiler and other
programmers. The language imposes a low overhead to reading code and is
resilient to changing requirements and environments.")
    (home-page "https://ziglang.org")
    (license license:expat)))

(define-public zig-0.6.0-master
  (let ((commit "c0654d2db2cd66ee59f2147fbbb19d890e70bed1"))
    (package
      (version (string-append "0.6.0+" (string-take commit 7)))
      (name "zig-0.6.0-master")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/ziglang/zig")
                       (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                  (base32
                    "0y0iddrq8b4g24bjg6g9hwpjkcyz06jf6qs9s4xxwp9had8ynk14"))))
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
          ("lld" ,lld)
          ("libxml2" ,libxml2)
          ("zlib" ,zlib)))
      (description
        "Programming languaged designed for robustness, optimality, and clarity")
      (synopsis description)
      (home-page "https://ziglang.org")
      (license license:expat))))
