(tool-bar-mode 0)
(menu-bar-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode)
;(ido-mode 1)
(setq font-lock-maximum-decoration t)

(require 'devil)
(global-devil-mode)
(advice-add 'display-startup-screen
            :after (lambda (&optional _) (devil-mode 1)))


(require 'lsp-mode)
(add-hook 'elm-mode-hook #'lsp)

(require 'elm-mode)
(add-hook 'elm-mode-hook 'elm-format-on-save-mode)
(setq elm-mode-hook '(elm-indent-simple-mode))

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))


(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Projects")
    (setq projectile-project-search-path '("~/Projects")))
  (setq projectile-switch-project-action #'projectile-dired))



  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     default))
 '(package-selected-packages
   '(counsel-projectile devil elm-mode gruber-darker-theme lsp-mode
			use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
