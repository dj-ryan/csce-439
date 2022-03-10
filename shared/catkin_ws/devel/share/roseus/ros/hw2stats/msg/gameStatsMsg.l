;; Auto-generated. Do not edit!


(when (boundp 'hw2stats::gameStatsMsg)
  (if (not (find-package "HW2STATS"))
    (make-package "HW2STATS"))
  (shadow 'gameStatsMsg (find-package "HW2STATS")))
(unless (find-package "HW2STATS::GAMESTATSMSG")
  (make-package "HW2STATS::GAMESTATSMSG"))

(in-package "ROS")
;;//! \htmlinclude gameStatsMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass hw2stats::gameStatsMsg
  :super ros::object
  :slots (_header _passCompleationPercentage _passIncompletionPercentage _totalRushingYards _totalPassingYards ))

(defmethod hw2stats::gameStatsMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:passCompleationPercentage __passCompleationPercentage) 0.0)
    ((:passIncompletionPercentage __passIncompletionPercentage) 0.0)
    ((:totalRushingYards __totalRushingYards) 0.0)
    ((:totalPassingYards __totalPassingYards) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _passCompleationPercentage (float __passCompleationPercentage))
   (setq _passIncompletionPercentage (float __passIncompletionPercentage))
   (setq _totalRushingYards (float __totalRushingYards))
   (setq _totalPassingYards (float __totalPassingYards))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:passCompleationPercentage
   (&optional __passCompleationPercentage)
   (if __passCompleationPercentage (setq _passCompleationPercentage __passCompleationPercentage)) _passCompleationPercentage)
  (:passIncompletionPercentage
   (&optional __passIncompletionPercentage)
   (if __passIncompletionPercentage (setq _passIncompletionPercentage __passIncompletionPercentage)) _passIncompletionPercentage)
  (:totalRushingYards
   (&optional __totalRushingYards)
   (if __totalRushingYards (setq _totalRushingYards __totalRushingYards)) _totalRushingYards)
  (:totalPassingYards
   (&optional __totalPassingYards)
   (if __totalPassingYards (setq _totalPassingYards __totalPassingYards)) _totalPassingYards)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _passCompleationPercentage
    4
    ;; float32 _passIncompletionPercentage
    4
    ;; float32 _totalRushingYards
    4
    ;; float32 _totalPassingYards
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _passCompleationPercentage
       (sys::poke _passCompleationPercentage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _passIncompletionPercentage
       (sys::poke _passIncompletionPercentage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _totalRushingYards
       (sys::poke _totalRushingYards (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _totalPassingYards
       (sys::poke _totalPassingYards (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _passCompleationPercentage
     (setq _passCompleationPercentage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _passIncompletionPercentage
     (setq _passIncompletionPercentage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _totalRushingYards
     (setq _totalRushingYards (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _totalPassingYards
     (setq _totalPassingYards (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get hw2stats::gameStatsMsg :md5sum-) "92b53da9624eb7854546e5095f9d7940")
(setf (get hw2stats::gameStatsMsg :datatype-) "hw2stats/gameStatsMsg")
(setf (get hw2stats::gameStatsMsg :definition-)
      "Header header

float32 passCompleationPercentage
float32 passIncompletionPercentage
float32 totalRushingYards
float32 totalPassingYards

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



(provide :hw2stats/gameStatsMsg "92b53da9624eb7854546e5095f9d7940")


