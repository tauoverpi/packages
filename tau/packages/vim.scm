(define-module (tau packages vim)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy))

(define-public neovim-neosnippet
  (let ((commit "d30231198ce1816165da017607133483ce1efed3"))
    (package
      (name "neovim-neosnippet")
      (version "d302311")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/shougo/neosnippet.vim")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "01hfb16qk3rq3bs9wn40yqcdvk31a8fjrii0r32k2hhn85xg5wji"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("autoload" "share/nvim/site/autoload")
           ("ftdetect" "share/nvim/site/ftdetect")
           ("ftplugin" "share/nvim/site/ftplugin")
           ("plugin" "share/nvim/site/plugin")
           ("indent" "share/nvim/site/indent")
           ("doc" "share/nvim/site/doc")
           ("rplugin" "share/nvim/site/rplugin")
           ("syntax" "share/nvim/site/syntax"))))
      (home-page "https://github.com/ziglang/zig.vim")
      (synopsis "")
      (description "")
      (license license:expat))))


(define-public neovim-zig
  (let ((commit "912e9c792702519ca03cd3e3048e8d276a5d3947"))
    (package
      (name "neovim-zig")
      (version "912e9c7")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/ziglang/zig.vim")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "1svy3bp8rhcbimcp5p4crz57fiv1p2xvcr4xs90frsncq1r483q9"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("autoload" "share/nvim/site/autoload")
           ("ftdetect" "share/nvim/site/ftdetect")
           ("ftplugin" "share/nvim/site/ftplugin")
           ("plugin" "share/nvim/site/plugin")
           ("syntax" "share/nvim/site/syntax"))))
      (home-page "https://github.com/ziglang/zig.vim")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public neovim-gitgutter
  (let ((commit "e31e9bb35f7346caab4fcf972d44449bdfd3230a"))
    (package
      (name "neovim-gitgutter")
      (version "e31e9bb")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/airblade/vim-gitgutter")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "1mmasjz0d6nyjjrlgwiz9kd420l16q90mhscwz3i65xw0zqlmcgj"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("autoload" "share/nvim/site/autoload")
           ("plugin" "share/nvim/site/plugin")
           ("test" "share/nvim/site/test")
           ("doc" "share/nvim/site/doc"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license #f))))

(define-public neovim-lastplace
  (package
    (name "neovim-lastplace")
    (version "3.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://github.com/farmergreg/vim-lastplace/archive/v"
               version ".tar.gz"))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "0hcipdhxs5bk5hg80bi37mj3nvn3ccv3c24y07bcsfls076vv2mf"))))
    (build-system copy-build-system)
    (arguments
     '(#:install-plan
       '(("plugin" "share/nvim/site/plugin")
         ("doc" "share/nvim/site/doc"))))
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

(define-public neovim-tabular
  (let ((commit "339091ac4dd1f17e225fe7d57b48aff55f99b23a"))
    (package
      (name "neovim-tabular")
      (version "339091a")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/godlygeek/tabular")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "0jq91770wsp2waw7pywxjqx59v0vg54gfzirgcd85pg61w22bfla"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("autoload" "share/nvim/site/autoload")
           ("plugin" "share/nvim/site/plugin")
           ("after" "share/nvim/site/after")
           ("doc" "share/nvim/site/doc"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license #f))))


(define-public neovim-limelight
  (let ((commit "26e913a2e061195245bc62d24009ab67143a3c32"))
    (package
      (name "neovim-limelight")
      (version "26e913a")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/junegunn/limelight.vim")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "0bxmihv9i96k6pl37pzgri03vbvjwlp34rl4gkj8w2ajhhi6nsnn"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("autoload" "share/nvim/site/autoload")
           ("plugin" "share/nvim/site/plugin")
           ("test" "share/nvim/site/test"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license #f))))

(define-public neovim-rainbow
  (let ((commit "4d15633cdaf61602e1d9fd216a77fc02e0881b2d"))
    (package
      (name "neovim-rainbow")
      (version "4d15633")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/luochen1990/rainbow")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "168mbdf2h3zhkqrdyyhh0pbkjdvxwida80rdwk8ml97mxxii8ziw"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("autoload" "share/nvim/site/autoload")
           ("plugin" "share/nvim/site/plugin")
           ("doc" "share/nvim/site/doc")
           ("tests" "share/nvim/site/tests"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license #f))))


