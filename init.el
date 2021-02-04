;;packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;Interactive Do mode for easier listing and operations related to files
(setq ido-everywhere t) ;;enable ido wherever possible
(setq ido-enable-flex-matching t) ;;enable fuzzy matching, for example, 'ap' matches 'alpha'
(ido-mode t)

;;dashboard
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "")
  (setq dashboard-startup-banner 2)
  (setq dashboard-footer-messages '("Don't be sorry, be better!"))
  (dashboard-setup-startup-hook))

;;autocompletion 
(use-package auto-complete
  :ensure t) ;; start auto complete with emacs
(require 'auto-complete-config)
(ac-config-default) ;; set the default configuration for autocompletion
  

;;snippets
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)) ;; starts yasnippet globally for all buffers, use yas-minor-mode and comment this line for buffer only snippets

;;directory tree
(use-package treemacs
  :ensure t)

;;key combination completion
(use-package which-key
  :ensure t
  :config (which-key-mode))

;;C and C++ header autocompletion
(defun my:ac-c-header-init() ;; function to setup the autocompletion
  (use-package auto-complete-c-headers
    :ensure t)
  (ac-config-default)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/9")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu/c++/9")
  (add-to-list 'achead:include-directories '"/usr/include/c++/9/backward")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/9/include")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu")
  (add-to-list 'achead:include-directories '"/usr/include"))
(add-hook 'c++-mode-hook 'my:ac-c-header-init) ;;add hooks to enable only for c and c++ files
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;use-package macros setup
(require 'use-package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "3a78cae35163bb71df460ebcfdebf811fd7bc74eaa15428c7e0bccfd4f858d30" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "711efe8b1233f2cf52f338fd7f15ce11c836d0b6240a18fffffc2cbd5bfe61b0" default)))
 '(package-selected-packages
   (quote
    (company which-key treemacs treemacs-all-the-icons page-break-lines dashboard smart-mode-line smart-mode-line-atom-one-dark-theme smart-mode-line-powerline-theme cherry-blossom-theme cyberpunk-theme darkokai-theme grandshell-theme hemisu-theme monokai-theme doom all-the-icons doom-modeline doom-themes yasnippet-snippets auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; set theme
(load-theme 'hemisu-dark)

;;for doom themes
;; (use-package doom-themes
;;   :ensure t)

;;modeline configuration
(use-package doom-modeline
  :ensure t ;;checks if exists
  :hook(after-init . doom-modeline-mode))

;;icons used in modeline
(use-package all-the-icons
  :ensure t)

;;hide toolbar,menu bar and scroll bar on startup
(tool-bar-mode -1)
;;(menu-bar-mode -1)
;;(scroll-bar-mode -1)

;;highlight current line
;;(global-hl-line-mode +1)

;;delete selected text and overwrite
(delete-selection-mode 1)

;;set backup directory other than current directory
(setq backup-directory-alist '(("." . "~/.emacs_backup_files"))) 

;;display line numbers only for programming mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;;highlight matching parenthesis
(show-paren-mode 1)


