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

(define-public ghc-optional-args
  (package
    (name "ghc-optional-args")
    (version "1.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/optional-args/optional-args-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1r5hhn6xvc01grggxdyy48daibwzi0aikgidq0ahpa6bfynm8d1f"))))
    (build-system haskell-build-system)
    (arguments
      `(#:cabal-revision
        ("1"
         "0fda6mhm44qpbc9hfkf6jxnm3a7qszabywsmxa2iw0dz734a9xl3")))
    (home-page
      "http://hackage.haskell.org/package/optional-args")
    (synopsis "Optional function arguments")
    (description
      "This library provides a type for specifying `Optional` function arguments . Read the
 tutorial in \"Data.Optional\" to learn more")
    (license bsd-3)))

(define-public ghc-managed
  (package
    (name "ghc-managed")
    (version "1.0.6")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/managed/managed-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1kbrw99yh5x5blykmx2n88mplbbi4ss1ij5j17b7asw6q0ihm9zi"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/managed")
    (synopsis "A monad for managed values")
    (description
      "In Haskell you very often acquire values using the @with...@ idiom using functions o
f type @(a -> IO r) -> IO r@.  This idiom forms a @Monad@, which is a special case of the @
ContT@ monad (from @transformers@) or the @Codensity@ monad (from @kan-extensions@).  The m
ain purpose behind this package is to provide a restricted form of these monads specialized
 to this unusually common case. . The reason this package defines a specialized version of
these types is to: . * be more beginner-friendly, . * simplify inferred types and error mes
sages, and: . * provide some additional type class instances that would otherwise be orphan
 instances")
    (license bsd-3)))

(define-public ghc-turtle
  (package
    (name "ghc-turtle")
    (version "1.5.14")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/turtle/turtle-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "10sxbmis82z5r2ksfkik5kryz5i0xwihz9drc1dzz4fb76kkb67z"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-ansi-wl-pprint" ,ghc-ansi-wl-pprint)
        ("ghc-async" ,ghc-async)
        ("ghc-clock" ,ghc-clock)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-foldl" ,ghc-foldl)
        ("ghc-hostname" ,ghc-hostname)
        ("ghc-managed" ,ghc-managed)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-system-filepath" ,ghc-system-filepath)
        ("ghc-system-fileio" ,ghc-system-fileio)
        ("ghc-stm" ,ghc-stm)
        ("ghc-temporary" ,ghc-temporary)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-optional-args" ,ghc-optional-args)
        ("ghc-unix-compat" ,ghc-unix-compat)))
    (native-inputs `(("ghc-doctest" ,ghc-doctest)))
    (arguments
      `(#:cabal-revision
        ("3"
         "0rmmfqsphhv7h72a8lbdbpqi3rc4k6k83x8p9mamh57108qrs3xy")))
    (home-page
      "http://hackage.haskell.org/package/turtle")
    (synopsis "Shell programming, Haskell-style")
    (description
      "@turtle@ is a reimplementation of the Unix command line environment in Haskell so th
at you can use Haskell as both a shell and a scripting language. . Features include: . * Ba
tteries included: Command an extended suite of predefined utilities . * Interoperability: Y
ou can still run external shell commands . * Portability: Works on Windows, OS X, and Linux
 . * Exception safety: Safely acquire and release resources . * Streaming: Transform or fol
d command output in constant space . * Patterns: Use typed regular expressions that can par
se structured values . * Formatting: Type-safe @printf@-style text formatting . * Modern: S
upports @text@ and @system-filepath@ . Read \"Turtle.Tutorial\" for a detailed tutorial or
\"Turtle.Prelude\" for a quick-start guide . @turtle@ is designed to be beginner-friendly,
but as a result lacks certain features, like tracing commands.  If you feel comfortable usi
ng @turtle@ then you should also check out the @Shelly@ library which provides similar func
tionality.")
    (license bsd-3)))
(define-public ghc-ghcid
  (package
    (name "ghc-ghcid")
    (version "0.7.5")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/ghcid/ghcid-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0ics4ibkr9p8pd81hfr7wk1wi10rjbsmwqcln8sda61p9v46pdh4"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-extra" ,ghc-extra)
        ("ghc-ansi-terminal" ,ghc-ansi-terminal)
        ("ghc-cmdargs" ,ghc-cmdargs)
        ("ghc-fsnotify" ,ghc-fsnotify)
        ("ghc-terminal-size" ,ghc-terminal-size)))
    (native-inputs
      `(("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (home-page
      "https://github.com/ndmitchell/ghcid#readme")
    (synopsis "GHCi based bare bones IDE")
    (description
      "Either \\\"GHCi as a daemon\\\" or \\\"GHC + a bit of an IDE\\\". A very simple Haskell development tool which shows you the errors in your project and updates them whenever you save. Run @ghcid --topmost --command=ghci@, where @--topmost@ makes the window on top of all others (Windows only) and @--command@ is the command to start GHCi on your project (defaults to @ghci@ if you have a @.ghci@ file, or else to @cabal repl@).")
    (license bsd-3)))

