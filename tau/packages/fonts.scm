(define-module (tau packages fonts)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix licenses)
  #:use-module (guix build-system font))

(define-public font-victor-mono
  (package
    (name "font-victor-mono")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/rubjo/victor-mono/archive/v"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1yfz2c36yhz7a99sfq0q0d3phjf6m1isd862z4hxl66ravy966sr"))))
    (build-system font-build-system)
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))


(define-public font-scientifica
  (package
    (name "font-scientifica")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                     "https://github.com/NerdyPepper/scientifica/releases/download/v"
                     version
                     "/scientifica-v"
                     version
                     ".tar"))
              (sha256
                (base32
                  "1djsgv6sgfw4kay6wbks3yqgrmbyyxq4i21aqg1hj0w5ww4wwn9i"))))
    (build-system font-build-system)
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public font-dotsies
  (package
    (name "font-dotsies")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://dotsies.org/Dotsies.ttf")
       (sha256
        (base32
         "0cg0ay1524k178rzaipx6nw7pv15ibwynpx2w4lp8h9xb10k40nn"))))
    (build-system font-build-system)
    (home-page "http://dotsies.org")
    (synopsis "Dotsies is a font that uses dots instead of letters")
    (description
     "@code{Dotsies} Dotsies is a font that uses dots instead of letters.
Dotsies is optimized for reading. The letters in each word smoosh together,
so words look like shapes.")
    (license silofl1.1)))

(define-public font-euclid-initials
  (package
    (name "font-euclid-initials")
    (version "1.0")
    (source
      (origin
        (method url-fetch/zipbomb)
        (uri "https://www.c82.net/downloads/euclid-initials-font.zip")
        (sha256
          (base32
            "089zckwzggdcpn8ivdcr2rkbg5lms045d0gdcfydkin97s5fjlmm"))))
    (build-system font-build-system)
    (home-page "http://dotsies.org")
    (synopsis "")
    (description "")
    (license silofl1.1)))

(define-public font-hellvetica
  (package
    (name "font-hellvetica")
    (version "1.0")
    (source
      (origin
        (method url-fetch)
        (uri "https://hellveticafont.com/s/Hellvetica.ttf")
        (sha256
          (base32
            "0nkngd2k04w0ay892lmkbmq10y3pmh3gszvgv1aa2zjrg4a5j0x2"))))
    (build-system font-build-system)
    (home-page "https://hellveticafont.com/")
    (synopsis "")
    (description "")
    (license silofl1.1)))
