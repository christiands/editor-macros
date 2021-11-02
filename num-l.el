;; Prompts the user for which buffer, which separator, a space after the output, and which numbers, inclusive.
;; DWTFYW, Christian Scott 2021 

(defun numl ()
	"Inserts a numbered list into a buffer"
	(interactive)
	(setq separator (read-string "Separation Character? :"))
	(setq spacebool (y-or-n-p "Would you like a space after the separator? :"))
	(setq botlim (read-number "Lower Limit? :"))
	(setq toplim (read-number "Upper Limit? :"))
	(setq space "")

	(if (> botlim toplim) (error "ERR: toplim > botlim"))
	(if spacebool (setq space " ")) 

	(while (<= botlim toplim)
		(with-current-buffer (current-buffer)
			(insert (number-to-string botlim))
			(insert separator)
			(insert space)
			(insert "\n")
			)
		(setq botlim (+ 1 botlim))
	)
)
