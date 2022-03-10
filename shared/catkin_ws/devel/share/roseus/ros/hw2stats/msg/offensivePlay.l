;; Auto-generated. Do not edit!


(when (boundp 'hw2stats::offensivePlay)
  (if (not (find-package "HW2STATS"))
    (make-package "HW2STATS"))
  (shadow 'offensivePlay (find-package "HW2STATS")))
(unless (find-package "HW2STATS::OFFENSIVEPLAY")
  (make-package "HW2STATS::OFFENSIVEPLAY"))

(in-package "ROS")
;;//! \htmlinclude offensivePlay.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass hw2stats::offensivePlay
  :super ros::object
  :slots (_header _isPass _passCompleted _yards _touchdown ))

(defmethod hw2stats::offensivePlay
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:isPass __isPass) nil)
    ((:passCompleted __passCompleted) nil)
    ((:yards __yards) 0)
    ((:touchdown __touchdown) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _isPass __isPass)
   (setq _passCompleted __passCompleted)
   (setq _yards (round __yards))
   (setq _touchdown __touchdown)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:isPass
   (&optional __isPass)
   (if __isPass (setq _isPass __isPass)) _isPass)
  (:passCompleted
   (&optional __passCompleted)
   (if __passCompleted (setq _passCompleted __passCompleted)) _passCompleted)
  (:yards
   (&optional __yards)
   (if __yards (setq _yards __yards)) _yards)
  (:touchdown
   (&optional __touchdown)
   (if __touchdown (setq _touchdown __touchdown)) _touchdown)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _isPass
    1
    ;; bool _passCompleted
    1
    ;; int32 _yards
    4
    ;; bool _touchdown
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _isPass
       (if _isPass (write-byte -1 s) (write-byte 0 s))
     ;; bool _passCompleted
       (if _passCompleted (write-byte -1 s) (write-byte 0 s))
     ;; int32 _yards
       (write-long _yards s)
     ;; bool _touchdown
       (if _touchdown (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _isPass
     (setq _isPass (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _passCompleted
     (setq _passCompleted (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _yards
     (setq _yards (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _touchdown
     (setq _touchdown (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get hw2stats::offensivePlay :md5sum-) "4cc2e5218b4d02ce6aef8b26affe7470")
(setf (get hw2stats::offensivePlay :datatype-) "hw2stats/offensivePlay")
(setf (get hw2stats::offensivePlay :definition-)
      "Header header
# true if the play was a pass, else it was a run
bool isPass
# if this was a pass, true if it was completed
bool passCompleted
# number of yards gained/lost from the play
int32 yards
# true if this play resulted in a touchdown
bool touchdown

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :hw2stats/offensivePlay "4cc2e5218b4d02ce6aef8b26affe7470")


