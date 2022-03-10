
(cl:in-package :asdf)

(defsystem "hw2stats-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "gameStatsMsg" :depends-on ("_package_gameStatsMsg"))
    (:file "_package_gameStatsMsg" :depends-on ("_package"))
    (:file "offensivePlay" :depends-on ("_package_offensivePlay"))
    (:file "_package_offensivePlay" :depends-on ("_package"))
  ))