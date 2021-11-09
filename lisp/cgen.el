;; CGEN - Christian's Generator: A set of functions to generate text, like lists

;; Stolen from num-l.el

(defun cgen-numbered-list ()
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
(defalias 'cg-n-l 'cgen-numbered-list)

(defun cgen-random-multiple-choice-questions ()
	"Inserts a numbered list into a buffer, and a random multiple choice answer"
	(interactive)
	(setq separator (read-string "Separation Character? :"))
	(setq spacebool (y-or-n-p "Would you like a space after the separator? :"))
	(setq botlim (read-number "Lower Limit? :"))
	(setq toplim (read-number "Upper Limit? :"))
	(setq mcchoices (read-string "What choices would you like? :"))
	(setq space "")

	(if (> botlim toplim) (error "ERR: toplim > botlim"))
	(if spacebool (setq space " ")) 
	(setq mcnumbers (length mcchoices))

	(setq mcn 0)

	(while (<= botlim toplim)
		(with-current-buffer (current-buffer)
			(insert (number-to-string botlim))
			(insert separator)
			(insert space)
			
			(setq mcn (random mcnumbers))
			(insert (substring mcchoices mcn (+ 1 mcn)))

			(insert "\n")
			)
		(setq botlim (+ 1 botlim))
	)
)
(defalias 'cg-r-mcq 'cgen-random-multiple-choice-questions)
