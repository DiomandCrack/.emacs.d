;;set the default file path
(setq default-directory "~/")

(setq column-number-mode t)
(setq line-number-mode t)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; 指定包初始化
(package-initialize)

;;flycheck 自动检查拼写错误
(add-hook 'after-init-hook #' global-flycheck-mode)

(add-to-list 'load-path "~/.emacs.d/lisp")
;;自动补全代码块识别(org)
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite" "javascript" )))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))
;;代码高亮
(setq org-src-fontify-natively t)
;;markdown
(setq org-export-backends (quote (ascii html icalendar latex md)))
;;显示行号
(global-nlinum-mode t)
(setq nlinum-format "%d ")

;;打开高亮 #M-x global-font-lock-mode
(global-font-lock-mode t)
;;标签跳转
;;(global-evil-matchit-mode 1)
;;smex
(global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
;;scss-mode
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . scss-mode))
;;emmet-mode
(require 'emmet-mode)
(add-hook 'scss-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;; js2-mode 加载
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;yasnippet
(add-to-list 'load-path
	      "~/path-to-yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#FAFAFA" "#FF1744" "#66BB6A" "#F57F17" "#42A5F5" "#7E57C2" "#0097A7" "#546E7A"])
 '(beacon-color "#F8BBD0")
 '(case-fold-search nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (atom-one-dark)))
 '(custom-safe-themes
   (quote
    ("66aea5b7326cf4117d63c6694822deeca10a03b98135aaaddb40af99430ea237" "cf284fac2a56d242ace50b6d2c438fcc6b4090137f1631e32bedf19495124600" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "1b27e3b3fce73b72725f3f7f040fd03081b576b1ce8bbdfcb0212920aec190ad" "64ca5a1381fa96cb86fd6c6b4d75b66dc9c4e0fc1288ee7d914ab8d2638e23a9" "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "70f5a47eb08fe7a4ccb88e2550d377ce085fedce81cf30c56e3077f95a2909f2" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "a4c9e536d86666d4494ef7f43c84807162d9bd29b0dfd39bdf2c3d845dcc7b2e" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(evil-emacs-state-cursor (quote ("#D50000" hbar)) t)
 '(evil-insert-state-cursor (quote ("#D50000" bar)) t)
 '(evil-normal-state-cursor (quote ("#F57F17" box)) t)
 '(evil-visual-state-cursor (quote ("#66BB6A" box)) t)
 '(fci-rule-color "#3E4451")
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   (quote
    ("#F57F17" "#66BB6A" "#0097A7" "#42A5F5" "#7E57C2" "#D84315")))
 '(highlight-symbol-foreground-color "#546E7A")
 '(highlight-tail-colors (quote (("#F8BBD0" . 0) ("#FAFAFA" . 100))))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (org-beautify-theme org2blog org-iv web-beautify window-jump flycheck-css-colorguard flymake-css web-mode htmlize markdown-mode+ markdown-mode evil-matchit window-numbering nlinum highlight-parentheses flycheck helm heap yasnippet-snippets yasnippet js2-mode scss-mode company smex auto-compile auto-complete color-theme atom-one-dark-theme atom-dark-theme apropospriate-theme airline-themes ahungry-theme afternoon-theme ac-emmet python org)))
 '(pos-tip-background-color "#ffffff")
 '(pos-tip-foreground-color "#78909C")
 '(show-paren-mode t)
 '(tabbar-background-color "#ffffff"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "微软雅黑" :foundry "outline" :slant normal :weight normal :height 158 :width normal)))))

(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/theme/emacs-color-theme-solarized-master")
;;(load-theme 'solarized t)
;;(set-frame-parameter nil 'background-mode 'dark)    ;;选择solarized dark
;;(enable-theme 'solarized)


(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)

;;主浮页和speedbar浮页之间的切换快捷键――不用设置，因为系统本身可以使用M-Tab来实现

;;设置speedbar默认出现在左侧
(add-hook 'speedbar-mode-hook
        (lambda ()
         (auto-raise-mode 1)
         (add-to-list 'speedbar-frame-parameters '(top . 0))
         (add-to-list 'speedbar-frame-parameters '(left . 0))
         ))

;显示所有文件
(setq speedbar-show-unknown-files t)

;;设置tags排列顺序为按照出现的先后次序排列
(setq speedbar-tag-hierarchy-method '(speedbar-prefix-group-tag-hierarchy))

