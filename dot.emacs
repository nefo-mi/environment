(set-language-environment 'Japanese)
(set-terminal-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq coding-system-for-read 'mule-utf-8-unix)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)

(setq inhibit-startup-message t)
(setq indent-tabs-mode nil)
(show-paren-mode t)
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))
(global-set-key "\C-h" 'delete-backward-char)

(require 'twittering-mode)
(twittering-icon-mode)
(setq twittering-username "nefo_mi")

(add-hook 'before-save-hook '(lambda () (untabify 1 (point-max))))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(add-hook 'org-mode-hook 'turn-on-font-lock)
(setq org-log-done t)

