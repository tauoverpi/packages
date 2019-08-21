(define-module (levy packages mono)
  #:use-module (guix packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (gnu packages mono))

(define-public mono-6.0.0.319
  (package
    (inherit mono)
    (version "6.0.0.319")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://download.mono-project.com/sources/mono/mono-"
                                  version
                                  ".tar.xz"))
              (sha256
                (base32
                  "06i6ild0cxn4ygb9fg2121l4rg1x3rlcrzkvg5w82s7pifw80k3b"))))
    (build-system gnu-build-system)
    (arguments
      '(#:tests? #f
        #:phases
        (modify-phases %standard-phases
          (replace 'bootstrap
            (lambda _
              (copy-file "mono/mini/Makefile.am.in" "mono/mini/Makefile.in")
              (invoke "autoreconf" "-vfi"))))))
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("glib" ,glib)
       ("which" ,which)
       ("cmake" ,cmake)
       ("libtool" ,libtool)
       ("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libxslt" ,libxslt)
       ("perl" ,perl)
       ("python" ,python-2)))
    (synopsis "Compiler and libraries for the C# programming language")
    (description "Mono is a compiler, vm, debugger and set of libraries for
C#, a C-style programming language from Microsoft that is very similar to
Java.")
    (home-page "https://www.mono-project.com/")
    (license license:x11)))

; https://www.nuget.org/api/v2/package/<name>/<version>

(define* (nuget-package #:key name version nuget-name hash synopsis description home-page license (post #f))
  (package
    (name name)
    (version version)
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.nuget.org/api/v2/package/"
                                  nuget-name "/" version))
              (sha256
                (base32
                  hash))))
    (build-system trivial-build-system)
    (arguments
      '(#:modules ((guix build utils))
        #:builder
        (begin
          (if post (post) #f)
          (copy-recursively "*" (assoc-ref %outputs "out"))
          #t)))
    (synopsis "")
    (description "")
    (home-page "")
    (license #f)))

(define-public msbuild
  (let ((commit "06c06da88049d0b97ca4e2e1f0759080a41cfaea"))
    (package
      (name "msbuild")
      (version "")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/mono/linux-packaging-msbuild")
                       (commit commit)))
                (sha256
                  (base32
                    "1cn6fyvx5m3gkj31ql3j08as9lc02c4mfdv2vaccp7m70lf2asap"))))
      (build-system gnu-build-system)
      (arguments
        '(#:phases
          (modify-phases %standard-phases
            (delete 'configure))))
      (inputs
        `(("mono-6.0.0.319" ,mono-6.0.0.319)))
      (synopsis "")
      (description "")
      (home-page "")
      (license #f))))

; NuGet package MicroBuild.Core.0.2.0.
; NuGet package System.Reflection.Metadata.1.6.0.
; NuGet package FsLexYacc.7.0.6. https://github.com/fsprojects/FsLexYacc/archive/7.0.6.tar.gz 0fk4m9m14vhn2iwhf9w2lwjdzj5rz1s7a7388jp0lxffzrj2c8c4
; NuGet package System.Collections.Immutable.1.5.0.
; NuGet package Microsoft.Build.Framework.14.3.0.
; NuGet package System.ValueTuple.4.4.0.
; NuGet package Microsoft.Build.14.3.0.
; NuGet package Microsoft.Build.Utilities.Core.14.3.0.
; NuGet package Microsoft.Build.Tasks.Core.14.3.0.
; NuGet package Microsoft.Build.15.8.166.
; NuGet package Microsoft.Build.Utilities.Core.15.8.166.
; NuGet package Microsoft.Build.Framework.15.8.166.
; NuGet package Microsoft.Build.Tasks.Core.15.8.166.
; NuGet package System.IO.Compression.4.3.0.
; NuGet package FsCheck.3.0.0-alpha3. https://github.com/fscheck/FsCheck/archive/3.0.0-alpha4.tar.gz 0zqwinzwybckzpw2n712vphxbi6zdcdvh4q4ir1n9v94p7yvl32d
; NuGet package NUnit.3.5.0. https://github.com/nunit/nunit/archive/3.5.tar.gz 0kaashf83r6zdfibxrs998b3g8y5wkjmxk2iar3zy5al6z14f8qy

(define-public fsharp
  (package ; how does one even compile this?
    (name "fsharp")
    (version "4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mono/linux-packaging-fsharp/archive/upstream/"
                                  version
                                  ".tar.gz"))
              (sha256
                (base32
                  "1fcjpb9hqn9djh7hqasz26x2zrb79dcc0gps6ayfcqa349a1imy4"))))
    (build-system gnu-build-system)
    (arguments
      '(#:phases
        (modify-phases %standard-phases
          (delete 'configure))))
    (native-inputs
     `(("libtool" ,libtool)
       ("autoconf" ,autoconf)
       ("which" ,which)
       ("pkg-config" ,pkg-config)
       ("automake" ,automake)))
    (inputs
      `(("mono-6.0.0.319" ,mono-6.0.0.319)))
    (synopsis "Compiler and libraries for the C# programming language")
    (description "Mono is a compiler, vm, debugger and set of libraries for
C#, a C-style programming language from Microsoft that is very similar to
Java.")
    (home-page "https://www.mono-project.com/")
    (license license:x11)))

; msbuild ; fsharp
