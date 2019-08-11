(define-module (levy packages haskell)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix licenses)
  #:use-module (guix build-system haskell)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages haskell-crypto)
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

(define-public ghc-wai-app-static
  (package
    (name "ghc-wai-app-static")
    (version "3.1.6.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wai-app-static/wai-app-static-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0s6bpz5gmjy797bnnw1y5mwy9761h46bjp1srnrh7cxlnvm93c4c"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-wai" ,ghc-wai)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-unix-compat" ,ghc-unix-compat)
        ("ghc-old-locale" ,ghc-old-locale)
        ("ghc-file-embed" ,ghc-file-embed)
        ("ghc-cryptonite" ,ghc-cryptonite)
        ("ghc-memory" ,ghc-memory)
        ("ghc-http-date" ,ghc-http-date)
        ("ghc-blaze-html" ,ghc-blaze-html)
        ("ghc-blaze-markup" ,ghc-blaze-markup)
        ("ghc-mime-types" ,ghc-mime-types)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-zlib" ,ghc-zlib)
        ("ghc-wai-extra" ,ghc-wai-extra)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-warp" ,ghc-warp)))
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-network" ,ghc-network)
        ("ghc-temporary" ,ghc-temporary)
        ("ghc-mockery" ,ghc-mockery)))
    (home-page
      "http://www.yesodweb.com/book/web-application-interface")
    (synopsis "WAI application for static serving")
    (description
      "API docs and the README are available at <http://www.stackage.org/package/wai-app-sta
  tic>.")
    (license expat)))

(define-public ghc-tasty-hspec
  (package
    (name "ghc-tasty-hspec")
    (version "1.1.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/tasty-hspec/tasty-hspec-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0i9kdzjpk750sa078jj3iyhp72k0177zk7vxl131r6dkyz09x27y"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-hspec-core" ,ghc-hspec-core)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-smallcheck" ,ghc-tasty-smallcheck)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (arguments
      `(#:cabal-revision
        ("3"
         "1wgz3z5bnq5qml8d0i18gvz30dmmax3686lmqz3vf4hxd3vqfkpj")))
    (home-page
      "https://github.com/mitchellwrosen/tasty-hspec")
    (synopsis
      "Hspec support for the Tasty test framework.")
    (description
      "This package provides a Tasty provider for Hspec test suites.")
    (license bsd-3)))

(define-public ghc-bower-json
  (package
    (name "ghc-bower-json")
    (version "1.0.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/bower-json/bower-json-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0wvygg3rdbxzrmr61a9w6ddv9pfric85ih8hnxyk0ydzn7i59abs"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-aeson-better-errors"
         ,ghc-aeson-better-errors)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-scientific" ,ghc-scientific)
        ("ghc-vector" ,ghc-vector)))
    (native-inputs
      `(("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (home-page
      "https://github.com/hdgarrood/bower-json")
    (synopsis "Read bower.json from Haskell")
    (description
      "Bower is a package manager for the web (see <http://bower.io>). This package provides a data type and ToJSON/FromJSON instances for Bower's package manifest file, bower.json.")
    (license expat)))

(define-public ghc-hspec-discover
  (package
    (name "ghc-hspec-discover")
    (version "2.7.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/hspec-discover/hspec-discover-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0r47fm94wa6qrhp8cc1zzkjrxc32rnagfn9m9ga4dm6p6ydw4c8b"))))
    (build-system haskell-build-system)
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-hspec-meta" ,ghc-hspec-meta)))
    (home-page "http://hspec.github.io/")
    (synopsis
      "Automatically discover and run Hspec tests")
    (description
      "Automatically discover and run Hspec tests . <http://hspec.github.io/hspec-discover.html>")
    (license expat)))

(define-public ghc-websockets
  (package
    (name "ghc-websockets")
    (version "0.12.5.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/websockets/websockets-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0mkxl7iwl5pl2w0svji9248v4c0hi45k725jj5ybaknb73650ns4"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-base64-bytestring" ,ghc-base64-bytestring)
        ("ghc-bytestring-builder"
         ,ghc-bytestring-builder)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-network" ,ghc-network)
        ("ghc-random" ,ghc-random)
        ("ghc-sha" ,ghc-sha)
        ("ghc-streaming-commons" ,ghc-streaming-commons)
        ("ghc-entropy" ,ghc-entropy)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-hunit"
         ,ghc-test-framework-hunit)
        ("ghc-test-framework-quickcheck2"
         ,ghc-test-framework-quickcheck2)))
    (home-page "http://jaspervdj.be/websockets")
    (synopsis
      "A sensible and clean way to write WebSocket-capable servers in Haskell.")
    (description
      "This library allows you to write WebSocket-capable servers. . An example server: <https://github.com/jaspervdj/websockets/blob/master/example/server.lhs> . An example client: <https://github.com/jaspervdj/websockets/blob/master/example/client.hs> . See also: . * The specification of the WebSocket protocol: <http://www.whatwg.org/specs/web-socket-protocol/> . * The JavaScript API for dealing with WebSockets: <http://www.w3.org/TR/websockets/>")
    (license bsd-3)))

