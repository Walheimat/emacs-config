;;; dir local variables to work with space indentation

((js2-mode  . ((eval . (local-unset-key (kbd "TAB")))
	       (indent-tabs-mode . nil)
	       ;; for example ...
	       (js-indent-level . 2)))
 (scss-mode . ((css-indent-offset . 2)))
 (css-mode  . ((css-indent-offset . 2))))
