(define-module (levy packages fonts)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix licenses)
  #:use-module (guix build-system font)
  #:use-module (gnu packages))

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