(define-public ghc-optional-args
  (package
    (name "ghc-optional-args")
    (version "1.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/optional-args/optional-args-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1r5hhn6xvc01grggxdyy48daibwzi0aikgidq0ahpa6bfynm8d1f"))))
    (build-system haskell-build-system)
    (arguments
      `(#:cabal-revision
        ("1"
         "0fda6mhm44qpbc9hfkf6jxnm3a7qszabywsmxa2iw0dz734a9xl3")))
    (home-page
      "http://hackage.haskell.org/package/optional-args")
    (synopsis "Optional function arguments")
    (description
      "This library provides a type for specifying `Optional` function arguments . Read the tutorial in \"Data.Optional\" to learn more")
    (license bsd-3)))

(define-public ghc-managed
  (package
    (name "ghc-managed")
    (version "1.0.6")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/managed/managed-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1kbrw99yh5x5blykmx2n88mplbbi4ss1ij5j17b7asw6q0ihm9zi"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/managed")
    (synopsis "A monad for managed values")
    (description
      "In Haskell you very often acquire values using the @with...@ idiom using functions of type @(a -> IO r) -> IO r@.  This idiom forms a @Monad@, which is a special case of the @ContT@ monad (from @transformers@) or the @Codensity@ monad (from @kan-extensions@).  The main purpose behind this package is to provide a restricted form of these monads specialized to this unusually common case. . The reason this package defines a specialized version of these types is to: . * be more beginner-friendly, . * simplify inferred types and error messages, and: . * provide some additional type class instances that would otherwise be orphan instances")
    (license bsd-3)))

(define-public ghc-turtle
  (package
    (name "ghc-turtle")
    (version "1.5.14")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/turtle/turtle-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "10sxbmis82z5r2ksfkik5kryz5i0xwihz9drc1dzz4fb76kkb67z"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-ansi-wl-pprint" ,ghc-ansi-wl-pprint)
        ("ghc-async" ,ghc-async)
        ("ghc-clock" ,ghc-clock)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-foldl" ,ghc-foldl)
        ("ghc-hostname" ,ghc-hostname)
        ("ghc-managed" ,ghc-managed)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-system-filepath" ,ghc-system-filepath)
        ("ghc-system-fileio" ,ghc-system-fileio)
        ("ghc-stm" ,ghc-stm)
        ("ghc-temporary" ,ghc-temporary)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-optional-args" ,ghc-optional-args)
        ("ghc-unix-compat" ,ghc-unix-compat)))
    (native-inputs `(("ghc-doctest" ,ghc-doctest)))
    (arguments
      `(#:cabal-revision
        ("3"
         "0rmmfqsphhv7h72a8lbdbpqi3rc4k6k83x8p9mamh57108qrs3xy")))
    (home-page
      "http://hackage.haskell.org/package/turtle")
    (synopsis "Shell programming, Haskell-style")
    (description
      "@turtle@ is a reimplementation of the Unix command line environment in Haskell so that you can use Haskell as both a shell and a scripting language. . Features include: . * Batteries included: Command an extended suite of predefined utilities . * Interoperability: You can still run external shell commands . * Portability: Works on Windows, OS X, and Linux . * Exception safety: Safely acquire and release resources . * Streaming: Transform or fold command output in constant space . * Patterns: Use typed regular expressions that can parse structured values . * Formatting: Type-safe @printf@-style text formatting . * Modern: Supports @text@ and @system-filepath@ . Read \"Turtle.Tutorial\" for a detailed tutorial or \"Turtle.Prelude\" for a quick-start guide . @turtle@ is designed to be beginner-friendly, but as a result lacks certain features, like tracing commands.  If you feel comfortable using @turtle@ then you should also check out the @Shelly@ library which provides similar functionality.")
    (license bsd-3)))

(define-public ghc-spoon
  (package
    (name "ghc-spoon")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/spoon/spoon-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1m41k0mfy6fpfrv2ym4m5jsjaj9xdfl2iqpppd3c4d0fffv51cxr"))))
    (build-system haskell-build-system)
    (arguments
      `(#:cabal-revision
        ("1"
         "09s5jjcsg4g4qxchq9g2l4i9d5zh3rixpkbiysqcgl69kj8mwv74")))
    (home-page
      "http://hackage.haskell.org/package/spoon")
    (synopsis
      "Catch errors thrown from pure computations.")
    (description
      "Takes an error-throwing expression and puts it back in the Maybe it belongs in. . Note that this suffers from the <https://ghc.haskell.org/trac/ghc/ticket/5902 asynchronous exceptions re-thrown as synchronous> problem. Buyer beware.")
    (license bsd-3)))

(define-public ghc-serialise
  (package
    (name "ghc-serialise")
    (version "0.2.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/serialise/serialise-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "19ary6ivzk8z7wcxhm860qmh7pwqj0qjqzav1h42y85l608zqgh4"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-cborg" ,ghc-cborg)
        ("ghc-half" ,ghc-half)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-primitive" ,ghc-primitive)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-vector" ,ghc-vector)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
        ("ghc-quickcheck-instances"
         ,ghc-quickcheck-instances)))
    (arguments
      `(#:cabal-revision
        ("1"
         "1rknhad1i8bpknsnphmcmb6dnb48c2p2c13ia2qqch3hkhsvfpr6")))
    (home-page "https://github.com/well-typed/cborg")
    (synopsis
      "A binary serialisation library for Haskell values.")
    (description
      "This package (formerly @binary-serialise-cbor@) provides pure, efficient serialization of Haskell values directly into @ByteString@s for storage or transmission purposes. By providing a set of type class instances, you can also serialise any custom data type you have as well. . The underlying binary format used is the 'Concise Binary Object Representation', or CBOR, specified in RFC 7049. As a result, serialised Haskell values have implicit structure outside of the Haskell program itself, meaning they can be inspected or analyzed without custom tools. . An implementation of the standard bijection between CBOR and JSON is provided by the [cborg-json](/package/cborg-json) package. Also see [cbor-tool](/package/cbor-tool) for a convenient command-line utility for working with CBOR data.")
    (license bsd-3)))

(define-public ghc-repline
  (package
    (name "ghc-repline")
    (version "0.2.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/repline/repline-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0yxfn6p4gprnv8hzpzh7872fs3l661d587v4kkp51mjyydpiihs5"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-fail" ,ghc-fail)))
    (home-page "https://github.com/sdiehl/repline")
    (synopsis
      "Haskeline wrapper for GHCi-like REPL interfaces.")
    (description
      "Haskeline wrapper for GHCi-like REPL interfaces. Composable with normal mtl transformers.")
    (license expat)))

(define-public ghc-prettyprinter-ansi-terminal
  (package
    (name "ghc-prettyprinter-ansi-terminal")
    (version "1.1.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/prettyprinter-ansi-terminal/prettyprinter-ansi-terminal-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0ha6vz707qzb5ky7kdsnw2zgphg2dnxrpbrxy8gaw119vwhb9q6k"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-ansi-terminal" ,ghc-ansi-terminal)
        ("ghc-prettyprinter" ,ghc-prettyprinter)))
    (native-inputs `(("ghc-doctest" ,ghc-doctest)))
    (home-page
      "http://github.com/quchen/prettyprinter")
    (synopsis
      "ANSI terminal backend for the Â»prettyprinterÂ« package.")
    (description "See README.md")
    (license bsd-2)))

