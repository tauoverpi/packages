(define-module (tau packages agda)
  #:use-module (gnu packages agda)
  #:use-module (guix build-system haskell)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public agda-stdlib
  (package
    (name "agda-stdlib")
    (version "1.3")
    (home-page "https://github.com/agda/agda-stdlib")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url home-page)
                                  (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "18kl20z3bjfgx5m3nvrdj5776qmpi7jl2p12pqybsls2lf86m0d5"))))
    (build-system haskell-build-system)
    (inputs
     `(("agda" ,agda)
       ("ghc-filemanip" ,ghc-filemanip)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;(delete 'configure)
         ;(add-before 'build 'patch-dependencies
           ;(lambda _ (patch-shebang "find-deps.sh") #t))
         (delete 'check)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out     (assoc-ref outputs "out"))
                    (include (string-append out "/include/agda/stdlib")))
               (for-each (lambda (file)
                           (make-file-writable file)
                           (install-file file include))
                         (find-files "." "\\.agdai?(-lib)?$"))
               #t))))))
    (synopsis "The Agda Standard Library")
    (description "")
    (license license:expat)))
