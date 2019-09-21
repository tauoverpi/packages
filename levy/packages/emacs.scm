(define-module (levy packages emacs)
  #:use-module (guix packages)
  #:use-module (guix licenses)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs-xyz))

(define-public emacs-doom-themes
  (package
   (name "emacs-doom-themes")
   (version "2.1.6")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://github.com/hlissner/emacs-doom-themes/archive/v"
                                version
                                ".tar.gz"))
            (sha256
             (base32
              "0yw7klp2a46a0k4bl3vwcr4wrnhlslf84zndayxasylcax2mjn6y"))))
   (build-system emacs-build-system)
   (arguments
    `(#:tests? #t
      #:test-command '("ert-runner")
      #:phases
       (modify-phases %standard-phases
         ;; Move the source files to the top level, which is included in
         ;; the EMACSLOADPATH.
         (add-after 'unpack 'move-source-files
           (lambda _
             (let ((el-files (find-files "./themes" ".*\\.el$")))
               (for-each (lambda (f)
                           (rename-file f (basename f)))
                         el-files))
             #t)))))

   (native-inputs `(("emacs-ert-runner" ,emacs-ert-runner)))
   (inputs `(("emacs-all-the-icons" ,emacs-all-the-icons)))
   (synopsis "")
   (description "")
   (home-page "")
   (license expat)))

(define-public emacs-doom-modeline
  (package
   (name "emacs-doom-modeline")
   (version "1.8.1")
   (source (origin
      (method url-fetch)
      (uri (string-append "https://github.com/seagle0128/doom-modeline/archive/v"
        version
        ".tar.gz"))
      (sha256
       (base32
        "1bxzxfvzgg0rjnnkvksriakgv1bblgafavfl92gx45w88nx408li"))))
   (build-system emacs-build-system)
   (arguments
    `(#:tests? #f
      #:test-command '("ert-runner")))
   (native-inputs `(("emacs-ert-runner" ,emacs-ert-runner)))
   (inputs `(("emacs-all-the-icons" ,emacs-all-the-icons)))
   (synopsis "")
   (description "")
   (home-page "")
   (license #f)))

(define-public emacs-monotropic-theme
  (let ((commit "36df566aa8225e303f6c9d90c00740dd678a415e")
        (revision "1"))
    (package
     (name "emacs-monotropic-theme")
     (version (string-append name "-" revision "." (string-take commit 7)))
     (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/caffo/monotropic-theme")
                    (commit commit)))
              (sha256
               (base32 "05n8s3719f6yrh4fi5xyzzlhpsgpbc60mmfmzycxlb4sinq9bfks"))))
     (build-system emacs-build-system)
     (synopsis "")
     (description "")
     (home-page "")
     (license expat))))

(define-public emacs-solaire-mode
  (package
   (name "emacs-solaire-mode")
   (version "1.0.9")
   (source (origin
      (method url-fetch)
      (uri (string-append "https://github.com/hlissner/emacs-solaire-mode/archive/v"
        version
        ".tar.gz"))
      (sha256
       (base32
        "17rpjy00mydlr8jd8y89ly0rgdyps0sz5f6qwfhnda0hrpp7zn6h"))))
   (build-system emacs-build-system)
   (synopsis "")
   (description "")
   (home-page "")
   (license #f)))

(define-public emacs-elixir-mode
  (package
   (name "emacs-elixir-mode")
   (version "2.3.1")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://github.com/elixir-editors/emacs-elixir/archive/v"
                                version
                                ".tar.gz"))
            (sha256
             (base32
              "0vdy3m59s2w0c87mwn867f3gyrn6ssnmv7paxzrlyf2q4w2mpbfs"))))
   (build-system emacs-build-system)
   (inputs
    `(("emacs-pkg-info" ,emacs-pkg-info)))
   (synopsis "")
   (description "")
   (home-page "")
   (license #f)))

(define-public emacs-alchemist
  (package
   (name "emacs-alchemist")
   (version "1.8.2")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://github.com/tonini/alchemist.el/archive/v"
                                version
                                ".tar.gz"))
            (sha256
             (base32
              "1jfh4nq2815wzryw5p2r25j7iz2nfb1s554bc42n3kqvs5q6ny2f"))))
   (build-system emacs-build-system)
   (propagated-inputs
    `(("emacs-dash" ,emacs-dash)
      ("emacs-company" ,emacs-company)
      ("emacs-pkg-info" ,emacs-pkg-info)
      ("emacs-elixir-mode" ,emacs-elixir-mode)))
   (synopsis "")
   (description "")
   (home-page "")
   (license #f)))

(define-public emacs-jdee
  (package
    (name "emacs-jdee")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jdee-emacs/jdee/archive/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "08wg90k6p06kw24jzz76pqh7kfd85y5x05aqv7fhjyp1cwlfn2wh"))))
    (build-system emacs-build-system)
    (inputs
      `(("emacs-flycheck" ,emacs-flycheck)
        ("emacs-dash" ,emacs-dash)
        ("emacs-memoize" ,emacs-memoize)))
    (synopsis "The JDEE is an add-on software package that turns Emacs into a comprehensive system for creating, editing, debugging, and documenting Java applications.")
    (description "The JDEE is an add-on software package that turns Emacs into a comprehensive system for creating, editing, debugging, and documenting Java applications.")
    (home-page "")
    (license #f)))

(define-public emacs-ats2
  (let ((commit "f18c61587aa78f5d8029021c507ab01397435091")
        (revision "1"))
   (package
    (name "emacs-ats2")
    (version (string-append name "-" revision "." (string-take commit 7)))
    (source (origin
             (method git-fetch)
             (uri (git-reference
                   (url "https://github.com/ShigekiKarita/ats2-emacs-suite")
                   (commit commit)))
             (file-name (string-append name "-" version "-checkout"))
             (sha256
              (base32
               "0mdgn8hq6b39lg31ka0krpcida01xgbx0ywmhz025gvppd6q5vbc"))))
    (build-system emacs-build-system)
    (inputs
     `(("emacs-flycheck" ,emacs-flycheck)))
    (synopsis "")
    (description "")
    (home-page "")
    (license #f))))

(define-public emacs-metal-mercury-mode
  (let ((commit "2710d467758eafcca9b987eb156ed869cf3783ee")
        (revision "1"))
    (package
     (name "emacs-metal-mercury-mode")
     (version (string-append name "-" revision "." (string-take commit 7)))
     (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ahungry/metal-mercury-mode")
                    (commit commit)))
              (sha256
               (base32
                "14imbczf8g9hsr9yii0k9spcgi16m3ifz5dyfdgvcwj8mcp8ynf9"))))
    (build-system emacs-build-system)
    (synopsis "")
    (description "")
    (home-page "")
    (license #f))))
