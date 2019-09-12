(define-module (levy packages idris)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (srfi srfi-1)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages idris)
  #:use-module (guix build-system gnu)
  #:use-module (guix utils))

(define ghc-megaparsec-7.0.4
  (package/inherit ghc-megaparsec
    (version "7.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://hackage.haskell.org/package/"
                           "megaparsec/megaparsec-"
                           version ".tar.gz"))
       (sha256
        (base32
         "1hg83m85f4v78mqdkznd1ddk9y32hnrv0bgva7ir3vydx37aanrj"))))
    (arguments
      (substitute-keyword-arguments
        `(#:cabal-revision #f)))))

(define ghc-network-2.7.0.0
  (package/inherit ghc-network
    (version "2.7.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/network/network-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "17qd387vxq2b27k4g56679flnvfvsm7vqf2mnssa0lvghks4c1f1"))))))

(define idris-1.3.2
  (package/inherit idris
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://hackage.haskell.org/package/"
                    "idris-" version "/idris-" version ".tar.gz"))
              (sha256
               (base32
                "0wychzkg0yghd2pp8fqz78vp1ayzks191knfpl7mhh8igsmb6bc7"))))
    (inputs
      `(("ghc-megaparsec-7.0.4" ,ghc-megaparsec-7.0.4)
        ("ghc-network-2.7.0.0" ,ghc-network-2.7.0.0)
        ,@(fold alist-delete
                (package-inputs idris)
                '("ghc-megaparsec" "ghc-network"))))))

(define-public idris2
  (package
    (name "idris2")
    (version "")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/edwinb/Idris2")
                     (commit "65db4fbf961cbdd36f10a9a75e7c3311b91f5585")))
              (sha256
                (base32
                  "0imdqqibxrzhqma2696x3q1fr9b7zqg4hc4lsph48yc01x8agdm6"))))
    (build-system gnu-build-system)
    (arguments
      '(#:make-flags (list (string-append "PREFIX=" %output))
        #:tests? #f
        #:phases
        (modify-phases %standard-phases
          (replace 'build
            (lambda _ (system* "make" "idris2") #t))
          (delete 'configure))))
    (native-inputs `(("idris" ,idris-1.3.2)))
    (synopsis "")
    (description "")
    (home-page "")
    (license #f)))

idris2
