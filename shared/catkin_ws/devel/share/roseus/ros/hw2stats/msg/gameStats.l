;; Auto-generated. Do not edit!


(when (boundp 'hw2stats::gameStats)
  (if (not (find-package "HW2STATS"))
    (make-package "HW2STATS"))
  (shadow 'gameStats (find-package "HW2STATS")))
(unless (find-package "HW2STATS::GAMESTATS")
  (make-package "HW2STATS::GAMESTATS"))

(in-package "ROS")
;;//! \htmlinclude gameStats.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass hw2stats::gameStats
  :super ros::object
  :slots (_header _totalPassesCompleated _totalPassesDropped _totalRushingYards _totalPassingYards ))

(defmethod hw2stats::gameStats
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:totalPassesCompleated __totalPassesCompleated) 0.0)
    ((:totalPassesDropped __totalPassesDropped) 0.0)
    ((:totalRushingYards __totalRushingYards) 0.0)
    ((:totalPassingYards __totalPassingYards) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _totalPassesCompleated (float __totalPassesCompleated))
   (setq _totalPassesDropped (float __totalPassesDropped))
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
  (:totalPassesCompleated
   (&optional __totalPassesCompleated)
   (if __totalPassesCompleated (setq _totalPassesCompleated __totalPassesCompleated)) _totalPassesCompleated)
  (:totalPassesDropped
   (&optional __totalPassesDropped)
   (if __totalPassesDropped (setq _totalPassesDropped __totalPassesDropped)) _totalPassesDropped)
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
    ;; float32 _totalPassesCompleated
    4
    ;; float32 _totalPassesDropped
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
     ;; float32 _totalPassesCompleated
       (sys::poke _totalPassesCompleated (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _totalPassesDropped
       (sys::poke _totalPassesDropped (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32 _totalPassesCompleated
     (setq _totalPassesCompleated (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _totalPassesDropped
     (setq _totalPassesDropped (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _totalRushingYards
     (setq _totalRushingYards (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _totalPassingYards
     (setq _totalPassingYards (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get hw2stats::gameStats :md5sum-) "57bf136d85d37d3a97009a7864929896")
(setf (get hw2stats::gameStats :datatype-) "hw2stats/gameStats")
(setf (get hw2stats::gameStats :definition-)
      "Header header

float32 totalPassesCompleated
float32 totalPassesDropped
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



(provide :hw2stats/gameStats "57bf136d85d37d3a97009a7864929896")


