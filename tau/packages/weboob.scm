(define-module (tau packages weboob)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages time)
  #:use-module (gnu packages xml)
  #:use-module (guix build-system python))

(define-public python-weboob
  (package
    (name "python-weboob")
    (version "2.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "weboob" version))
        (sha256
          (base32
            "1c69vzf8sg8471lcaafpz9iw2q3rfj5hmcpqrs2k59fkgbvy32zw"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
      `(("python-babel" ,python-babel)
        ("python-cssselect" ,python-cssselect)
        ("python-dateutil" ,python-dateutil)
        ("python-html2text" ,python-html2text)
        ("python-lxml" ,python-lxml)
        ("python-pillow" ,python-pillow)
        ("python-pyyaml" ,python-pyyaml)
        ("python-requests" ,python-requests)
        ("python-six" ,python-six)
        ("python-unidecode" ,python-unidecode)))
    (home-page "https://weboob.org/")
    (synopsis "Weboob, Web Outside Of Browsers")
    (description "Weboob, Web Outside Of Browsers")
    (license #f)))
