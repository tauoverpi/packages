(define-module (levy packages purescript)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system haskell)
  #:use-module (guix licenses)
  #:use-module (gnu packages haskell)
  #:use-module (levy packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web))

(define ghc-lifted-async-0.10.0.4
  (package
    (inherit ghc-lifted-async)
    (version "0.10.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/lifted-async/lifted-async-"
             version ".tar.gz"))
       (sha256
        (base32
         "0cwl1d0wjpdk0v1l1qxiqiksmak950c8gx169c1q77cg0z18ijf9"))))))

(define ghc-network-3.0.1.1
  (package
    (inherit ghc-network)
    (version "3.0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/network/network-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1xacvl5wf47cz61igb94zf961b9ks0yhr02myxgjf53clm70dg6j"))))))

(define-public purescript
  (package
    (name "purescript")
    (version "0.13.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/purescript/purescript-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0g4g2xsn3r5xxqndlyg1yxnsdgj27l5zll9q6wly119mkcllvvql"))))
    (build-system haskell-build-system)
    (arguments
      '(#:tests? #f)) ;; requires npm
    (inputs
      `(("ghc-glob" ,ghc-glob)
        ("ghc-aeson" ,ghc-aeson)
        ("ghc-aeson-better-errors"
         ,ghc-aeson-better-errors)
        ("ghc-aeson-pretty" ,ghc-aeson-pretty)
        ("ghc-ansi-terminal" ,ghc-ansi-terminal)
        ("ghc-base-compat" ,ghc-base-compat)
        ("ghc-blaze-html" ,ghc-blaze-html)
        ("ghc-bower-json" ,ghc-bower-json)
        ("ghc-boxes" ,ghc-boxes)
        ("ghc-cheapskate" ,ghc-cheapskate)
        ("ghc-clock" ,ghc-clock)
        ("ghc-data-ordlist" ,ghc-data-ordlist)
        ("ghc-dlist" ,ghc-dlist)
        ("ghc-edit-distance" ,ghc-edit-distance)
        ("ghc-file-embed" ,ghc-file-embed)
        ("ghc-fsnotify" ,ghc-fsnotify)
        ("ghc-language-javascript"
         ,ghc-language-javascript)
        ("ghc-lifted-async" ,ghc-lifted-async-0.10.0.4)
        ("ghc-lifted-base" ,ghc-lifted-base)
        ("ghc-microlens-platform"
         ,ghc-microlens-platform)
        ("ghc-monad-control" ,ghc-monad-control)
        ("ghc-monad-logger" ,ghc-monad-logger)
        ("ghc-parallel" ,ghc-parallel)
        ("ghc-pattern-arrows" ,ghc-pattern-arrows)
        ("ghc-protolude" ,ghc-protolude)
        ("ghc-regex-tdfa" ,ghc-regex-tdfa)
        ("ghc-safe" ,ghc-safe)
        ("ghc-scientific" ,ghc-scientific)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-sourcemap" ,ghc-sourcemap)
        ("ghc-split" ,ghc-split)
        ("ghc-stm" ,ghc-stm)
        ("ghc-stringsearch" ,ghc-stringsearch)
        ("ghc-syb" ,ghc-syb)
        ("ghc-transformers-base" ,ghc-transformers-base)
        ("ghc-transformers-compat"
         ,ghc-transformers-compat)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-utf8-string" ,ghc-utf8-string)
        ("ghc-vector" ,ghc-vector)
        ("ghc-ansi-wl-pprint" ,ghc-ansi-wl-pprint)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-network" ,ghc-network-3.0.1.1)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-wai" ,ghc-wai)
        ("ghc-wai-websockets" ,ghc-wai-websockets)
        ("ghc-warp" ,ghc-warp)
        ("ghc-websockets" ,ghc-websockets)
        ("ghc-gitrev" ,ghc-gitrev)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-hspec" ,ghc-hspec)
        ("ghc-hspec-discover" ,ghc-hspec-discover)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-alex" ,ghc-alex)
        ("ghc-happy" ,ghc-happy)
        ("ghc-tasty-golden" ,ghc-tasty-golden)
        ("ghc-tasty-hspec" ,ghc-tasty-hspec)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page "http://www.purescript.org/")
    (synopsis
      "PureScript Programming Language Compiler")
    (description
      "A small strongly, statically typed programming language with expressive types, inspired by Haskell and compiling to JavaScript.")
    (license bsd-3)))

;; TODO
(define-public purescript-native
  (package
    (name "purescript-native")
    (version "2019-07-25")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/andyarvanitis/purescript-native/archive/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1igphmfsza3b8fp85acwz56ildcf9hz3jwg589mg5zgjmsipr22w"))))
    (build-system haskell-build-system)
    (arguments
      '(#:phases
        (modify-phases %standard-phases
          (add-after 'unpack 'add-cabal-file
            (lambda _
              (with-output-to-file "purescript-native.cabal"
                (lambda _
                  (substitute* "app/Main.hs"
                    (("import Text.Printf")
                     "import Text.Printf\nimport System.FilePath\nimport Prelude"))
                  (install-file "app/Main.hs" "src")
                  (display "
cabal-version:  1.18
name:                pscpp
version:             0.1.0.0
license:             BSD3
author:              Andy Arvanitis
maintainer:          example@example.com
copyright:           2018 Andy Arvanitis

extra-source-files:     README.md
                        , ChangeLog.md
                        , runtime/*.h
                        , runtime/*.cpp

executable              pscpp
    main-is:            Main.hs
    buildable:          True
    ghc-options:        -Wall
    hs-source-dirs:     src
    build-depends:      base >= 4.7 && < 5
                        , bytestring >= 0.10.8.2 && < 0.11
                        , purescript -any
                        , base-compat >=0.6.0
                        , protolude >=0.1.6
                        , text
                        , containers
                        , filepath
                        , monad-parallel >= 0.7.2.2 && <0.8
                        , pattern-arrows >=0.0.2 && <0.1
                        , safe >=0.3.9 && <0.4
                        , transformers >=0.3.0 && <0.6
                        , mtl >=2.1.0 && <2.3.0
                        , aeson >=1.0 && <1.4
                        , directory -any
                        , process -any
                        , file-embed -any
                        , gitrev -any
    default-extensions: ConstraintKinds
                        , DataKinds
                        , DeriveFunctor
                        , EmptyDataDecls
                        , FlexibleContexts
                        , KindSignatures
                        , LambdaCase
                        , MultiParamTypeClasses
                        , NoImplicitPrelude
                        , PatternGuards
                        , PatternSynonyms
                        , RankNTypes
                        , RecordWildCards
                        , OverloadedStrings
                        , ScopedTypeVariables
                        , TupleSections
                        , ViewPatterns
"))))))))
    (native-inputs
      `(;("ghc-base" ,ghc-base)
        ("ghc-bytestring-builder" ,ghc-bytestring-builder)
        ("purescript" ,purescript)
        ("ghc-base-compat" ,ghc-base-compat)
        ("ghc-protolude" ,ghc-protolude)
        ("ghc-text" ,ghc-text)
        ("ghc-unordered-containers" ,ghc-unordered-containers)
        ("ghc-filepath" ,ghc-filepath)
        ("ghc-monad-parallel" ,ghc-monad-parallel)
        ("ghc-pattern-arrows" ,ghc-pattern-arrows)
        ("ghc-safe" ,ghc-safe)
        ("ghc-transformers-base" ,ghc-transformers-base)
        ("ghc-mtl" ,ghc-mtl)
        ("ghc-aeson" ,ghc-aeson)
        ("ghc-directory" ,ghc-directory)
        ("ghc-process" ,ghc-process)
        ("ghc-file-embed" ,ghc-file-embed)
        ("ghc-gitrev" ,ghc-gitrev)))
    (synopsis "")
    (description "")
    (home-page "")
    (license #f)))

(define-public psc-package
  (package
    (name "psc-package")
    (version "0.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://codeload.github.com/purescript/psc-package/tar.gz/v"
               version))
        (sha256
          (base32 "171gc0npvnm4c9ipwy8gk688bsvafnc0j0910mib0v7693n3bzbc"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-aeson-pretty" ,ghc-aeson-pretty)
        ("ghc-async" ,ghc-async)
        ("ghc-either" ,ghc-either)
        ("ghc-foldl" ,ghc-foldl)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-system-filepath" ,ghc-system-filepath)
        ("ghc-errors" ,ghc-errors)
        ("ghc-turtle" ,ghc-turtle)))
    (home-page
      "https://github.com/purescript/psc-package")
    (synopsis
      "An experimental package manager for PureScript")
    (description "")
    (license bsd-3)))

(package
  (name "ghc-spago")
  (version "0.9.0.0")
  (source
    (origin
      (method url-fetch)
      (uri (string-append
             "https://github.com/spacchetti/spago/archive/"
             version
             ".tar.gz"))
      (sha256
        (base32 "1fppf70zc13dszdar060kx38l7xqjx90qwb2d6mi0a84534srgx5"))))
  (build-system haskell-build-system)
  (arguments
    '(#:phases
      (modify-phases %standard-phases
        (add-after 'unpack 'add-cabal-file
          (lambda _
            (with-output-to-file "purescript-native.cabal"
              (lambda _
                (install-file "app/Main.hs" "src")
                (display "
cabal-version: 1.18
name:                spago
version:             0.9.0.0
license:             BSD3
author:              Justin Woo, Fabrizio Ferrai
maintainer:          @jusrin00, @fabferrai
copyright: 2018-2019 Justin Woo, Fabrizio Ferrai

executable               spago
    main-is:             Spago.hs
    buildable:           True
    hs-source-dirs:      src, app
    build-depends: base >= 4.7 && < 5
                 , turtle
                 , optparse-applicative
                 , base >= 4.7 && < 5
                 , text < 1.3
                 , Cabal
                 , turtle
                 , either
                 , filepath
                 , file-embed
                 , template-haskell
                 , aeson
                 , aeson-pretty
                 , containers
                 , bower-json
                 , dhall
                 , dhall-json
                 , bytestring
                 , prettyprinter
                 , async-pool
                 , process
                 , network-uri
                 , versions
                 , lens-family-core
                 , safe
                 , fsnotify
                 , Glob
                 , stm
                 , directory
                 , mtl
                 , exceptions
                 , unliftio
                 , vector
                 , temporary
                 , zlib
                 , tar
                 , foldl
                 , http-client
                 , http-conduit
                 , time
                 , either
                 , semver-range
                 , ansi-terminal
                 , unordered-containers
                 , retry
                 , github
    default-extensions: DeriveDataTypeable
                      , DeriveGeneric
                      , DerivingStrategies
                      , DuplicateRecordFields
                      , GeneralizedNewtypeDeriving
                      , LambdaCase
                      , RecordWildCards
                      , ScopedTypeVariables
                      , OverloadedStrings
                      , FlexibleContexts
                      , ConstraintKinds
                      , NoImplicitPrelude
                      , ApplicativeDo
                      , NamedFieldPuns
"))))))))

  (inputs
    `(("ghc-turtle" ,ghc-turtle)
      ("ghc-optparse-applicative"
       ,ghc-optparse-applicative)
      ("ghc-either" ,ghc-either)
      ("ghc-file-embed" ,ghc-file-embed)
      ("ghc-aeson" ,ghc-aeson)
      ("ghc-aeson-pretty" ,ghc-aeson-pretty)
      ("ghc-bower-json" ,ghc-bower-json)
      ("ghc-dhall" ,ghc-dhall)
      ("ghc-dhall-json" ,ghc-dhall-json)
      ("ghc-prettyprinter" ,ghc-prettyprinter)
      ("ghc-async-pool" ,ghc-async-pool)
      ("ghc-network-uri" ,ghc-network-uri)
      ("ghc-versions" ,ghc-versions)
      ("ghc-lens-family-core" ,ghc-lens-family-core)
      ("ghc-safe" ,ghc-safe)
      ("ghc-fsnotify" ,ghc-fsnotify)
      ("ghc-glob" ,ghc-glob)
      ("ghc-stm" ,ghc-stm)
      ("ghc-exceptions" ,ghc-exceptions)
      ("ghc-unliftio" ,ghc-unliftio)
      ("ghc-vector" ,ghc-vector)
      ("ghc-temporary" ,ghc-temporary)
      ("ghc-zlib" ,ghc-zlib)
      ("ghc-tar" ,ghc-tar)
      ("ghc-foldl" ,ghc-foldl)
      ("ghc-http-client" ,ghc-http-client)
      ("ghc-http-conduit" ,ghc-http-conduit)
      ("ghc-semver-range" ,ghc-semver-range)
      ("ghc-ansi-terminal" ,ghc-ansi-terminal)
      ("ghc-unordered-containers"
       ,ghc-unordered-containers)
      ("ghc-retry" ,ghc-retry)
      ("ghc-github" ,ghc-github)))
  (home-page
    "http://hackage.haskell.org/package/spago")
  (synopsis "")
  (description "")
  (license #f))


