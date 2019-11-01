(define-module (levy packages neovim)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages)
  #:use-module (guix build-system gnu))

;; TBD: refactor again...

(define (make-arguments tests directories)
  `(#:tests? ,tests
    #:phases
    (modify-phases %standard-phases
       (delete 'configure)
       (delete 'build)
       (replace 'install
         (lambda* (#:key outputs #:allow-other-keys)
           (let* ((out (assoc-ref outputs "out"))
                  (vimfiles (string-append out "/share/nvim/site"))
                  ,@(map (lambda (x)
                           `(,x (string-append vimfiles "/" ,(symbol->string x))))
                         directories))
             ,@(map (lambda (x)
                      `(copy-recursively ,(symbol->string x) ,x))
                    directories)
             #t))))))

(define* (neovim-plugin
           #:key name directories url synopsis description
                 license version hash commit tests home-page
                 revision)
  (package
    (name name)
    (version (string-append version "-" revision "." (string-take commit 7)))
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url url)
               (commit commit)))
        (file-name (string-append name "-" version "-checkout"))
        (sha256
          (base32
            hash))))
    (build-system gnu-build-system)
    (arguments (make-arguments tests directories))
    (synopsis synopsis)
    (description description)
    (home-page (if home-page home-page url))
    (license license)))

(define-public neovim-mercury
  (package
    (name "neovim-mercury")
    (version "2019-02-05")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://dl.mercurylang.org/rotd/mercury-srcdist-rotd-"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1k32m5qz02ry05sgb5fyn6lvbfjzvcx5517yjsnhqz2j3dimn7py"))))
    (build-system gnu-build-system)
    (arguments
      '(#:tests? #f
        #:phases
        (modify-phases %standard-phases
           (delete 'configure)
           (delete 'build)
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                      (vimfiles (string-append out "/share/nvim/site"))
                      (doc (string-append vimfiles "/doc"))
                      (ftdetect (string-append vimfiles "/ftdetect"))
                      (ftplugin (string-append vimfiles "/ftplugin"))
                      (syntax (string-append vimfiles "/syntax"))
                      (source (lambda (X) (string-append "vim/" X))))
                 (copy-recursively (source "doc") doc)
                 (copy-recursively (source "ftdetect") ftdetect)
                 (copy-recursively (source "ftplugin") ftplugin)
                 (copy-recursively (source "syntax") syntax)
                 (substitute* (string-append ftplugin "/mercuryhdr.sh")
                   (("/bin/sh") (which "sh")))
                 #t))))))
    (synopsis "")
    (description "")
    (home-page "")
    (license license:gpl2)))

(define-public neovim-nerdtree
  (neovim-plugin
    #:name "neovim-nerdtree"
    #:version "0.0.0"
    #:revision "1"
    #:commit "4dada8c04fba25e788ea1836c82f9c18c1166b44"
    #:hash "1dpfzbz02a47g84j5nxhb0qahpzg1fwnm4qyabjni2faz73v7ddk"
    #:url "https://github.com/scrooloose/nerdtree"
    #:directories '(autoload doc lib nerdtree_plugin plugin syntax)
    #:tests #f
    #:synopsis ""
    #:description ""
    #:home-page "https://github.com/scrooloose/nerdtree"
    #:license license:expat))

(define-public neovim-racket
  (neovim-plugin
    #:name "neovim-racket"
    #:version "0.0.0"
    #:revision "1"
    #:commit "490e6a7896ba31afad0cf8eaa53ea84eb25eaaa2"
    #:hash "0pjp2sfdd12b20mxrds8sags7p6mk1w0vlpjl3q1zzhgwa5v01bl"
    #:url "https://github.com/wlangstroth/vim-racket"
    #:directories '(autoload ftdetect ftplugin indent syntax)
    #:tests #f
    #:synopsis ""
    #:description ""
    #:home-page "https://github.com/wlangstroth/vim-racket"
    #:license license:expat))

(define-public neovim-paredit
  (neovim-plugin
    #:name "neovim-paredit"
    #:version "0.0.0"
    #:revision "1"
    #:commit "791c3a0cc3155f424fba9409a9520eec241c189c"
    #:hash "15lg33bgv7afjikn1qanriaxmqg4bp3pm7qqhch6105r1sji9gz9"
    #:url "https://github.com/vim-scripts/paredit.vim"
    #:directories '(doc plugin)
    #:synopsis "Paredit Mode: Structured Editing of Lisp S-expressions"
    #:description
"Paredit performs structured editing of Lisp S-expressions in Vim. Paredit.vim
is similar to paredit.el for Emacs. Paredit Mode tries to maintain the balanced
state of matched characters (parenthesis marks, square and curly braces, double
quotes). Matched characters are inserted and removed in pairs, also when
working with a block of text (well, mostly). Paredit also implements many
paredit.el s-expression handling functions, like Split/Join/Wrap/Splice/Raise.
Slurpage and Barfage known from Emacs is also possible but in a different
fashion: you don't move the list element in or out of the list, rather you move
the opening or closing parenthesis over the element or sub-list."
    #:home-page "https://github.com/vim-scripts/paredit.vim"
    #:license license:expat))

(define-public neovim-gitgutter
  (neovim-plugin
    #:name "neovim-gitgutter"
    #:version "0.0.0"
    #:revision "1"
    #:commit "afa4f2ddf0fecb37914ec37357636abb18013422"
    #:hash "1bf2bxn967sw1x4mxfy43p0k4cgi719pg3gsk7yqih8imb22ihdl"
    #:url "https://github.com/airblade/vim-gitgutter"
    #:directories '(autoload doc plugin)
    #:tests #f
    #:synopsis "A Vim plugin which shows a git diff in the gutter and stages/undoes hunks."
    #:description
"A Vim plugin which shows a git diff in the gutter (sign column) and
stages/undoes hunks."
    #:home-page "https://github.com/airblade/vim-gitgutter"
    #:license license:expat))

(define-public neovim-supertab
  (neovim-plugin
    #:name "neovim-supertab"
    #:version "0.0.0"
    #:revision "1"
    #:commit "40fe711e088e2ab346738233dd5adbb1be355172"
    #:hash "0l5labq68kyprv63k1q35hz5ly0dd06mf2z202mccnix4mlxf0db"
    #:url "https://github.com/ervandew/supertab"
    #:directories '(ftplugin doc plugin)
    #:tests #f
    #:synopsis "Perform all your vim insert mode completions with Tab"
    #:description "Perform all your vim insert mode completions with Tab"
    #:home-page "https://github.com/ervandew/supertab"
    #:license license:expat))

(define-public neovim-purescript
  (neovim-plugin
    #:name "neovim-purescript"
    #:version "1.0.0"
    #:revision "1"
    #:commit "67ca4dc4a0291e5d8c8da48bffc0f3d2c9739e7f"
    #:hash "1insh39hzbynr6qxb215qxhpifl5m8i5i0d09a3b6v679i7s11i8"
    #:url "https://github.com/purescript-contrib/purescript-vim"
    #:directories '(ftdetect ftplugin indent syntax)
    #:tests #f
    #:synopsis ""
    #:description ""
    #:home-page "https://github.com/purescript-contrib/purescript-vim"
    #:license #f))

(define-public neovim-psc-ide
  (neovim-plugin
    #:name "neovim-psc-ide"
    #:version "1.0.0"
    #:revision "1"
    #:commit "6d4a3cc27e9782b703f6dd61ef5fdf27054bac0f"
    #:hash "19w0cvrka3klxbh9z1yq873v92rhmxdj68bdnqxzwybf24hgsk9g"
    #:url "https://github.com/FrigoEU/psc-ide-vim"
    #:directories '(ftplugin doc syntax_checkers autoload)
    #:tests #f
    #:synopsis ""
    #:description ""
    #:home-page "https://github.com/purescript-contrib/purescript-vim"
    #:license #f))

(define-public neovim-gdscript3
  (neovim-plugin
    #:name "neovim-gdscript3"
    #:version "0.2"
    #:revision "1"
    #:commit "24053ca5e9b222aa4d6e224edd269baa2ae86c8d"
    #:hash "0b9ghcjiwkkldvg1zwyhi8163dcbg6sh64zrd8nk081qlbrs4shb"
    #:url "https://github.com/calviken/vim-gdscript3"
    #:directories '(ftdetect ftplugin indent python syntax)
    #:tests #f
    #:synopsis ""
    #:description ""
    #:home-page "https://github.com/calviken/vim-gdscript3"
    #:license #f))

(define-public neovim-rainbow
  (neovim-plugin
    #:name "neovim-rainbow"
    #:version "0.0.0"
    #:revision "1"
    #:commit "85d262156fd3c0556b91c88e2b72f93d7d00b729"
    #:hash "0bws1fyw7lqc4frx6wn0k19nxbnjqw6wygdp0p6fixkr7rggy1p2"
    #:url "https://github.com/luochen1990/rainbow"
    #:directories '(autoload plugin)
    #:tests #f
    #:synopsis "Rainbow Parentheses Improved."
    #:description
"Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast,
powerful configuration."
    #:home-page "https://github.com/luochen1990/rainbow"
    #:license license:expat))

(define-public neovim-lastplace
  (neovim-plugin
    #:name "neovim-lastplace"
    #:version "0.0.0"
    #:revision "1"
    #:commit "c05db65464e26aef281d4c1e0006d0504f2f76d7"
    #:hash "0kq44q1ays0wwlfb3yqrfji3bfxpvbsrpzpp9dcf84836p0fpr1j"
    #:url "https://github.com/farmergreg/vim-lastplace"
    #:directories '(doc plugin)
    #:tests #f
    #:synopsis "Intelligently reopen files at your last edit position in Vim"
    #:description "Intelligently reopen files at your last edit position in Vim"
    #:home-page "https://github.com/farmergreg/vim-lastplace"
    #:license license:expat))

(define-public neovim-asyncrun
  (neovim-plugin
    #:name "neovim-asyncrun"
    #:version "0.0.0"
    #:revision "1"
    #:commit "2df94f619fe7153f6a9272263da5b88080f7dc38"
    #:hash "05bkm08dg2488rxrpr4nyzfcss452q3hd6k3wjvk0lky4q5785i6"
    #:url "https://github.com/skywind3000/asyncrun.vim"
    #:directories '(doc plugin)
    #:tests #f
    #:synopsis "Run Async Shell Commands in Vim 8.0 / NeoVim and Output to Quickfix Window"
    #:description "Run Async Shell Commands in Vim 8.0 / NeoVim and Output to Quickfix Window"
    #:home-page "https://github.com/skywind3000/asyncrun.vim"
    #:license license:expat))

(define-public neovim-tabular
  (neovim-plugin
    #:name "neovim-tabular"
    #:version "0.0.0"
    #:revision "1"
    #:commit "00e1e7fcdbc6d753e0bc8043e0d2546fa81bf367"
    #:hash "185jpisk9hamcwb6aiavdzjdbbigzdra8f4mgs98r9cm9j448xkz"
    #:url "https://github.com/godlygeek/tabular"
    #:directories '(autoload after plugin)
    #:tests #f
    #:synopsis "Vim script for text filtering and alignment"
    #:description "Vim script for text filtering and alignment"
    #:home-page "https://github.com/godlygeek/tabular"
    #:license license:expat))

(define-public neovim-limelight
  (neovim-plugin
    #:name "neovim-limelight"
    #:version "0.0.0"
    #:revision "1"
    #:commit "106fb5749d227a0de72e36068ed72798c6fd48e6"
    #:hash "0fp4yp50n5v5zx3a7afh9wip4nwcfhmdgdzwpnl79jvild1z9fgh"
    #:url "https://github.com/junegunn/limelight.vim"
    #:directories '(autoload plugin)
    #:tests #f
    #:synopsis "Hyperfocus-writing in Vim"
    #:description "Hyperfocus-writing in Vim"
    #:home-page "https://github.com/junegunn/limelight.vim"
    #:license license:expat))

(define-public neovim-goyo
  (neovim-plugin
    #:name "neovim-goyo"
    #:version "0.0.0"
    #:revision "1"
    #:commit "5b8bd0378758c1d9550d8429bef24b3d6d78b592"
    #:hash "0jh2gyf6v1vl12hygzwylzsj1ivx7r6xrd75k2wfsy91b2pm9srj"
    #:url "https://github.com/junegunn/goyo.vim"
    #:directories '(autoload plugin)
    #:tests #f
    #:synopsis "Distraction-free writing in Vim"
    #:description "Distraction-free writing in Vim"
    #:home-page "https://github.com/junegunn/goyo.vim"
    #:license license:expat))

(define-public neovim-idris
  (neovim-plugin
    #:name "neovim-idris"
    #:version "0.0.0"
    #:revision "1"
    #:commit "091ed6b267749927777423160eeab520109dd9c1"
    #:hash "1zibar2vxcmai0k37ricwnimfdv1adxfbbvz871rc4l6h3q85if1"
    #:url "https://github.com/idris-hackers/idris-vim"
    #:directories '(after doc ftplugin ftdetect indent syntax syntax_checkers)
    #:tests #f
    #:synopsis "Idris interaction and syntax plugin"
    #:description "Idris interaction and syntax plugin"
    #:home-page "https://github.com/idris-hackers/idris-vim"
    #:license license:expat))

(define-public neovim-alchemist
  (neovim-plugin
    #:name "neovim-alchemist"
    #:version "0.0.0"
    #:revision "1"
    #:commit "336b3f549cc6028db7bf8a43f725b93250f9cae1"
    #:hash "19wzrydm1qciwagklhl7ln37ax69jfgzfw55k4cxbx7g972dg2s3"
    #:url "https://github.com/slashmili/alchemist.vim"
    #:directories '(after autoload doc elixir_sense pythonx rplugin syntax t
                    elixir_sense.py elixir_sense_client erl_terms.py)
    #:tests #f
    #:synopsis ""
    #:description ""
    #:home-page ""
    #:license license:expat))

(define-public neovim-lean
  (neovim-plugin
    #:name "neovim-lean"
    #:version "0.0.0"
    #:revision "1"
    #:commit "2ace010eb32603a65af7921954a0594a02523c6b"
    #:hash "0wq2lw4xx2qhz1xii9g7i6wz0y43b2icqrm6ypr9jmaac1rhiq7c"
    #:url "https://github.com/leanprover/lean.vim"
    #:directories '(ftdetect syntax)
    #:tests #f
    #:synopsis "This plugins provides basic syntax highlighting for Lean files."
    #:description "This plugins provides basic syntax highlighting for Lean files."
    #:home-page "https://github.com/leanprover/lean.vim"
    #:license #f))

(define-public neovim-rust
  (neovim-plugin
    #:name "neovim-rust"
    #:version "0.0.0"
    #:revision "1"
    #:commit "97fdc4e4975515d8e8a5a82380dd85628d59a005"
    #:hash "1ggnl9h0jqb3zf8n8vpvlizxb3fikmghwpj8d3xq3ny54wfjgx78"
    #:url "https://github.com/rust-lang/rust.vim"
    #:directories '(after autoload compiler ctags doc ftdetect
                    ftplugin indent plugin syntax syntax_checkers test)
    #:tests #f
    #:synopsis "This is a Vim plugin that provides Rust file detection,
syntax highlighting, formatting, Syntastic integration, and more."
    #:description "This is a Vim plugin that provides Rust file detection,
syntax highlighting, formatting, Syntastic integration, and more."
    #:home-page "https://github.com/rust-lang/rust.vim"
    #:license #f))

;(define-public neovim-grammarous
;  (package
;    (name "neovim-grammarous")
;    (version "0.0.0")
;    (source (origin
;              (method git-fetch)
;              (uri (git-reference
;                     (url "https://github.com/rhysd/vim-grammarous")
;                     (commit "083cbee6094c9ec347d7c75af421be27d2ec7e70")))
;              (hash "1cxycr2ijzxn9d5xgp9ri4f2i4d87a3100nsc11iwa2bzir4xsiz")))
;    (arguments
;      '(#:tests? #f
;        #:phases
;        (modify-phases %standard-phases
;           (delete 'configure)
;           (delete 'build)
;           (replace 'install
;             (lambda* (#:key outputs #:allow-other-keys)
;               (let* ((out (assoc-ref outputs "out"))
;                      (vimfiles (string-append out "/share/nvim/site"))
;                      ,@(map (lambda (x)
;                               `(,x (string-append vimfiles "/" ,(symbol->string x))))
;                             directories))
;                 ,@(map (lambda (x)
;                          `(copy-recursively ,(symbol->string x) ,x))
;                        directories)
;                 #t))))))
;    (synopsis "vim-grammarous is a powerful grammar checker for Vim.")
;    (description "vim-grammarous is a powerful grammar checker for Vim.")
;    (home-page "https://github.com/rhysd/vim-grammarous")
;    (license #f)))