(define-public ghc-pgp-wordlist
  (package
    (name "ghc-pgp-wordlist")
    (version "0.1.0.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/pgp-wordlist/pgp-wordlist-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "15g6qh0fb7kjj3l0w8cama7cxgnhnhybw760md9yy7cqfq15cfzg"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-vector" ,ghc-vector)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
        ("ghc-doctest" ,ghc-doctest)))
    (home-page
      "https://github.com/quchen/pgp-wordlist")
    (synopsis
      "Translate between binary data and a human-readable collection of words.")
    (description
      "Translate between binary data and a human-readable collection of words. . The PGP Word List consists of two phonetic alphabets, each with one word per possible byte value. A string of bytes is translated with these alphabets, alternating between them at each byte. . The PGP words corresponding to the bytes @5B 1D CA 6E@ are \"erase breakaway spellbind headwaters\", for example. . For further information, see <http://en.wikipedia.org/wiki/PGP_word_list Wikipedia>.")
    (license bsd-3)))

(define-public ghc-prettyprinter
  (package
    (name "ghc-prettyprinter")
    (version "1.2.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/prettyprinter/prettyprinter-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0rh5bb6inq4yvv6r53sc1q3msmpvjcq8fw4sn3vwivrq44c7nf8i"))))
    (build-system haskell-build-system)
    (native-inputs
      `(("ghc-doctest" ,ghc-doctest)
        ("ghc-pgp-wordlist" ,ghc-pgp-wordlist)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
      "http://github.com/quchen/prettyprinter")
    (synopsis
      "A modern, easy to use, well-documented, extensible pretty-printer.")
    (description
      "A modern, easy to use, well-documented, extensible pretty-printer. For more see README.md")
    (license bsd-2)))

(define-public ghc-lens-family-core
  (package
    (name "ghc-lens-family-core")
    (version "2.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/lens-family-core/lens-family-core-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0ni6s873hy2h3b316835ssmlyr05yinb3a8jq5b01p9ppp9zrd0r"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/lens-family-core")
    (synopsis "Haskell 2022 Lens Families")
    (description
      "This package provides first class(â\x80\xa0) functional references in Van Laarhoven style supporting the following optics: . * Lenses (view, over) . * Traversals (toListOf, matching, over) . * Setters (over) . * Grates (zipWithOf, under, review) . * Resetters (under) . * Adapters (view, review) . * Grids (toListOf, over / under, review) . * Prisms (matching, over / under, review) . * Getters (view) . * Folders (toListOf) . * Reviewers (review) . (â\x80\xa0) For optimal first-class support use the @lens-family@ package with rank 2 / rank N polymorphism. \"Lens.Family.Clone\" allows for first-class support of lenses and traversals for those who cannot support rank 2 polymorphism.")
    (license bsd-3)))

(define-public ghc-dotgen
  (package
    (name "ghc-dotgen")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/dotgen/dotgen-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "148q93qsmqgr5pzdwvpjqfd6bdm1pwzcp2rblfwswx2x8c5f43fg"))))
    (build-system haskell-build-system)
    (home-page "https://github.com/ku-fpg/dotgen")
    (synopsis
      "A simple interface for building .dot graph files.")
    (description
      "This package provides a simple interface for building .dot graph files, for input into the dot and graphviz tools. It includes a monadic interface for building graphs.")
    (license bsd-3)))

(define-public ghc-cborg-json
  (package
    (name "ghc-cborg-json")
    (version "0.2.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/cborg-json/cborg-json-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "01i0npbwf6cnjkwwk0l4fnwlbjhsj7vn3d4zd202hcnxdm7bbdiz"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-aeson-pretty" ,ghc-aeson-pretty)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-scientific" ,ghc-scientific)
        ("ghc-vector" ,ghc-vector)
        ("ghc-cborg" ,ghc-cborg)))
    (home-page "https://github.com/well-typed/cborg")
    (synopsis "A library for encoding JSON as CBOR")
    (description
      "This package implements the bijection between JSON and CBOR defined in the CBOR specification, RFC 7049.")
    (license bsd-3)))

(define-public ghc-cborg
  (package
    (name "ghc-cborg")
    (version "0.2.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/cborg/cborg-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1rdnvy0w17s70ikmbyrnwax5rvqh19l95sh8i7ipgxi23z1r0bp1"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-half" ,ghc-half)
        ("ghc-primitive" ,ghc-primitive)))
    (native-inputs
      `(("ghc-base-orphans" ,ghc-base-orphans)
        ("ghc-aeson" ,ghc-aeson)
        ("ghc-base64-bytestring" ,ghc-base64-bytestring)
        ("ghc-base16-bytestring" ,ghc-base16-bytestring)
        ("ghc-fail" ,ghc-fail)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-random" ,ghc-random)
        ("ghc-scientific" ,ghc-scientific)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
        ("ghc-vector" ,ghc-vector)))
    (home-page
      "http://hackage.haskell.org/package/cborg")
    (synopsis
      "Concise Binary Object Representation (CBOR)")
    (description
      "This package provides an efficient implementation of the Concise Binary Object Representation (CBOR), as specified by [RFC 7049](https://tools.ietf.org/html/rfc7049). . If you are looking for a library for serialisation of Haskell values, have a look at the [serialise](/package/serialise) package, which is built upon this library. . An implementation of the standard bijection between CBOR and JSON is provided by the [cborg-json](/package/cborg-json) package. Also see [cbor-tool](/package/cbor-tool) for a convenient command-line utility for working with CBOR data. . This package was formerly known as @binary-serialise-cbor@.")
    (license bsd-3)))

