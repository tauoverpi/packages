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
