(define-module (levy packages firmware)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))

(define (linux-firmware-version)
  "7bc246451318b3536d9bfd3c4e46d541a9831b33") ; 4.20.13
(define (linux-firmware-source version)
  (origin
    (method git-fetch)
    (uri (git-reference
          (url (string-append "https://git.kernel.org/pub/scm/linux/kernel"
                              "/git/firmware/linux-firmware.git"))
          (commit version)))
    (file-name (string-append "linux-firmware-" version "-checkout"))
    (sha256
     (base32
       "1qxzwjkn6lcm2rp33gd2hdwyngcbhq2zlm6p58r2h14bg5f142kw"))))

(define-public iwlwifi-firmware-nonfree
  (package
    (name "iwlwifi-firmware-nonfree")
    (version (linux-firmware-version))
    (source (linux-firmware-source version))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder (begin
                   (use-modules (guix build utils))
                   (let ((source (assoc-ref %build-inputs "source"))
                         (fw-dir (string-append %output "/lib/firmware/")))
                     (mkdir-p fw-dir)
                     (for-each (lambda (file)
                                 (copy-file file
                                            (string-append fw-dir (basename file))))
                               (find-files source
                                           "iwlwifi-.*\\.ucode$|LICENSE\\.iwlwifi_firmware$"))
                     #t))))
    (home-page "https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi")
    (synopsis "Non-free firmware for Intel wifi chips")
    (description "Non-free iwlwifi firmware")
    (license (license:non-copyleft
              "https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/tree/LICENCE.iwlwifi_firmware?id=HEAD"))))

