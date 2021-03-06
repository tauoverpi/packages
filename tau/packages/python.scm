(define-module (tau packages python)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages music)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages check)
  #:use-module (gnu packages textutils)
  #:use-module (guix build-system python))

(define-public python-neovim
  (package
    (name "python-neovim")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "neovim" version))
        (sha256
          (base32
            "03znibklxyyqx2w05l2r8bcff2qp8kzwbifbvpkg8fs3njjyg856"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-pynvim" ,python-pynvim)))
    (home-page
      "http://github.com/neovim/python-client")
    (synopsis "Transition packgage for pynvim")
    (description "Transition packgage for pynvim")
    (license #f)))

(define-public python-pytest-flask
  (package
    (name "python-pytest-flask")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pytest-flask" version))
        (sha256
          (base32
            "1hln7mwgdzfi5ma0kqfsi768l7p24jhkw8l0imhifwy08nh7hmjd"))))
    (build-system python-build-system)
    (native-inputs
     `(("python-setuptools-scm" ,python-setuptools-scm)))
    (propagated-inputs
      `(("python-flask" ,python-flask)
        ("python-pytest" ,python-pytest)
        ("python-werkzeug" ,python-werkzeug)))
    (home-page
      "https://github.com/vitalk/pytest-flask")
    (synopsis
      "A set of py.test fixtures to test Flask applications.")
    (description
      "A set of py.test fixtures to test Flask applications.")
    (license license:expat)))

(define-public python-mat2
  (package
    (name "python-mat2")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "mat2" version))
        (sha256
          (base32
            "1zwhgxiim4cm8bwlhjsbdgi84f6jl0d99vdbnqif1ss1xdjrkfdy"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("poppler" ,poppler)
        ("gdk-pixbuf+svg" ,gdk-pixbuf+svg)
        ("librsvg" ,librsvg)
        ("python-mutagen" ,python-mutagen)
        ("python-pycairo" ,python-pycairo)
        ("python-pygobject" ,python-pygobject)))
    (home-page "https://0xacab.org/jvoisin/mat2")
    (synopsis "A handy tool to trash your metadata")
    (description
      "A handy tool to trash your metadata")
    (license #f)))

(define-public python-glad
  (package
    (name "python-glad")
    (version "0.1.33")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "glad" version))
        (sha256
          (base32
            "0lrrjlgms2299yi81w4bbad024alw1xcnahjxyc4mmwdsj8vvwfb"))))
    (build-system python-build-system)
    (home-page "https://github.com/Dav1dde/glad")
    (synopsis
      "Multi-Language GL/GLES/EGL/GLX/WGL Loader-Generator based on the official specs.")
    (description
      "Multi-Language GL/GLES/EGL/GLX/WGL Loader-Generator based on the official specs.")
    (license license:expat)))

