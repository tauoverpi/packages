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

(define-public zig-0.7.0
  (package
    (version "0.7.0")
    (name "zig")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ziglang.org/download/0.7.0/zig-"
                                  version ".tar.xz"))
              (sha256
                (base32
                  "10sz8ibcfgzmj1d8a7x49jlbnl2iqlxikkz9h3dj6mxhqgv2rz8f"))))
    (build-system cmake-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:allow-other-keys inputs)
              (invoke "./zig" "test"
                 (string-append inputs "/src/test/stage1/behaviour.zig"))))
         (add-before 'build 'fix-build
           (lambda _
              (setenv "HOME" "/tmp")
              #t)))))
    (inputs
      `(("llvm" ,llvm-11)
        ("clang" ,clang-11)
        ("lld" ,lld)
        ("libxml2" ,libxml2)
        ("zlib" ,zlib)))
    (synopsis
      "Programming language designed for robustness, optimality, and clarity")
    (description "Zig is a general-purpose programming language and
toolchain for maintaining robust, optimal, and reusable software. Focus
on debugging your application rather than debugging your programming
language knowledge. There is no hidden control flow, no hidden memory
allocations, no preprocessor, and no macros.")
    (home-page "https://ziglang.org")
    (license license:expat)))

(define-public zig-0.7.1-master
  (let ((commit "8ab870cf56e499258e19b23062f1830c73dbe6a3"))
    (package
      (version (string-append "0.7.1+" (string-take commit 7)))
      (name "zig-master")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/ziglang/zig")
                       (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                  (base32
                    "1ra0s4mfd0fzpvzxs6m9zxgjj7ycp8kxb6h3m3g68b8d0gwbc9lv"))))
      (build-system cmake-build-system)
      (arguments
       `(#:tests? #f
         #:phases
         (modify-phases %standard-phases
           (delete 'strip)
           (add-before 'build 'fix-build
             (lambda _
                (setenv "HOME" "/tmp")
                #t)))))
      (inputs
        `(("llvm" ,llvm-11)
          ("clang" ,clang-11)
          ("lld" ,lld)
          ("libxml2" ,libxml2)
          ("zlib" ,zlib)))
      (description
        "Programming languaged designed for robustness, optimality, and clarity")
      (synopsis description)
      (home-page "https://ziglang.org")
      (license license:expat))))
