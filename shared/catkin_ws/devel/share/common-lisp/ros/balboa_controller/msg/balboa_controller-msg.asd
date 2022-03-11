
(cl:in-package :asdf)

(defsystem "balboa_controller-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "irArray" :depends-on ("_package_irArray"))
    (:file "_package_irArray" :depends-on ("_package"))
  ))