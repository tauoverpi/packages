(define-module (levy packages haskell)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix licenses)
  #:use-module (guix build-system haskell)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages haskell-check))

(define-public ghc-mtl
  (package
    (name "ghc-mtl")
    (version "2.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/mtl/mtl-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1xmy5741h8cyy0d91ahvqdz2hykkk20l8br7lg1rccnkis5g80w8"))))
    (build-system haskell-build-system)
    (home-page "http://github.com/haskell/mtl")
    (synopsis
      "Monad classes, using functional dependencies")
    (description
      "Monad classes using functional dependencies, with instances for various monad transformers, inspired by the paper /Functional Programming with Overloading and Higher-Order Polymorphism/, by Mark P Jones, in /Advanced School of Functional Programming/, 1995 (<http://web.cecs.pdx.edu/~mpj/pubs/springschool.html>).")
    (license bsd-3)))

(define-public ghc-generate
  (package
    (name "ghc-generate")
    (version "0.2.4")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/haskell-generate/haskell-generate-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "120c3g7mwf1gnvmz4kdnmimanggcz18mwl0kprwwzwms4hq09rjy"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-haskell-src-exts" ,ghc-haskell-src-exts)))
    (native-inputs `(("ghc-doctest" ,ghc-doctest)))
    (home-page
      "http://github.com/bennofs/haskell-generate/")
    (synopsis
      "Typesafe generation of haskell source code")
    (description
      "This library provides an interface to generate haskell source code, verifying at compile time that the resulting code typechecks. See https://github.com/bennofs/haskell-generate for an introduction explaining how to use the library.")
    (license bsd-3)))

(define-public ghc-casing
  (package
    (name "ghc-casing")
    (version "0.1.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/casing/casing-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1mznhlbg8qd2yrjg23rq7s77bijn92nrfx7bvx9sw8sqxwqkd2lf"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-split" ,ghc-split)))
    (native-inputs
      `(("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (home-page
      "http://hackage.haskell.org/package/casing")
    (synopsis
      "Convert between various source code casing conventions")
    (description
      "Converts between camelCase, PascalCase, kebab-case, and three flavors of snake_case.")
    (license expat)))

(define-public ghc-godot
  (package
    (name "ghc-godot-haskell")
    (version "0.1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/godot-haskell/godot-haskell-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "02nvs84bq4nif235iycjwkxmabvs0avwm2xilpwv8kddv95z1f8i"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-casing" ,ghc-casing)
        ("ghc-colour" ,ghc-colour)
        ("ghc-generate" ,ghc-generate)
        ("ghc-lens" ,ghc-lens)
        ("ghc-linear" ,ghc-linear)
        ("ghc-mtl" ,ghc-mtl)
        ("ghc-stm" ,ghc-stm)
        ("ghc-text" ,ghc-text)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-vector" ,ghc-vector)
        ("ghc-ansi-wl-pprint" ,ghc-ansi-wl-pprint)
        ("ghc-parsec" ,ghc-parsec)
        ("ghc-parsers" ,ghc-parsers)))
    (home-page
      "https://github.com/SimulaVR/godot-haskell#readme")
    (synopsis
      "Haskell bindings for the Godot game engine API")
    (description
      "This package contains Haskell bindings for GDNative and the Godot API. For details and examples, see README.md This is intended to be used with Godot master 91e5782. Versioning scheme subject to change as I figure out a good way to maintain a link to the Godot versioning.")
    (license bsd-3)))

