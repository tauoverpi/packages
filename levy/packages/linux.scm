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
    (version "5.0.5")
    (source (origin
              (method url-fetch)
              (uri (linux-nonfree-urls version))
              (sha256
               (base32
                 "1l4l5kqmakqhkc59nha363866d5gkbc94mhnpyh802may9xq1gaz"
                 ))))
    (synopsis "Mainline Linux kernel, nonfree binary blobs included")
    (description "Linux is a kernel.")
    (license license:gpl2) ; and non-free firmware
    (home-page "https://kernel.org")))
