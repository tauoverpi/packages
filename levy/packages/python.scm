(define-module (levy packages python)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages check)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system python))

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

(define-public python-telethon-session-sqlalchemy
  (package
    (name "python-telethon-session-sqlalchemy")
    (version "0.2.15")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "telethon-session-sqlalchemy" version))
        (sha256
          (base32
            "1lkzlqy7jyyx51i7zdqfv2fv8x8bl3xszbpcv3ndvrjvbpch79ib"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("python-sqlalchemy" ,python-sqlalchemy)))
    (home-page
      "https://github.com/tulir/telethon-session-sqlalchemy")
    (synopsis
      "SQLAlchemy backend for Telethon session storage")
    (description
      "SQLAlchemy backend for Telethon session storage")
    (license #f)))

(define-public python-telethon
  (package
    (name "python-telethon")
    (version "1.10.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "Telethon" version))
        (sha256
          (base32
            "1ql8ai01c6v3l13lh3csh37jjkrb33gj50jyvdfi3qjn60qs2rfl"))))
    (build-system python-build-system)
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

(define-public python-commonmark
  (package
    (name "python-commonmark")
    (version "0.9.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "commonmark" version))
        (sha256
          (base32
            "1q1cg7pd2lnaf3rrcwndbjqk7l79i5knpq8ip0x3gplf0zdwazw6"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("python-future" ,python-future)))
    (native-inputs
      `(("python-flake8" ,python-flake8)
        ("python-hypothesis" ,python-hypothesis)))
    (home-page
      "https://github.com/rtfd/CommonMark-py")
    (synopsis
      "Python parser for the CommonMark Markdown spec")
    (description
      "Python parser for the CommonMark Markdown spec")
    (license #f)))

(define-public python-mautrix-appservice
  (package
    (name "python-mautrix-appservice")
    (version "0.3.11")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "mautrix-appservice" version))
        (sha256
          (base32
            "19929z41d9nxs7909g809xgw2gp3fqra98zfjv8gsnpprwh2j6b0"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("python-aiohttp" ,python-aiohttp)
        ("python-future-fstrings"
         ,python-future-fstrings)))
    (home-page
      "https://github.com/tulir/mautrix-appservice-python")
    (synopsis
      "A Python 3 asyncio-based Matrix application service framework.")
    (description
      "A Python 3 asyncio-based Matrix application service framework.")
    (license #f)))

(define-public python-mautrix-telegram
  (package
    (name "python-mautrix-telegram")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "mautrix-telegram" version))
        (sha256
          (base32
            "0g8r7g4dgasbf1pvrdmkqp7i3cvcj3wkizs7dqzy9xqyis1l3vgv"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("python-aiohttp" ,python-aiohttp)
        ("python-alembic" ,python-alembic)
        ("python-commonmark" ,python-commonmark)
        ("python-future-fstrings"
         ,python-future-fstrings)
        ("python-magic" ,python-magic)
        ("python-mautrix-appservice"
         ,python-mautrix-appservice)
        ("python-ruamel.yaml" ,python-ruamel.yaml)
        ("python-sqlalchemy" ,python-sqlalchemy)
        ("python-pytest-runner" ,python-pytest-runner)
        ("python-telethon" ,python-telethon)
        ("python-telethon-session-sqlalchemy"
         ,python-telethon-session-sqlalchemy)))
    (home-page
      "https://github.com/tulir/mautrix-telegram")
    (synopsis
      "A Matrix-Telegram hybrid puppeting/relaybot bridge.")
    (description
      "A Matrix-Telegram hybrid puppeting/relaybot bridge.")
    (license #f)))

(define-public python-matrix-client
  (package
    (name "python-matrix-client")
    (version "0.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "matrix-client" version))
        (sha256
          (base32
            "1mgjd0ymf9mvqjkvgx3xjhxap7rzdmpa21wfy0cxbw2xcswcrqyw"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-requests" ,python-requests)))
    (native-inputs
      `(("python-pytest-runner" ,python-pytest-runner)
        ("python-pytest" ,python-pytest)
        ("python-responses" ,python-responses)))
    (home-page
      "https://github.com/matrix-org/matrix-python-sdk")
    (synopsis "Client-Server SDK for Matrix")
    (description "Client-Server SDK for Matrix")
    (license #f)))

(define-public python-matrix-dl
  (let ((commit "b24b9c702b19b88a07b6da6ae91b659179fee1fe")
        (revision "1"))
    (package
      (name "python-matrix-dl")
      (version (string-append name "-" revision "." (string-take commit 7)))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://gitlab.gnome.org/thiblahute/matrix-dl")
                       (commit commit)))
                (sha256
                  (base32
                    "01lkq0igzcy7cnvbrrqlc1jpbqvxdp8s6ma16blml6pd1imbxk7b"))))
      (build-system python-build-system)
      (propagated-inputs
        `(("python-matrix-client" ,python-matrix-client)))
      (home-page "https://gitlab.gnome.org/thiblahute/matrix-dl")
      (synopsis "")
      (description "")
      (license #f))))