#f

(define-public ghc-wai-websockets
  (package
    (name "ghc-wai-websockets")
    (version "3.0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wai-websockets/wai-websockets-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0b2xmdsrsqpssyib53wbr6r8hf75789ndyyanv37sv99iyqcwz4i"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-wai" ,ghc-wai)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-network" ,ghc-network)
        ("ghc-websockets" ,ghc-websockets)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-warp" ,ghc-warp)
        ("ghc-wai-app-static" ,ghc-wai-app-static)
        ("ghc-file-embed" ,ghc-file-embed)))
    (home-page "http://github.com/yesodweb/wai")
    (synopsis
      "Provide a bridge between WAI and the websockets package.")
    (description
      "API docs and the README are available at <http://www.stackage.org/package/wai-websockets>.")
    (license expat)))

(define-public ghc-process
  (package
    (name "ghc-process")
    (version "1.6.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/process/process-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1x9vdcj4g19ibf34w96nzgv2blxx727z0xb7dq012ky04ssblx8j"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/process")
    (synopsis "Process libraries")
    (description
      "This package contains libraries for dealing with system processes. . The typed-proce
  ss package is a more recent take on a process API, which uses this package internally. It
   features better binary support, easier concurrency, and a more composable API. You can r
  ead more about it at <https://github.com/fpco/typed-process/#readme>.")
    (license bsd-3)))

(define-public ghc-sourcemap
  (package
    (name "ghc-sourcemap")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/sourcemap/sourcemap-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0ynfm44ym8y592wnzdwa0d05dbkffyyg5sm26y5ylzpynk64r85r"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-process" ,ghc-process)
        ("ghc-utf8-string" ,ghc-utf8-string)))
    (arguments
      `(#:cabal-revision
        ("1"
         "1f7q44ar6qfip8fsllg43jyn7r15ifn2r0vz32cbmx0sb0d38dax")
        #:tests? #f))
        (home-page
      "http://hackage.haskell.org/package/sourcemap")
    (synopsis
      "Implementation of source maps as proposed by Google and Mozilla.")
    (description
      "Implementation of source maps, revision 3, proposed by Google and Mozilla here <https://wiki.mozilla.org/DevTools/Features/SourceMap> and here <https://docs.google.com/document/d/1U1RGAehQwRypUTovF1KRlpiOFze0b-_2gc6fAH0KY0k/edit>")
    (license bsd-3)))

(define-public ghc-mtl-compat
  (package
    (name "ghc-mtl-compat")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/mtl-compat/mtl-compat-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "17iszr5yb4f17g8mq6i74hsamii8z6m2qfsmgzs78mhiwa7kjm8r"))))
    (build-system haskell-build-system)
    (arguments
      '(#:tests? #f
        #:phases
        (modify-phases %standard-phases
          (delete 'haddock))))
    (home-page
      "https://github.com/haskell-compat/mtl-compat")
    (synopsis
      "Backported Control.Monad.Except module from mtl")
    (description
      "This package backports the \"Control.Monad.Except\" module from @mtl@ (if using @mtl-2.2.0.1@ or earlier), which reexports the @ExceptT@ monad transformer and the @MonadError@ class. . This package should only be used if there is a need to use the @Control.Monad.Except@ module specifically. If you just want the @mtl@ class instances for @ExceptT@, use @transformers-compat@ instead, since @mtl-compat@ does nothing but reexport the instances from that package. . Note that unlike how @mtl-2.2@ or later works, the \"Control.Monad.Except\" module defined in this package exports all of @ExceptT@'s monad class instances. Therefore, you may have to declare @import Control.Monad.Except ()@ at the top of your file to get all of the @ExceptT@ instances in scope.")
    (license bsd-3)))

(define-public ghc-protolude
  (package
    (name "ghc-protolude")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/protolude/protolude-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0zzkyxz0vmcbncpid7gp72fpjj0fla3gqhlfkij5c5lg12skjgfj"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-async" ,ghc-async)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-stm" ,ghc-stm)
        ("ghc-mtl-compat" ,ghc-mtl-compat)
        ("ghc-transformers-compat"
         ,ghc-transformers-compat)))
    (home-page "https://github.com/sdiehl/protolude")
    (synopsis "A small prelude.")
    (description
      "A sensible set of defaults for writing custom Preludes.")
    (license expat)))

(define-public ghc-pattern-arrows
  (package
    (name "ghc-pattern-arrows")
    (version "0.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/pattern-arrows/pattern-arrows-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "13q7bj19hd60rnjfc05wxlyck8llxy11z3mns8kxg197wxrdkhkg"))))
    (build-system haskell-build-system)
    (home-page
      "http://blog.functorial.com/posts/2013-10-27-Pretty-Printing-Arrows.html")
    (synopsis "Arrows for Pretty Printing")
    (description
      "A library for generating concise pretty printers based on precedence rules.")
    (license expat)))

(define-public ghc-utf8-light
  (package
    (name "ghc-utf8-light")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/utf8-light/utf8-light-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0rwyc5z331yfnm4hpx0sph6i1zvkd1z10vvglhnp0vc9wy644k0q"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/utf8-light")
    (synopsis "Unicode")
    (description "Lightweight UTF8 handling.")
    (license bsd-3)))

(define-public ghc-language-javascript
  (package
    (name "ghc-language-javascript")
    (version "0.6.0.13")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/language-javascript/language-javascript-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0dzvbnzkrxg9v78x2g7mhhr76viyxcgjyqpksaw7l0p1x7brjsck"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-blaze-builder" ,ghc-blaze-builder)
        ("ghc-utf8-string" ,ghc-utf8-string)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-hspec" ,ghc-hspec)
        ("ghc-happy" ,ghc-happy)
        ("ghc-alex" ,ghc-alex)
        ("ghc-utf8-light" ,ghc-utf8-light)))
    (home-page
      "https://github.com/erikd/language-javascript")
    (synopsis "Parser for JavaScript")
    (description
      "Parses Javascript into an Abstract Syntax Tree (AST).  Initially intended as frontend to hjsmin. . Note: Version 0.5.0 breaks compatibility with prior versions, the AST has been reworked to allow round trip processing of JavaScript.")
    (license bsd-3)))

(define-public ghc-aeson-better-errors
  (package
    (name "ghc-aeson-better-errors")
    (version "0.9.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/aeson-better-errors/aeson-better-errors-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "09vkyrhwak3bmpfsqcd2az8hfqqkxyhg468hv5avgisy0nzh3w38"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-dlist" ,ghc-dlist)
        ("ghc-scientific" ,ghc-scientific)
        ("ghc-vector" ,ghc-vector)
        ("ghc-transformers-compat"
         ,ghc-transformers-compat)
        ("ghc-void" ,ghc-void)))
    (home-page
      "https://github.com/hdgarrood/aeson-better-errors")
    (synopsis
      "Better error messages when decoding JSON values.")
    (description
      "A small package which gives you the tools to build parsers to decode JSON values, and gives good error messages when parsing fails. See also <http://harry.garrood.me/blog/aeson-better-errors/>.")
    (license expat)))

(define-public ghc-filepath
  (package
    (name "ghc-filepath")
    (version "1.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/filepath/filepath-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0bnryq00xbcsswxmahl42x85bfh23mxsap0gq8q0dm1v67ij7a0q"))))
    (build-system haskell-build-system)
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)))
    (home-page
      "https://github.com/haskell/filepath#readme")
    (synopsis
      "Library for manipulating FilePaths in a cross platform way.")
    (description
      "This package provides functionality for manipulating @FilePath@ values, and is shipped with both <https://www.haskell.org/ghc/ GHC> and the <https://www.haskell.org/platform/ Haskell Platform>. It provides three modules: . * \"System.FilePath.Posix\" manipulates POSIX\\/Linux style @FilePath@ values (with @\\/@ as the path separator). . * \"System.FilePath.Windows\" manipulates Windows style @FilePath@ values (with either @\\\\@ or@\\/@ as the path separator, and deals with drives). . * \"System.FilePath\" is an alias for the module appropriate to your platform. . All three modules provide the same API, and the same documentation (calling out differences in the different variants).")
    (license bsd-3)))

(define-public ghc-directory
  (package
    (name "ghc-directory")
    (version "1.3.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/directory/directory-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0zkqihmdfz7bzv3sxh1p9ijl4vra880kfy3qy9h96flq7d2if0f2"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/directory")
    (synopsis
      "Platform-agnostic library for filesystem operations")
    (description
      "This library provides a basic set of operations for manipulating files and director
  ies in a portable way.")
    (license bsd-3)))

(define-public ghc-monad-parallel
  (package
    (name "ghc-monad-parallel")
    (version "0.7.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/monad-parallel/monad-parallel-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "12ahni860pfkdj70f9d0dg2h93gl0d9qav8llcmgh5z7dg1vi3qj"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-parallel" ,ghc-parallel)
        ("ghc-transformers-compat"
         ,ghc-transformers-compat)))
    (home-page
      "http://trac.haskell.org/SCC/wiki/monad-parallel")
    (synopsis
      "Parallel execution of monadic computations")
    (description
      "This package defines classes of monads that can perform multiple executions in para
  llel and combine their results. For any monad that's an instance of the class, the packa
  ge re-implements a subset of the Control.Monad interface, but with parallel execution.")
    (license bsd-3)))


