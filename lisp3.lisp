(defun insert (x sorted-list)
  (if (or (null sorted-list) (<= x (car sorted-list)))
      (cons x sorted-list)
      (cons (car sorted-list) (insert x (cdr sorted-list)))))
(defun insert (x sorted-list)
  (if (or (null sorted-list) (<= x (car sorted-list)))
      (cons x sorted-list)
      (cons (car sorted-list) (insert x (cdr sorted-list)))))

(defun insertion-sort-functional (list)
  (if (null list)
      nil
      (insert (car list) (insertion-sort-functional (cdr list)))))


(defun insertion-sort-imperative (list)
  (let ((sorted (list))) ; Початково пустий список
    (dolist (x (copy-list list) sorted)
      (let ((inserted nil))
        (loop for i in sorted
              do (when (and (not inserted) (<= x i))
                   (setq sorted (append (subseq sorted 0 (position i sorted))
                                        (list x)
                                        (subseq sorted (position i sorted))))
                   (setq inserted t)))
        (unless inserted
          (setq sorted (append sorted (list x))))))))



(defun test-insertion-sort ()
  (format t "Functional Sort Tests:~%")
  (format t "Test 1: ~A~%" (equal (insertion-sort-functional '(3 1 4 1 5 9)) '(1 1 3 4 5 9)))
  (format t "Test 2: ~A~%" (equal (insertion-sort-functional '(5 3 8 6 2 7)) '(2 3 5 6 7 8)))
  (format t "Test 3: ~A~%" (equal (insertion-sort-functional '(1 2 1 -3 -2)) '(-3 -2 1 1 2)))
  (format t "Test 4: ~A~%" (equal (insertion-sort-functional '(1 2 3 4 5 6)) '(1 2 3 4 5 6)))
  (format t "Test 5: ~A~%" (equal (insertion-sort-functional '(1)) '(1)))
  (format t "Test 6: ~A~%" (equal (insertion-sort-functional '()) '()))

  (format t "Imperative Sort Tests:~%")
  (format t "Test 1: ~A~%" (equal (insertion-sort-imperative '(3 1 4 1 5 9)) '(1 1 3 4 5 9)))
  (format t "Test 2: ~A~%" (equal (insertion-sort-imperative '(5 3 8 6 2 7)) '(2 3 5 6 7 8)))
  (format t "Test 3: ~A~%" (equal (insertion-sort-imperative '(1 2 1 -3 -2)) '(-3 -2 1 1 2)))
  (format t "Test 4: ~A~%" (equal (insertion-sort-imperative '(1 2 3 4 5 6)) '(1 2 3 4 5 6)))
  (format t "Test 5: ~A~%" (equal (insertion-sort-imperative '(1)) '(1)))
  (format t "Test 6: ~A~%" (equal (insertion-sort-imperative '()) '())))