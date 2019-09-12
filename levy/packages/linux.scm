(define-module (levy packages linux)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (gnu packages linux))

(define (linux-nonfree-urls version)
  (list (string-append
         "https://www.kernel.org/pub/linux/kernel/v5.x/"
         "linux-" version ".tar.xz")))

(define-public linux-nonfree
  (package
    (inherit linux-libre)
    (name "linux-nonfree")
    (version "5.2.2")
    (source (origin
              (method url-fetch)
              (uri (linux-nonfree-urls version))
              (sha256
               (base32
                 "173da67d51qcjwrczqsfd6g9phzazqzr11xfxwlf54ckd6117ng5"))))
    (synopsis "Mainline Linux kernel, nonfree binary blobs included")
    (description "Linux is a kernel.")
    (license license:gpl2) ; and non-free firmware
    (home-page "https://kernel.org")))
