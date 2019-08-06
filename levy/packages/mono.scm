(define-module (levy packages mono)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (gnu packages mono))

(define-public mono-6.0.0.311
  (package
    (inherit mono)
    (version "6.0.0.311")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mono/mono/archive/mono-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1sdidackpwfchpk3p73hxh0ckdk9qp4g3y6r9vas09ila0kji35p"))))))