(define-public python-pmbootstrap
  (package
    (name "python-pmbootstrap")
    (version "1.22.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pmbootstrap" version))
        (sha256
          (base32
            "1ffac7hkz63y94qd08jrhpznan326dz6d37xgylixfh8a34jvc0f"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://www.postmarketos.org")
    (synopsis
      "A sophisticated chroot / build / flash tool to develop and install postmarketOS")
    (description
      "A sophisticated chroot / build / flash tool to develop and install postmarketOS")
    (license #f)))

(define-public python-problog
  (package
    (name "python-problog")
    (version "2.1.0.40")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "problog" version))
        (sha256
          (base32
            "1fiivpnkwpjmnikiii0q5w1hg3kc3g88jj34aqr84jq7mg80r493"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
          (delete 'validate-runpath))))
    (home-page "https://dtai.cs.kuleuven.be/problog")
    (synopsis
      "ProbLog2: Probabilistic Logic Programming toolbox")
    (description
      "ProbLog2: Probabilistic Logic Programming toolbox")
    (license #f)))

(define-public python-panflute
  (package
    (name "python-panflute")
    (version "1.12.5")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "panflute" version))
        (sha256
          (base32
            "0p3p2g1nzslh2c37zk7d00qb235mb2cicl0x8i87dsgx09y512cb"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-click" ,python-click)
        ("python-pyyaml" ,python-pyyaml)))
    (native-inputs
      `(("python-configparser" ,python-configparser)
        ("python-pandocfilters" ,python-pandocfilters)
        ("python-pytest-cov" ,python-pytest-cov)))
    (home-page
      "https://github.com/sergiocorreia/panflute")
    (synopsis "Pythonic Pandoc filters")
    (description "Pythonic Pandoc filters")
    (license #f)))

(define-public python-mypy-extensions
  (package
    (name "python-mypy-extensions")
    (version "0.4.3")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "mypy_extensions" version))
        (sha256
          (base32
            "1a04qsk8hd1lqns8w1j7cr0vmvbhg450di5k1i16kqxkbf7q30id"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-typing" ,python-typing)))
    (home-page
      "https://github.com/python/mypy_extensions")
    (synopsis
      "Experimental type system extensions for programs checked with the mypy
typechecker.")
    (description
      "Experimental type system extensions for programs checked with the mypy
typechecker.")
    (license #f)))

(define-public python-mypy
  (package
    (name "python-mypy")
    (version "0.761")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "mypy" version))
        (sha256
          (base32
            "1gw7h84d21wmi267kmgqs9whz0l7rp62pzja2f31wq7cfj6spfl5"))))
    (build-system python-build-system)
    (arguments `(#:tests? #f))
    (propagated-inputs
      `(("python-mypy-extensions"
         ,python-mypy-extensions)
        ("python-typed-ast" ,python-typed-ast)
        ("python-typing-extensions"
         ,python-typing-extensions)))
    (home-page "http://www.mypy-lang.org/")
    (synopsis "Optional static typing for Python")
    (description "Optional static typing for Python")
    (license #f)))

(define-public python-pytest-mypy
  (package
    (name "python-pytest-mypy")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pytest-mypy" version))
        (sha256
          (base32
            "015kqmmghdrxycvxy98j915paq9750za2ihm31dh0zzirz73hlss"))))
    (build-system python-build-system)
    (arguments `(#:tests? #f))
    (propagated-inputs
      `(("python-mypy" ,python-mypy)
        ("python-pytest" ,python-pytest)))
    (home-page
      "https://github.com/dbader/pytest-mypy")
    (synopsis
      "Mypy static type checker plugin for Pytest")
    (description
      "Mypy static type checker plugin for Pytest")
    (license license:expat)))

(define-public python-pampy
  (package
    (name "python-pampy")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pampy" version))
        (sha256
          (base32
            "0yv658m8fzhrdknhwi7lmwc9kniyb2ij2ly5cchw53s7wh9441c2"))))
    (build-system python-build-system)
    (home-page "https://github.com/santinic/pampy")
    (synopsis
      "The Pattern Matching for Python you always dreamed of")
    (description
      "The Pattern Matching for Python you always dreamed of")
    (license #f)))


(define-public python-entangled-filters
  (package
    (name "python-entangled-filters")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://github.com/entangled/filters/archive/"
               version ".tar.gz"))
        (sha256
          (base32
            "0a5ygy35sl04ig9w82qq4rb3zjbi2g4pzxmlv7cfd34r12zax5wm"))))
    (build-system python-build-system)
    (arguments `(#:tests? #f))
    (propagated-inputs
      `(("python-jupyter-client" ,python-jupyter-client)
        ("python-pampy" ,python-pampy)
        ("python-panflute" ,python-panflute)))
    (native-inputs
      `(("python-pytest" ,python-pytest)
        ("python-pytest-cov" ,python-pytest-cov)
        ("python-flake8" ,python-flake8)
        ("python-ipykernel" ,python-ipykernel)
        ("python-pytest-mypy" ,python-pytest-mypy)))
    (home-page
      "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public python-openapi-spec-validator
  (package
    (name "python-openapi-spec-validator")
    (version "0.2.8")
    (source      (origin
        (method url-fetch)
        (uri (pypi-uri "openapi-spec-validator" version))
        (sha256
          (base32
            "1kav0jlgdpgwx4am09ja7cr8s1g8h8a7j8mcfy1cfjr8fficg2g4"))))
    (build-system python-build-system)
    (arguments
      '(#:tests? #f))
    (propagated-inputs
      `(("python-jsonschema" ,python-jsonschema)
        ("python-pathlib2" ,python-pathlib2)
        ("python-pyyaml" ,python-pyyaml)
        ("python-six" ,python-six)))
    (home-page
      "https://github.com/p1c2u/openapi-spec-validator")
    (synopsis "")
    (description "")
    (license license:asl2.0)))

(define-public python-telethon
  (package
    (name "python-telethon")
    (version "1.12.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "Telethon" version))
        (sha256
          (base32
            "1il7qzzwvqckqabb0h4nsb6gzjb7q7rawcnnnsc9fdp5lvzz0ysp"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("python-pyaes" ,python-pyaes)
        ("python-rsa" ,python-rsa)))
    (home-page
      "https://github.com/LonamiWebs/Telethon")
    (synopsis
      "Full-featured Telegram client library for Python 3")
    (description
      "Full-featured Telegram client library for Python 3")
    (license license:expat)))


