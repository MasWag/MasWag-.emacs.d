(autoload 'markdown-mode "markdown-mode" "Markdown mode" t)
(setq auto-mode-alist (cons '("\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.markdown" . markdown-mode) auto-mode-alist))

