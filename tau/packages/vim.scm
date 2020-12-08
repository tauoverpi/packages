(define-module (tau packages vim)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python)
  #:use-module (guix build-system copy))

(define-public neovim-elm
  (let ((commit "4b71facd77297cb33bbb3b14894676cff0a9bd1d"))
    (package
      (name "neovim-elm")
      (version "4b71fac")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/ElmCast/elm-vim")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "1kxkjm6fzmircg5gh7w2bmvjgk8ly5vvq9l31m4p6ql48azg2ilc"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("doc" "share/nvim/site/doc")
           ("syntax" "share/nvim/site/syntax")
           ("autoload" "share/nvim/site/autoload")
           ("plugin" "share/nvim/site/plugin")
           ("ftplugin" "share/nvim/site/ftplugin")
           ("rplugin" "share/nvim/site/rplugin")
           ("indent" "share/nvim/site/indent")
           ("syntax_checkers/elm" "share/nvim/site/syntax_checkers/elm")
           ("ftdetect" "share/nvim/site/ftdetect"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public neovim-pandoc-syntax
  (let ((commit "0d1129e5cf1b0e3a90e923c3b5f40133bf153f7c"))
    (package
      (name "neovim-pandoc-syntax")
      (version "0d1129e")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/vim-pandoc/vim-pandoc-syntax")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "162l2p8md8lfyfjxzlmlz5ky5kvvr6wjmdk8r8lk6ygpkl2b51f7"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("doc" "share/nvim/site/doc")
           ("syntax" "share/nvim/site/syntax")
           ("autoload" "share/nvim/site/autoload")
           ("plugin" "share/nvim/site/plugin"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public neovim-clang-format
  (let ((commit "95593b67723f23979cd7344ecfd049f2f917830f"))
    (package
      (name "neovim-clang-format")
      (version "95593b6")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "95593b67723f23979cd7344ecfd049f2f917830f")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "0n0k13k63l8n0ixs4zrhlz923apvdp2mldadxqlhmvsvncmlqmpn"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("doc" "share/nvim/site/doc")
           ("autoload" "share/nvim/site/autoload")
           ("plugin" "share/nvim/site/plugin"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public neovim-deoplete
  (let ((commit "14ebc58db0c6c0f7b5349a2ef5a4c47a61b8785f"))
    (package
      (name "neovim-deoplete")
      (version "14ebc58")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/shougo/deoplete.nvim")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "1rzck3n5184k8pl0yn77nwa0a4slb6fka05rijd585mfjfx630hf"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("doc" "share/nvim/site/doc")
           ("rplugin" "share/nvim/site/rplugin")
           ("autoload" "share/nvim/site/autoload")
           ("plugin" "share/nvim/site/plugin"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public neovim-floobits
  (let ((commit "29ab2ed4bd5c879df0bd6df313a776155eb98ad8"))
    (package
      (name "neovim-floobits")
      (version "2c7aa8a")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/floobits/floobits-neovim")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "0f17jk45zy4yhdzq9sk7mbjsli0fkixgr48xbg5wcvmc28zj2abp"))))
      (build-system copy-build-system)
      (propagated-inputs `(("python" ,python)))
      (arguments
       '(#:install-plan
         '(("doc" "share/nvim/site/doc")
           ("rplugin" "share/nvim/site/rplugin")
           ("plugin" "share/nvim/site/plugin"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public neovim-gruvbox
  (let ((commit "040138616bec342d5ea94d4db296f8ddca17007a"))
    (package
      (name "neovim-gruvbox")
      (version "0401386")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/morhetz/gruvbox")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "0qk2mqs04qlxkc1ldgjbiv1yisi2xl2b8svmjz0hdp9y2l5vfccw"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("autoload" "share/nvim/site/autoload")
           ("colors" "share/nvim/site/colors"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public neovim-ale
  (let ((commit "557a1ed5da70cb443a8650766f4e8ea95e8c0da3"))
    (package
      (name "neovim-ale")
      (version "0401386")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/dense-analysis/ale")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "05bbspz10ic1r0hznkbnb7i6r6rzdkydixf8qf2v36gl6ki3904b"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("autoload" "share/nvim/site/autoload")
           ("ale_linters" "share/nvim/site/ale_linters")
           ("doc" "share/nvim/site/doc")
           ("ftplugin" "share/nvim/site/ftplugin")
           ("plugin" "share/nvim/site/plugin")
           ("syntax" "share/nvim/site/syntax")
           ("rplugin" "share/nvim/site/rplugin"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license license:expat))))


(define-public neovim-lightline
  (let ((commit "afd88109a6e24c4cc0cb55ae70ca66c108f1c540"))
    (package
      (name "neovim-lightline")
      (version "afd8810")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/itchyny/lightline.vim")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "1cjb7klyigsqxv827bxdgp22b8cc5wihb1jfk7a8l63skliyqmg2"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("autoload" "share/nvim/site/autoload")
           ("doc" "share/nvim/site/doc")
           ("plugin" "share/nvim/site/plugin"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license license:expat))))

(define-public neovim-vebugger
  (let ((commit "15ab930a6cfbcf8660ded98c3afd289bed7804b0"))
    (package
      (name "neovim-vebugger")
      (version "15ab930")
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/idanarye/vim-vebugger")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32
            "1yg0zsjb5dlspxfamk4afq5mvw1cgr0j7c2m1s9qmp7prrkwg5v1"))))
      (build-system copy-build-system)
      (arguments
       '(#:install-plan
         '(("autoload" "share/nvim/site/autoload")
           ("plugin" "share/nvim/site/plugin")
           ("doc" "share/nvim/site/doc"))))
      (home-page "")
      (synopsis "")
      (description "")
      (license license:expat))))

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
      (home-page "")
      (synopsis "")
      (description "")
      (license license:expat))))


(define-public neovim-zig
  (let ((commit "fa5f6d7c5be47bd32dcc69ccf980fc585575cc38"))
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
            "0szrnp27ccl93fbn1j9ybsld1l6j3xdrnx6dsf01gdxidm3w60f3"))))
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