(define-public ghc-th-lift
  (package
    (name "ghc-th-lift")
    (version "0.8.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/th-lift/th-lift-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1a6qlbdg15cfr5rvl9g3blgwx4v1p0xic0pzv13zx165xbc36ld0"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-th-abstraction" ,ghc-th-abstraction)))
    (home-page "http://github.com/mboes/th-lift")
    (synopsis
      "Derive Template Haskell's Lift class for datatypes.")
    (description
      "Derive Template Haskell's Lift class for datatypes using @TemplateHaskell@ . * <https://hackage.haskell.org/package/th-orphans th-orphans> package provides instances for @template-haskell@ syntax types . * <http://hackage.haskell.org/package/th-lift-instances th-lift-instances> package provides @Lift@ (compat) instances for types in @base@, @text@, @bytestring@, @vector@ etc.")
    (license bsd-3)))

(define-public ghc-th-lift-instances
  (package
    (name "ghc-th-lift-instances")
    (version "0.1.14")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/th-lift-instances/th-lift-instances-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0r1b4jnvcj64wp4hfccwkl4a70n1p1q7qzyx6ax7cmd8k961jz78"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-vector" ,ghc-vector)
        ("ghc-th-lift" ,ghc-th-lift)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)))
    (home-page
      "http://github.com/bennofs/th-lift-instances/")
    (synopsis
      "Lift instances for template-haskell for common data types.")
    (description
      "Most data types in haskell platform do not have Lift instances. This package provides orphan instances for containers, text, bytestring and vector. It also acts as a compat instances, definining instances not existing in @template-haskell@ . Note that <https://hackage.haskell.org/package/th-lift th-lift> package provides Template Haskell based derivation of @Lift@ instances (when you cannot use @DeriveLift@ extension), and <https://hackage.haskell.org/package/th-orphans th-orphans> package provides instances for TH datatypes.")
    (license bsd-3)))

(define ghc-lens-family-core-1.0.0
  (package
    (inherit ghc-lens-family-core)
    (version "1.0.0")
    (inputs `(("ghc-transformers-base" ,ghc-transformers-base-0.2.0)))
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/lens-family-core/lens-family-core-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "149wfxddw58h5q42r3nknmac8wsc9c8xzsw6vrlfb4yasg7bhw53"))))))

(define-public ghc-dhall
  (package
    (name "ghc-dhall")
    (version "1.22.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/dhall/dhall-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0f80vxry3vns6kyviradvpn32nkcl51lva5j2naakdg9kgcq4xxz"))))
    (build-system haskell-build-system)
    (arguments
      '(#:tests? #f))
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-aeson-pretty" ,ghc-aeson-pretty)
        ("ghc-ansi-terminal" ,ghc-ansi-terminal)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-cborg" ,ghc-cborg)
        ("ghc-cborg-json" ,ghc-cborg-json)
        ("ghc-contravariant" ,ghc-contravariant)
        ("ghc-cryptonite" ,ghc-cryptonite)
        ("ghc-diff" ,ghc-diff)
        ("ghc-dotgen" ,ghc-dotgen)
        ("ghc-either" ,ghc-either)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-lens-family-core" ,ghc-lens-family-core-1.0.0)
        ("ghc-megaparsec" ,ghc-megaparsec-7)
        ("ghc-memory" ,ghc-memory)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-parsers" ,ghc-parsers)
        ("ghc-prettyprinter" ,ghc-prettyprinter)
        ("ghc-prettyprinter-ansi-terminal"
         ,ghc-prettyprinter-ansi-terminal)
        ("ghc-profunctors" ,ghc-profunctors)
        ("ghc-repline" ,ghc-repline)
        ("ghc-serialise" ,ghc-serialise)
        ("ghc-scientific" ,ghc-scientific)
        ("ghc-th-lift-instances" ,ghc-th-lift-instances)
        ("ghc-transformers-compat"
         ,ghc-transformers-compat)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-uri-encode" ,ghc-uri-encode)
        ("ghc-vector" ,ghc-vector)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-http-client" ,ghc-http-client)
        ("ghc-http-client-tls" ,ghc-http-client-tls)))
    (native-inputs
      `(("ghc-foldl" ,ghc-foldl)
;        ("ghc-quickcheck" ,ghc-quickcheck)
;        ("ghc-quickcheck-instances"
;         ,ghc-quickcheck-instances)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-spoon" ,ghc-spoon)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
        ("ghc-turtle" ,ghc-turtle)
        ("ghc-mockery" ,ghc-mockery)
        ("ghc-doctest" ,ghc-doctest)))
    (home-page
      "http://hackage.haskell.org/package/dhall")
    (synopsis
      "A configuration language guaranteed to terminate")
    (description
      "Dhall is an explicitly typed configuration language that is not Turing complete.  Despite being Turing incomplete, Dhall is a real programming language with a type-checker and evaluator. . Use this library to parse, type-check, evaluate, and pretty-print the Dhall configuration language.  This package also includes an executable which type-checks a Dhall file and reduces the file to a fully evaluated normal form. . Read \"Dhall.Tutorial\" to learn how to use this library")
    (license bsd-3)))

(define-public ghc-libyaml
  (package
    (name "ghc-libyaml")
    (version "0.1.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/libyaml/libyaml-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0psznm9c3yjsyj9aj8m2svvv9m2v0x90hnwarcx5sbswyi3l00va"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-conduit" ,ghc-conduit)
        ("ghc-resourcet" ,ghc-resourcet)))
    (home-page
      "https://github.com/snoyberg/yaml#readme")
    (synopsis "Low-level, streaming YAML interface.")
    (description
      "README and API documentation are available at <https://www.stackage.org/package/libyaml>")
    (license bsd-3)))

