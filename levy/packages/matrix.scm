(define-module (levy packages matrix)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages check)
  #:use-module (gnu packages monitoring)
  #:use-module (gnu packages python-xyz))

(define python-unpaddedbase64
  (package
    (name "python-unpaddedbase64")
    (version "1.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/matrix-org/python-unpaddedbase64/archive/v"
                            version
                            ".tar.gz"))
        (sha256
          (base32
            "0wxvj5s93rgiqmcrbaqk89i8ayxpvkzmis03x6007xvm7s4c2gsf"))))
    (build-system python-build-system)
    (home-page
      "https://github.com/matrix-org/python-unpaddedbase64")
    (synopsis "")
    (description "")
    (license license:expat)))

(define python-signedjson
  (package
    (name "python-signedjson")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/matrix-org/python-signedjson/archive/v"
                            version
                            ".tar.gz"))
        (sha256
          (base32
            "00w4yvwcgdb1245qyc7flb12p387bjck71f34wz6il7kg3bgnl4z"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-pynacl" ,python-pynacl)
        ("python-canonicaljson" ,python-canonicaljson)
        ("python-unpaddedbase64" ,python-unpaddedbase64)))
    (home-page
      "https://github.com/matrix-org/python-signedjson")
    (synopsis "")
    (description "")
    (license license:expat)))

(define python-pymacaroons
  (package
    (name "python-pymacaroons")
    (version "0.13.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pymacaroons" version))
        (sha256
          (base32
            "1f0357a6g1h96sk6wy030xmc1p4rd80a999qvxd28v7nlm1blsqy"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-pynacl" ,python-pynacl)
        ("python-six" ,python-six)))
    (home-page
      "https://github.com/ecordell/pymacaroons")
    (synopsis "Macaroon library for Python")
    (description "Macaroon library for Python")
    (license license:expat)))

(define python-frozendict
  (package
    (name "python-frozendict")
    (version "1.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "frozendict" version))
        (sha256
          (base32
            "0ibf1wipidz57giy53dh7mh68f2hz38x8f4wdq88mvxj5pr7jhbp"))))
    (build-system python-build-system)
    (home-page
      "https://github.com/slezica/python-frozendict")
    (synopsis "An immutable dictionary")
    (description "An immutable dictionary")
    (license #f)))

(define python-daemonize
  (package
    (name "python-daemonize")
    (version "2.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "daemonize" version))
        (sha256
          (base32
            "1hwbl3gf9fdds9sc14zgjyjisjvxidrvqc11xlbb0b6jz17nw0nx"))))
    (build-system python-build-system)
    (home-page
      "https://github.com/thesharp/daemonize")
    (synopsis
      "Library to enable your code run as a daemon process on Unix-like systems.")
    (description
      "Library to enable your code run as a daemon process on Unix-like systems.")
    (license license:expat)))

(define python-canonicaljson
  (package
    (name "python-canonicaljson")
    (version "1.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "canonicaljson" version))
        (sha256
          (base32
            "09cpacc8yvcc74i63pdmlfaahh77dnvbyw9zf29wml2zzwqfbg25"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-frozendict" ,python-frozendict)
        ("python-simplejson" ,python-simplejson)
        ("python-six" ,python-six)))
    (home-page
      "https://github.com/matrix-org/python-canonicaljson")
    (synopsis "Canonical JSON")
    (description "Canonical JSON")
    (license license:asl2.0)))

(define-public python-matrix-synapse
  (package
    (name "python-matrix-synapse")
    (version "1.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "matrix-synapse" version))
        (sha256
          (base32
            "1nz9bhy5hraa1h7100vr0innz8npnpha6xr9j2ln7h3cgwv73739"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-attrs" ,python-attrs)
        ("python-bcrypt" ,python-bcrypt)
        ("python-bleach" ,python-bleach)
        ("python-canonicaljson" ,python-canonicaljson)
        ("python-daemonize" ,python-daemonize)
        ("python-frozendict" ,python-frozendict)
        ("python-idna" ,python-idna)
        ("python-jinja2" ,python-jinja2)
        ("python-jsonschema" ,python-jsonschema)
        ("python-msgpack" ,python-msgpack)
        ("python-netaddr" ,python-netaddr)
        ("python-phonenumbers" ,python-phonenumbers)
        ("python-pillow" ,python-pillow)
        ("python-prometheus-client"
         ,python-prometheus-client)
        ("python-psutil" ,python-psutil)
        ("python-pyasn1" ,python-pyasn1)
        ("python-pyasn1-modules" ,python-pyasn1-modules)
        ("python-pymacaroons" ,python-pymacaroons)
        ("python-pynacl" ,python-pynacl)
        ("python-pyopenssl" ,python-pyopenssl)
        ("python-pyyaml" ,python-pyyaml)
        ("python-service-identity"
         ,python-service-identity)
        ("python-signedjson" ,python-signedjson)
        ("python-six" ,python-six)
        ("python-sortedcontainers"
         ,python-sortedcontainers)
        ("python-treq" ,python-treq)
        ("python-twisted" ,python-twisted)
        ("python-unpaddedbase64" ,python-unpaddedbase64)))
    (native-inputs
      `(("python-mock" ,python-mock)
        ("python-parameterized" ,python-parameterized)))
    (home-page "")
    (synopsis
      "Reference homeserver for the Matrix decentralised comms protocol")
    (description
      "Reference homeserver for the Matrix decentralised comms protocol")
    (license #f)))


