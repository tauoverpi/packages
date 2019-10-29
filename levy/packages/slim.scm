(define-module (levy packages slim)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (guix git-download))

(define-public slim-themes
  (let ((commit "f2893415211fbc02477b9d46f37e3118a8c11982")
        (revision "1"))
    (package
      (name "slim-themes")
      (version (string-append "0.1.0" "-" revision "." (string-take commit 7)))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/adi1090x/slim_themes")
                       (commit commit)))
                (sha256
                  (base32
                    "1dinb0afg6cyv5m3pgs0yamqsbgi986w0m7w89jwkw09qnf7hvll"))))
      (build-system trivial-build-system)
      (arguments
        '(#:modules ((guix build utils))
          #:builder
          (let* ((out (assoc-ref %outputs "out"))
                (themes (string-append out "/share/themes"))
                (src (assoc-ref %build-inputs "source")))
            (begin (use-modules (guix build utils))
                   (mkdir-p themes)
                   (copy-recursively (string-append src "/themes") themes)))))
      (synopsis "")
      (description "")
      (home-page "https://github.com/adi1090x/slim_themes")
      (license #f))))
