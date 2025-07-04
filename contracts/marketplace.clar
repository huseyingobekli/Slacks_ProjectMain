(define-data-var owner principal tx-sender)

(define-map courses
  (uint)  ;; course id
  {
    name: (string-ascii 50),
    price: uint,
    description: (string-ascii 200)
  })

(define-map purchases
  {
    buyer: principal,
    course-id: uint
  }
  bool)

;; Admin kontrolü için
(define-private (is-owner (sender principal))
  (is-eq sender (var-get owner)))

;; Kurs ekleme
(define-public (add-course (course-id uint) (name (string-ascii 50)) (price uint) (description (string-ascii 200)))
  (begin
    (asserts! (is-owner tx-sender) (err u100)) ;; sadece owner ekleyebilir
    (map-insert courses course-id {name: name, price: price, description: description})
    (ok true)
  )
)

;; Kurs satın alma (STX ile)
(define-public (buy-course (course-id uint))
  (let ((course (map-get? courses course-id)))
    (match course
      course-data
        (begin
          (asserts! (is-none (map-get? purchases {buyer: tx-sender, course-id: course-id})) (err u101)) ;; tekrar satın alma yok
          (asserts! (stx-transfer? course-data.price tx-sender (var-get owner)) (err u102)) ;; STX gönder
          (map-insert purchases {buyer: tx-sender, course-id: course-id} true)
          (ok true)
        )
      (err u103)
    )
  )
)

;; Kurs bilgisi alma
(define-read-only (get-course (course-id uint))
  (map-get? courses course-id))

;; Satın alma kontrolü
(define-read-only (has-purchased (user principal) (course-id uint))
  (default-to false (map-get? purchases {buyer: user, course-id: course-id})))
