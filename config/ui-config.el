;; Font
(set-frame-font "Consolas 12")

;; Disable scroll/menu/tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Show matching pairs of parentheses
(show-paren-mode 1)

;; Theme
(load-theme 'zenburn t)

(provide 'ui-config)
