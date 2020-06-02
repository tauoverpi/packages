(define-module (tau packages ruby)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system ruby)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rails)
  #:use-module ((guix licenses) #:prefix license:))

(define-public ruby-shotgun
  (package
    (name "ruby-shotgun")
    (version "0.9.2")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "shotgun" version))
        (sha256
          (base32
            "0484cyi8z4bq2p1jl4dcna0chcz7w5izm63ccrr04qlcz5irxwaf"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs `(("ruby-rack" ,ruby-rack)))
    (synopsis "Reloading Rack development server")
    (description "Reloading Rack development server")
    (home-page "https://github.com/rtomayko/shotgun")
    (license license:expat)))

(define-public ruby-hansi
  (package
    (name "ruby-hansi")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "hansi" version))
        (sha256
          (base32
            "0mjgdxmvimyhg8y7vixzd30r10vbkh0q3ygcicvsr4w5314mj082"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (synopsis
      "Der ANSI Hansi - create colorized console output.")
    (description
      "Der ANSI Hansi - create colorized console output.")
    (home-page "https://github.com/rkh/hansi")
    (license license:expat)))

(define-public ruby-ruby2-keywords
  (package
    (name "ruby-ruby2-keywords")
    (version "0.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "ruby2_keywords" version))
        (sha256
          (base32
            "17pcc0wgvh3ikrkr7bm3nx0qhyiqwidd13ij0fa50k7gsbnr2p0l"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (synopsis
      "Shim library for Module#ruby2_keywords")
    (description
      "Shim library for Module#ruby2_keywords")
    (home-page
      "https://github.com/ruby/ruby2_keywords")
    (license #f)))


(define-public ruby-mustermann-1.1.1
  (package/inherit ruby-mustermann
    (name "ruby-mustermann")
    (version "1.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "mustermann" version))
        (sha256
          (base32
            "0ccm54qgshr1lq3pr1dfh7gphkilc19dp63rw6fcx7460pjwy88a"))))))


(define-public ruby-mustermann-contrib
  (package
    (name "ruby-mustermann-contrib")
    (version "1.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "mustermann-contrib" version))
        (sha256
          (base32
            "0r9wk3zzjmjw5gy2ya6y4idcn9asp6rimgkvama03k6vzdv0zsdh"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("ruby-hansi" ,ruby-hansi)
        ("ruby-mustermann" ,ruby-mustermann-1.1.1)))
    (synopsis "Adds many plugins to Mustermann")
    (description "Adds many plugins to Mustermann")
    (home-page
      "https://github.com/sinatra/mustermann")
    (license license:expat)))

(define-public ruby-hash-deep-merge
  (package
    (name "ruby-hash-deep-merge")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "hash-deep-merge" version))
        (sha256
          (base32
            "02hjzfcjzmnbg7abwqhi893xg472xjsmbl9z7bhlryz6fgpmpa5i"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (synopsis
      "This gem add the \"deep merge\" feature to class Hash.
It means that if you want to merge hashes that contains other hashes (and so on...), those sub-hashes will be merged as well.
This is very handy, for example for merging data taken from YAML files.
")
    (description
      "This gem add the \"deep merge\" feature to class Hash.
It means that if you want to merge hashes that contains other hashes (and so on...), those sub-hashes will be merged as well.
This is very handy, for example for merging data taken from YAML files.
")
    (home-page
      "http://github.com/Offirmo/hash-deep-merge")
    (license #f)))

(define-public ruby-deep-merge
  (package
    (name "ruby-deep-merge")
    (version "1.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "deep_merge" version))
        (sha256
          (base32
            "1q3picw7zx1xdkybmrnhmk2hycxzaa0jv4gqrby1s90dy5n7fmsb"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (synopsis "Recursively merge hashes.")
    (description "Recursively merge hashes.")
    (home-page
      "https://github.com/danielsdeleo/deep_merge")
    (license license:expat)))

(define-public ruby-oas-parser
  (package
    (name "ruby-oas-parser")
    (version "0.25.1")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "oas_parser" version))
        (sha256
          (base32
            "15139qgnb47rqsimyylym5q4hga0d7kj5f6bwmw9gwkcxxpjxp2h"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("ruby-activesupport" ,ruby-activesupport-6.0)
        ("ruby-addressable" ,ruby-addressable)
        ("ruby-builder" ,ruby-builder)
        ("ruby-deep-merge" ,ruby-deep-merge)
        ("ruby-hash-deep-merge" ,ruby-hash-deep-merge)
        ("ruby-mustermann-contrib"
         ,ruby-mustermann-contrib)
        ("ruby-nokogiri" ,ruby-nokogiri)))
    (synopsis "A parser for Open API specifications")
    (description
      "This package provides a parser for Open API specifications")
    (home-page "https://github.com/Nexmo/oas_parser")
    (license license:expat)))

(define-public ruby-octicons
  (package
    (name "ruby-octicons")
    (version "8.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "octicons" version))
        (sha256
          (base32
            "0ndwj90h8x4ag380p1nzjhvp2rk4520vfwjzbbihln8v2b387xn7"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("ruby-nokogiri" ,ruby-nokogiri)))
    (synopsis
      "A package that distributes Octicons in a gem")
    (description
      "This package provides a package that distributes Octicons in a gem")
    (home-page "https://github.com/primer/octicons")
    (license license:expat)))

(define-public ruby-octicons-helper
  (package
    (name "ruby-octicons-helper")
    (version "8.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "octicons_helper" version))
        (sha256
          (base32
            "0yzld0swjlb88qhwa1vf8s3kmhfz553g2awz0h6c8fv80y6ipxw3"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("ruby-octicons" ,ruby-octicons)
        ("ruby-rails" ,ruby-rails)))
    (synopsis
      "A rails helper that makes including svg Octicons simple.")
    (description
      "This package provides a rails helper that makes including svg Octicons simple.")
    (home-page "https://github.com/primer/octicons")
    (license license:expat)))

(define-public ruby-nexmo-markdown-renderer
  (package
    (name "ruby-nexmo-markdown-renderer")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "nexmo_markdown_renderer" version))
        (sha256
          (base32
            "04lszjylabs6w628anx557x7djq52j1zhkmda8cijpb3312c8i63"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("ruby-activemodel" ,ruby-activemodel)
        ("ruby-banzai" ,ruby-banzai)
        ("ruby-i18n" ,ruby-i18n)
        ("ruby-nokogiri" ,ruby-nokogiri)
        ("ruby-octicons-helper" ,ruby-octicons-helper)
        ("ruby-redcarpet" ,ruby-redcarpet)
        ("ruby-rouge" ,ruby-rouge)))
    (synopsis
      "Middleware to render Markdown Documents in Nexmo Developer Platform.")
    (description
      "Middleware to render Markdown Documents in Nexmo Developer Platform.")
    (home-page
      "https://github.com/Nexmo/nexmo-markdown-renderer")
    (license license:expat)))

(define-public ruby-neatjson
  (package
    (name "ruby-neatjson")
    (version "0.9")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "neatjson" version))
        (sha256
          (base32
            "0fa2v7b6433j0iqh5iq9r71v7a5xabgjvqwsbl21vcsac7vf3ncw"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (synopsis
      "Generate JSON strings from Ruby objects with flexible formatting options. Key features: keep arrays and objects on a single line when they fit; format floats to specific precision; sort and align object keys; adjust whitespace padding of arrays and objects, inside and around commas and colons. JavaScript version included.")
    (description
      "Generate JSON strings from Ruby objects with flexible formatting options.  Key features: keep arrays and objects on a single line when they fit; format floats to specific precision; sort and align object keys; adjust whitespace padding of arrays and objects, inside and around commas and colons.  JavaScript version included.")
    (home-page "http://github.com/Phrogz/NeatJSON")
    (license license:expat)))

(define-public ruby-dotenv
  (package
    (name "ruby-dotenv")
    (version "2.7.5")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "dotenv" version))
        (sha256
          (base32
            "17hkd62ig9b0czv192kqdfq7gw0a8hgq07yclri6myc8y5lmfin5"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (synopsis
      "Loads environment variables from `.env`.")
    (description
      "Loads environment variables from `.env`.")
    (home-page "https://github.com/bkeepers/dotenv")
    (license license:expat)))

(define-public ruby-banzai
  (package
    (name "ruby-banzai")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "banzai" version))
        (sha256
          (base32
            "1gy5s90q7a0snc9grd753k5fw7vmpsv515ym7bw4m376lv79mhmr"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (synopsis
      "Toolkit for processing input using filters and pipelines")
    (description
      "Toolkit for processing input using filters and pipelines")
    (home-page "https://github.com/dejan/banzai")
    (license license:expat)))


(define-public ruby-rogue
  (package
    (name "ruby-rogue")
    (version "2.0.7")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/rouge-ruby/rouge/archive/v"
                            version
                            ".tar.gz"))
        (sha256
          (base32
            "08l0d3ligc4j00paz977jw5m3mxdjfyvx7idkvnlcldzy90xc669"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs `(("ruby-rails" ,ruby-rails)))
    (synopsis
      "Rogue integrates seemlessly with Rails applications to allow developers to quickly scaffold a scheduling system.")
    (description
      "Rogue integrates seemlessly with Rails applications to allow developers to quickly scaffold a scheduling system.")
    (home-page "http://rogue.codes")
    (license license:expat)))

