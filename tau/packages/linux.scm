(define-module (tau packages linux)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (gnu packages linux))

(define (linux-nonfree-urls version)
  (list (string-append
         "https://www.kernel.org/pub/linux/kernel/v5.x/"
         "linux-" version ".tar.xz")))

(define-public linux-nonfree
  (package/inherit linux-libre
    (name "linux-nonfree")
    (source (origin
              (method url-fetch)
              (uri (linux-nonfree-urls (package-version linux-libre)))
              (sha256
               (base32
                 "1m06k19pbb3wz8z2dgf03jvzbbdh6q8jwwdz509s902a53vxasz1"))))
    (synopsis "Mainline Linux kernel, nonfree binary blobs included")
    (description "Linux is a kernel.")
    (license license:gpl2) ; and non-free firmware
    (home-page "https://kernel.org")))