(define-public ghc-dhall-json
  (package
    (name "ghc-dhall-json")
    (version "1.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/dhall-json/dhall-json-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "176i30shaklranbhmb4m4zqn13cn9hd6lqiqdjv9qmckkapbkjpi"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-aeson-pretty" ,ghc-aeson-pretty)
        ("ghc-dhall" ,ghc-dhall)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-scientific" ,ghc-scientific)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-vector" ,ghc-vector)
        ("ghc-libyaml" ,ghc-libyaml)
        ("ghc-yaml" ,ghc-yaml)
        ("ghc-ansi-terminal" ,ghc-ansi-terminal)
        ("ghc-prettyprinter" ,ghc-prettyprinter)
        ("ghc-prettyprinter-ansi-terminal"
         ,ghc-prettyprinter-ansi-terminal)))
    (native-inputs
      `(("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (home-page
      "http://hackage.haskell.org/package/dhall-json")
    (synopsis
      "Convert between Dhall and JSON or YAML")
    (description
      "Use this package if you want to convert between Dhall expressions and JSON or YAML. You can use this package as a library or an executable: . * See the \"Dhall.JSON\" module if you want to use this package as a library . * Use the @dhall-to-json@ or @dhall-to-yaml@ programs from this package if you want an executable . The \"Dhall.JSON\" module also contains instructions for how to use this package")
    (license bsd-3)))

(define-public ghc-async-pool
  (package
    (name "ghc-async-pool")
    (version "0.9.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/async-pool/async-pool-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1wg78y80zd7qyizyis073dmmvq4s67ni1pkaq31jl5klr49rs5g0"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-fgl" ,ghc-fgl)
        ("ghc-async" ,ghc-async)
        ("ghc-stm" ,ghc-stm)
        ("ghc-transformers-base" ,ghc-transformers-base)
        ("ghc-monad-control" ,ghc-monad-control)))
    (native-inputs `(("ghc-hspec" ,ghc-hspec)))
    (arguments
      `(#:cabal-revision
        ("2"
         "1nqqjsgc44fpnsf3v37n0c866s733inssljw7wmd0fdqlxhmijis")))
    (home-page
      "http://hackage.haskell.org/package/async-pool")
    (synopsis
      "A modified version of async that supports worker groups and many-to-many task dependencies")
    (description
      "This library modifies the @async@ package to allow for task pooling and many-to-many dependencies between tasks.")
    (license expat)))

(define-public ghc-checkers
  (package
    (name "ghc-checkers")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/checkers/checkers-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1kbn71blf67jfncv4gia8ygyzh4bngq36vapq2vqrqrzhap3mqi7"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-random" ,ghc-random)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-semigroupoids" ,ghc-semigroupoids)))
    (home-page "https://github.com/conal/checkers")
    (synopsis
      "Check properties on standard classes and data structures.")
    (description
      "''Checkers'' wraps up the expected properties associated with various standard type classes as QuickCheck properties.  Also some morphism properties.  It also provides arbitrary instances and generator combinators for common data types. . &#169; 2008-2013 by Conal Elliott; BSD3 license.")
    (license bsd-3)))

(define ghc-megaparsec-7
  (package
    (inherit ghc-megaparsec)
    (version "7.0.0")
    (arguments '())
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://hackage.haskell.org/package/"
                           "megaparsec/megaparsec-"
                           version ".tar.gz"))
       (sha256
        (base32
         "101kri8w4wf30xs9fnp938il13hxhy6gnnl4m1f0ws4d8q6qgmmz"))))))

(define-public ghc-versions
  (package
    (name "ghc-versions")
    (version "3.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/versions/versions-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1qbihyqw99wkdmslvxqkj6h8x0ih9w86h4s7k51maaicmgijm94w"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-hashable" ,ghc-hashable)
        ("ghc-megaparsec" ,ghc-megaparsec-7)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-base-prelude" ,ghc-base-prelude)
        ("ghc-checkers" ,ghc-checkers)
        ("ghc-microlens" ,ghc-microlens)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
      "https://gitlab.com/fosskers/versions")
    (synopsis
      "Types and parsers for software version numbers.")
    (description
      "A library for parsing and comparing software version numbers. We like to give version numbers to our software in a myriad of ways. Some ways follow strict guidelines for incrementing and comparison. Some follow conventional wisdom and are generally self-consistent. Some are just plain asinine. This library provides a means of parsing and comparing /any/ style of versioning, be it a nice Semantic Version like this: . > 1.2.3-r1+git123 . ...or a monstrosity like this: . > 2:10.2+0.0093r3+1-1 . Please switch to <http://semver.org Semantic Versioning> if you aren't currently using it. It provides consistency in version incrementing and has the best constraints on comparisons.")
    (license bsd-3)))

(define-public ghc-keys
  (package
    (name "ghc-keys")
    (version "3.12.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/keys/keys-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1mw4c0dd21hmzhidf84p6fxrin7k05l2iz8iar3m7k5vbxihlldj"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-comonad" ,ghc-comonad)
        ("ghc-free" ,ghc-free)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-semigroupoids" ,ghc-semigroupoids)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-transformers-compat"
         ,ghc-transformers-compat)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)))
    (arguments
      `(#:cabal-revision
        ("1"
         "1cx5bwd32mpqdgllrkld254a8ydks196m3j9dvm3razg8mxnz2x6")))
    (home-page "http://github.com/ekmett/keys/")
    (synopsis "Keyed functors and containers")
    (description
      "This package provides a bunch of ad hoc classes for accessing parts of a container. . In practice this package is largely subsumed by the <https://hackage.haskell.org/package/lens lens package>, but it is maintained for now as it has much simpler dependencies.")
    (license bsd-3)))

