
(define-module (levy packages perl)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system perl)
  #:use-module (gnu packages perl))

(define-public perl-parse-earley
  (package
    (name "perl-parse-earley")
    (version "0.15")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "mirror://cpan/authors/id/L/LP/LPALMER/Parse-Earley-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1s54lwryi6m1rqnp4sb6iwpfs6xkckmpk5hmk3dmkd5wk2m9d7di"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Parse-Earley")
    (synopsis "Parse any Context-Free Grammar")
    (description "")
    (license #f)))