(define-public ruby-activesupport-6.0
  (package/inherit ruby-activesupport
    (name "ruby-activesupport-6.0")
    (version "6.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "activesupport" version))
        (sha256
          (base32
            "0b24ch7zmrdb4h6aismahk9785lc4ij30lmdr6ydv19kkljsjq5v"))))))


(define-public ruby-zeitwerk
  (package
    (name "ruby-zeitwerk")
    (version "2.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "zeitwerk" version))
        (sha256
          (base32
            "1akpm3pwvyiack2zk6giv9yn3cqb8pw6g40p4394pdc3xmy3s4k0"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (synopsis
      "    Zeitwerk implements constant autoloading with Ruby semantics. Each gem
    and application may have their own independent autoloader, with its own
    configuration, inflector, and logger. Supports autoloading, preloading,
    reloading, and eager loading.
")
    (description
      "    Zeitwerk implements constant autoloading with Ruby semantics.  Each gem
    and application may have their own independent autoloader, with its own
    configuration, inflector, and logger.  Supports autoloading, preloading,
    reloading, and eager loading.
")
    (home-page "https://github.com/fxn/zeitwerk")
    (license license:expat)))



(define-public ruby-nexmo-oas-renderer
  (package
    (name "ruby-nexmo-oas-renderer")
    (version "0.11.2")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "nexmo-oas-renderer" version))
        (sha256
          (base32
            "10w3hb4k1v5k2xa72p11d818ywmqmmkynirrkxbqspfg1b2928n5"))))
    (build-system ruby-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("ruby-activemodel" ,ruby-activemodel)
        ("ruby-activesupport" ,ruby-activesupport-6.0)
        ("ruby-banzai" ,ruby-banzai)
        ("ruby-dotenv" ,ruby-dotenv)
        ("ruby-rogue" ,ruby-rogue)
        ("ruby-ruby2-keywords" ,ruby-ruby2-keywords)
        ("ruby-neatjson" ,ruby-neatjson)
        ("ruby-nexmo-markdown-renderer"
         ,ruby-nexmo-markdown-renderer)
        ("ruby-oas-parser" ,ruby-oas-parser)
        ("ruby-octicons-helper" ,ruby-octicons-helper)
        ("ruby-redcarpet" ,ruby-redcarpet)
        ("ruby-rouge" ,ruby-rouge)
        ("ruby-sass" ,ruby-sass)
        ("ruby-shotgun" ,ruby-shotgun)
        ("ruby-zeitwerk" ,ruby-zeitwerk)
        ("ruby-sinatra" ,ruby-sinatra)))
    (synopsis "OpenAPI Specification renderer.")
    (description "OpenAPI Specification renderer.")
    (home-page
      "https://github.com/Nexmo/nexmo-oas-renderer")
    (license license:expat)))