(define-public ghc-pointed
  (package
    (name "ghc-pointed")
    (version "5.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/pointed/pointed-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1p91a762xglckscnhpflxzav8byf49a02mli3983i4kpr2jkaimr"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-data-default-class"
         ,ghc-data-default-class)
        ("ghc-comonad" ,ghc-comonad)
        ("ghc-kan-extensions" ,ghc-kan-extensions)
        ("ghc-semigroupoids" ,ghc-semigroupoids)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-stm" ,ghc-stm)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-transformers-compat"
         ,ghc-transformers-compat)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)))
    (arguments
      `(#:cabal-revision
        ("2"
         "00m4f6rgxa3qa72j3jzpg6rrd9k9n4ll2idxlyybil3lxd63r80w")))
    (home-page "http://github.com/ekmett/pointed/")
    (synopsis "Pointed and copointed data")
    (description "Pointed and copointed data.")
    (license bsd-3)))

(define-public ghc-vector-instances
  (package
    (name "ghc-vector-instances")
    (version "3.4")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/vector-instances/vector-instances-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "10akvpa5w9bp0d8hflab63r9laa9gy2hv167smhjsdzq1kplc0hv"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-vector" ,ghc-vector)
        ("ghc-semigroupoids" ,ghc-semigroupoids)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-comonad" ,ghc-comonad)
        ("ghc-pointed" ,ghc-pointed)
        ("ghc-keys" ,ghc-keys)
        ("ghc-hashable" ,ghc-hashable)))
    (home-page
      "http://github.com/ekmett/vector-instances")
    (synopsis "Orphan Instances for 'Data.Vector'")
    (description "")
    (license bsd-3)))

(define-public ghc-say
  (package
    (name "ghc-say")
    (version "0.1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/say/say-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1r5kffjfwpas45g74sip8glrj1m9nygrnxjm7xgw898rq9pnafgn"))))
    (build-system haskell-build-system)
    (arguments
      '(#:tests? #f))
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-unliftio" ,ghc-unliftio)))
    (home-page "https://github.com/fpco/say#readme")
    (synopsis
      "Send textual messages to a Handle in a thread-friendly way")
    (description
      "Please see the README and documentation at <https://www.stackage.org/package/say>")
    (license expat)))

(define-public ghc-mutable-containers
  (package
    (name "ghc-mutable-containers")
    (version "0.3.4")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/mutable-containers/mutable-containers-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0zhkhlvg9yw45fg3srvzx7j81547djpkfw7higdvlj7fmph6c6b4"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-mono-traversable" ,ghc-mono-traversable)
        ("ghc-primitive" ,ghc-primitive)
        ("ghc-vector" ,ghc-vector)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-hspec" ,ghc-hspec)))
    (home-page
      "https://github.com/snoyberg/mono-traversable#readme")
    (synopsis
      "Abstactions and concrete implementations of mutable containers")
    (description
      "See docs and README at <http://www.stackage.org/package/mutable-containers>")
    (license expat)))

(define-public ghc-dlist-instances
  (package
    (name "ghc-dlist-instances")
    (version "0.1.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/dlist-instances/dlist-instances-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0nsgrr25r4qxv2kpn7i20hra8jjkyllxfrhh5hml3ysjdz010jni"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-semigroups" ,ghc-semigroups)
        ("ghc-dlist" ,ghc-dlist)))
    (home-page
      "https://github.com/gregwebs/dlist-instances")
    (synopsis "Difference lists instances")
    (description
      "See the dlist packages. This package is the canonical source for some orphan instances. Orphan instances are placed here to avoid dependencies elsewhere.")
    (license bsd-3)))

(define-public ghc-mono-traversable-instances
  (package
    (name "ghc-mono-traversable-instances")
    (version "0.1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/mono-traversable-instances/mono-traversable-instances-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0zh81hvqnracil2nvkx14xzwv9vavsnx739acp6gycdyrs5jpzxm"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-mono-traversable" ,ghc-mono-traversable)
        ("ghc-semigroupoids" ,ghc-semigroupoids)
        ("ghc-comonad" ,ghc-comonad)
        ("ghc-vector-instances" ,ghc-vector-instances)
        ("ghc-dlist" ,ghc-dlist)
        ("ghc-dlist-instances" ,ghc-dlist-instances)
        ("ghc-semigroups" ,ghc-semigroups)))
    (home-page
      "https://github.com/snoyberg/mono-traversable#readme")
    (synopsis
      "Extra typeclass instances for mono-traversable")
    (description "Please see README.md")
    (license expat)))

(define-public ghc-basic-prelude
  (package
    (name "ghc-basic-prelude")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/basic-prelude/basic-prelude-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0yckmnvm6i4vw0mykj4fzl4ldsf67v8d2h0vp1bakyj84n4myx8h"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-hashable" ,ghc-hashable)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-vector" ,ghc-vector)))
    (home-page
      "https://github.com/snoyberg/basic-prelude#readme")
    (synopsis
      "An enhanced core prelude; a common foundation for alternate preludes.")
    (description
      "Please see the README on Github at <https://github.com/snoyberg/basic-prelude#readme>")
    (license expat)))

(define-public ghc-classy-prelude
  (package
    (name "ghc-classy-prelude")
    (version "1.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/classy-prelude/classy-prelude-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1nm4lygxqb1wq503maki6dsah2gpn5rd22jmbwjxfwyzgyqy9fnk"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-async" ,ghc-async)
        ("ghc-basic-prelude" ,ghc-basic-prelude)
        ("ghc-bifunctors" ,ghc-bifunctors)
        ("ghc-chunked-data" ,ghc-chunked-data)
        ("ghc-dlist" ,ghc-dlist)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-mono-traversable" ,ghc-mono-traversable)
        ("ghc-mono-traversable-instances"
         ,ghc-mono-traversable-instances)
        ("ghc-mutable-containers"
         ,ghc-mutable-containers)
        ("ghc-primitive" ,ghc-primitive)
        ("ghc-say" ,ghc-say)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-stm" ,ghc-stm)
        ("ghc-stm-chans" ,ghc-stm-chans)
        ("ghc-unliftio" ,ghc-unliftio)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-vector" ,ghc-vector)
        ("ghc-vector-instances" ,ghc-vector-instances)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-hspec" ,ghc-hspec)))
    (home-page
      "https://github.com/snoyberg/mono-traversable#readme")
    (synopsis "A typeclass-based Prelude.")
    (description
      "See docs and README at <http://www.stackage.org/package/classy-prelude>")
    (license expat)))

(define-public ghc-semver-range
  (package
    (name "ghc-semver-range")
    (version "0.2.8")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/semver-range/semver-range-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1df663zkcf7y7a8cf5llf111rx4bsflhsi3fr1f840y4kdgxlvkf"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-classy-prelude" ,ghc-classy-prelude)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)))
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-quickcheck" ,ghc-quickcheck)))
    (home-page
      "http://hackage.haskell.org/package/semver-range")
    (synopsis
      "An implementation of semver and semantic version ranges.")
    (description
      "Provides parsing of semvers and range indicators, as well as logic such as version ordering and determining whether a given version falls in a given range.")
    (license expat)))

(define ghc-hedgehog-1
  (package
    (inherit ghc-hedgehog)
    (version "1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/hedgehog/hedgehog-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1np9xg58x20kalfci9dxbd4wsg0sl3ka56ragzy3i9p0nx29pmns"))))
    (inputs
      `(("ghc-fail" ,ghc-fail)
       ,@(package-inputs ghc-hedgehog)))))

