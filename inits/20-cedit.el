(semantic-mode 1)
(defun my:odd-semantic-to-autocomplete ()
  (add-to-list 'ac-sources 'ac-source-semantic))

(add-hook 'c-mode-common-hook 'my:odd-semantic-to-autocomplete)

(global-ede-mode 1)
(ede-cpp-root-project "my project" :file "/tmp/sample/src/main.cpp"
		      :include-path '("/../my_inc"))