(define-public ghc-tasty-hedgehog
  (package
    (name "ghc-tasty-hedgehog")
    (version "1.0.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/tasty-hedgehog/tasty-hedgehog-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1mbg5q0c0xfrk4npfj60pi693igb7r5l78x6xf9fk2jglw0nmxhz"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-tagged" ,ghc-tagged)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-hedgehog" ,ghc-hedgehog-1)))
    (native-inputs
      `(("ghc-tasty-expected-failure"
         ,ghc-tasty-expected-failure)))
    (home-page
      "https://github.com/qfpl/tasty-hedgehog")
    (synopsis "Integration for tasty and hedgehog.")
    (description
      "Integrates the <https://hackage.haskell.org/package/hedgehog hedgehog testing library> with the <https://hackage.haskell.org/package/tasty tasty testing framework>.")
    (license bsd-3)))

(define-public ghc-retry
  (package
    (name "ghc-retry")
    (version "0.8.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/retry/retry-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0x63grjv0r96gv8ksh6r6aja6fvnwr06bypigvkskzhjjbk3fhcx"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-exceptions" ,ghc-exceptions)
        ("ghc-random" ,ghc-random)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-tasty-hedgehog" ,ghc-tasty-hedgehog)
        ("ghc-hedgehog" ,ghc-hedgehog)
        ("ghc-stm" ,ghc-stm)))
    (home-page "http://github.com/Soostone/retry")
    (synopsis
      "Retry combinators for monadic actions that may fail")
    (description
      "This package exposes combinators that can wrap arbitrary monadic actions. They run the action and potentially retry running it with some configurable delay for a configurable number of times. The purpose is to make it easier to work with IO and especially network IO actions that often experience temporary failure and warrant retrying of the original action. For example, a database query may time out for a while, in which case we should hang back for a bit and retry the query instead of simply raising an exception.")
    (license bsd-3)))

(define-public ghc-iso8601-time
  (package
    (name "ghc-iso8601-time")
    (version "0.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/iso8601-time/iso8601-time-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1j7h1xix7vpb88dnksis14rnvw0p528m3d54fg3h51765d5l9kgj"))))
    (build-system haskell-build-system)
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-hunit" ,ghc-hunit)))
    (home-page "https://github.com/nh2/iso8601-time")
    (synopsis
      "Convert to/from the ISO 8601 time format")
    (description
      "Conversion functions between Haskell time types and the ISO 8601 format, which is often used for printing times, e.g. JavaScript's @new Date().toISOString()@.")
    (license expat)))

(define-public ghc-bytestring-conversion
  (package
    (name "ghc-bytestring-conversion")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/bytestring-conversion/bytestring-conversion-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1y2fhwz632sp7n0iw87lz2g8vks4jgxz2kw99kysgivxfd4fmdqk"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-double-conversion" ,ghc-double-conversion)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (arguments
      `(#:cabal-revision
        ("2"
         "1x8c42cfzb6fdvgkxxdxcpdf16csimlzsgahb1axnplmr6b3ba63")))
    (home-page
      "https://github.com/twittner/bytestring-conversion/")
    (synopsis
      "Type-classes to convert values to and from ByteString.")
    (description
      "Defines the type-classes 'ToByteString' and 'FromByteString' to convert values to and from ByteString.")
    (license #f)))

(define-public ghc-hspec-attoparsec
  (package
    (name "ghc-hspec-attoparsec")
    (version "0.1.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/hspec-attoparsec/hspec-attoparsec-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0r7v6x0k5r8jxl0rnsq8h3gqhbiimsic3kiphn6dxaw954zqnypa"))))
    (build-system haskell-build-system)
    (arguments
      '(#:tests? #f))
    (inputs
      `(("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-hspec-expectations"
         ,ghc-hspec-expectations)))
    (native-inputs `(("ghc-hspec" ,ghc-hspec)))
    (home-page
      "http://github.com/alpmestan/hspec-attoparsec")
    (synopsis
      "Utility functions for testing your attoparsec parsers with hspec")
    (description
      "This package provides some helper functions for testing attoparsec parsers with hspec. . See the documentation in @Test.Hspec.Attoparsec@ for examples, or this package's own test suite.")
    (license bsd-3)))

(define-public ghc-http-link-header
  (package
    (name "ghc-http-link-header")
    (version "1.0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/http-link-header/http-link-header-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0b9a3kax6zvn8aaflys63lanqan65hsv0dr8vwhbpbhyvxrxn9ns"))))
    (build-system haskell-build-system)
    (arguments
      '(#:tests? #f))
    (inputs
      `(("ghc-errors" ,ghc-errors)
        ("ghc-network-uri" ,ghc-network-uri)
        ("ghc-http-api-data" ,ghc-http-api-data)
        ("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-bytestring-conversion"
         ,ghc-bytestring-conversion)))
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-hspec-attoparsec" ,ghc-hspec-attoparsec)))
    (home-page
      "https://github.com/myfreeweb/http-link-header")
    (synopsis
      "A parser and writer for the HTTP Link header as specified in RFC 5988 \"Web Linking\".")
    (description
      "https://github.com/myfreeweb/http-link-header")
    (license public-domain)))

(define-public ghc-binary-orphans
  (package
    (name "ghc-binary-orphans")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/binary-orphans/binary-orphans-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0gbmn5rpvyxhw5bxjmxwld6918lslv03b2f6hshssaw1il5x86j3"))))
    (build-system haskell-build-system)
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-quickcheck-instances"
         ,ghc-quickcheck-instances)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
        ("ghc-tagged" ,ghc-tagged)))
    (arguments
      `(#:tests? #f
        #:cabal-revision
        ("1"
         "0sww1904gn3sxvj94ac8l1g50v0j3fgpfiynbpvg0yhqsbfazi3n")))
    (home-page
      "http://hackage.haskell.org/package/binary-orphans")
    (synopsis
      "Compatibility package for binary; provides instances")
    (description
      "This package provides instances defined in later versions of @binary@ package . Prior version 1 this packages provided instances for other packages. That functionality is moved to [binary-instances](https://hackage.haskell.org/package/binary-instances) package.")
    (license bsd-3)))

(define ghc-base-orphans-0.8.1
  (package
    (inherit ghc-base-orphans)
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/base-orphans/base-orphans-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1nwr9av27i9p72k0sn96mw3ywdczw65dy5gd5wxpabhhxlxdcas4"))))))

(define-public ghc-time-compat
  (package
    (name "ghc-time-compat")
    (version "1.9.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/time-compat/time-compat-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "05va0rqs759vbridbcl6hksp967j9anjvys8vx72fnfkhlrn2s52"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-base-orphans" ,ghc-base-orphans-0.8.1)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-base-compat" ,ghc-base-compat)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (arguments
      `(#:tests? #f
        #:cabal-revision
        ("1"
         "0k8ph4sydaiqp8dav4if6hpiaq8h1xsr93khmdr7a1mmfwdxr64r")))
    (home-page
      "https://github.com/phadej/time-compat")
    (synopsis "Compatibility package for time")
    (description
      "This packages tries to compat as much of @time@ features as possible. . /TODO:/ . * Difference type @ParseTime@ and @FormatTime@ instances are missing. . * Formatting varies depending on underlying @time@ version . * @dayFractionToTimeOfDay@ on extreme values")
    (license bsd-3)))

(define-public ghc-binary-instances
  (package
    (name "ghc-binary-instances")
    (version "1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/binary-instances/binary-instances-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "07y9582vsw94ks8whkd3dcmf4wdwlq8riyk2shmxxprkq0gsv3z0"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-binary-orphans" ,ghc-binary-orphans)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-scientific" ,ghc-scientific)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-text-binary" ,ghc-text-binary)
        ("ghc-time-compat" ,ghc-time-compat)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-vector" ,ghc-vector)
        ("ghc-vector-binary-instances"
         ,ghc-vector-binary-instances)))
    (native-inputs
      `(("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-quickcheck-instances"
         ,ghc-quickcheck-instances)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (arguments
      `(#:tests? #f
        #:cabal-revision
        ("1"
         "141hhr872rg0g2pvz1mbxamz9cijik9jilr1y0wdx5r71x0m1vyd")))
    (home-page
      "https://github.com/phadej/binary-orphans#readme")
    (synopsis "Orphan instances for binary")
    (description
      "`binary-orphans` defines orphan instances for types in some popular packages.")
    (license bsd-3)))

(define ghc-aeson-1.4.0.0
  (package
    (inherit ghc-aeson)
    (version "1.4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/aeson/aeson-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "042phqkabjrlrl3azr3ba9q7naz4c2cjl5nplbfz8iidpf6j0sli"))))))

(define ghc-exceptions-0.10.2
  (package
    (inherit ghc-exceptions)
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/exceptions/exceptions-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0ajiq47xd1paingr7kksh69v6d072zsppfr6cy1gzjh3zg5jr34i"))))))

(define ghc-transformers-base-0.2.0
   (package
    (inherit ghc-transformers-base)
    (version "0.2.0")
  (source
    (origin
      (method url-fetch)
      (uri (string-append
             "https://hackage.haskell.org/package/transformers/transformers-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "02v2fjbvcrlpvhcsssap8dy8y9pp95jykrlc5arm39sxa48wyrys"))))))

(define ghc-transformers-compat-0.6.5
  (package
    (inherit ghc-transformers-compat)
    (version "0.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/transformers-compat"
             "/transformers-compat-" version ".tar.gz"))
       (sha256
        (base32
         "02v2fjbvcrlpvhcsssap8dy8y9pp95jykrlc5arm39sxa48wyrys"))))))

(define ghc-unordered-containers-0.2.10.0
  (package
    (inherit ghc-unordered-containers)
    (version "0.2.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/unordered-containers"
             "/unordered-containers-" version ".tar.gz"))
       (sha256
        (base32
         "0wy5hfrs880hh8hvp648bl07ws777n3kkmczzdszr7papnyigwb5"))))))

(define-public ghc-github
  (package
    (name "ghc-github")
    (version "0.22")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/github/github-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "15py79qcpj0k331i42njgwkirwyiacbc5razmxnm4672dvvip2qk"))))
    (build-system haskell-build-system)
    (arguments
      '(#:tests? #f))
    (inputs
      `(("ghc-aeson" ,ghc-aeson-1.4.0.0)
        ("ghc-base-compat" ,ghc-base-compat)
        ("ghc-base16-bytestring" ,ghc-base16-bytestring)
        ("ghc-binary-instances" ,ghc-binary-instances)
        ("ghc-cryptohash-sha1" ,ghc-cryptohash-sha1)
        ("ghc-deepseq-generics" ,ghc-deepseq-generics)
        ("ghc-exceptions" ,ghc-exceptions-0.10.2)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-http-client" ,ghc-http-client)
        ("ghc-http-link-header" ,ghc-http-link-header)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-iso8601-time" ,ghc-iso8601-time)
        ("ghc-network-uri" ,ghc-network-uri)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-transformers-compat"
         ,ghc-transformers-compat-0.6.5)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers-0.2.10.0)
        ("ghc-vector" ,ghc-vector)
        ("ghc-vector-instances" ,ghc-vector-instances)
        ("ghc-http-client-tls" ,ghc-http-client-tls)
        ("ghc-tls" ,ghc-tls)))
    (native-inputs
      `(("ghc-file-embed" ,ghc-file-embed)
        ("ghc-hspec" ,ghc-hspec)))
    (home-page "https://github.com/phadej/github")
    (synopsis "Access to the GitHub API, v3.")
    (description
      "The GitHub API provides programmatic access to the full GitHub Web site, from Issues to Gists to repos down to the underlying git data like references and trees. This library wraps all of that, exposing a basic but Haskell-friendly set of functions and data structures. . For supported endpoints see \"GitHub\" module. . > import qualified GitHub as GH > > main :: IO () > main = do >     possibleUser <- GH.executeRequest' $ GH.userInfoForR \"phadej\" >     print possibleUser . For more of an overview please see the README: <https://github.com/phadej/github/blob/master/README.md>")
    (license bsd-3)))


