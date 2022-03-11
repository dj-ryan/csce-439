;; Auto-generated. Do not edit!


(when (boundp 'balboa_controller::irArray)
  (if (not (find-package "BALBOA_CONTROLLER"))
    (make-package "BALBOA_CONTROLLER"))
  (shadow 'irArray (find-package "BALBOA_CONTROLLER")))
(unless (find-package "BALBOA_CONTROLLER::IRARRAY")
  (make-package "BALBOA_CONTROLLER::IRARRAY"))

(in-package "ROS")
;;//! \htmlinclude irArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass balboa_controller::irArray
  :super ros::object
  :slots (_header _sensor1 _sensor2 _sensor4 _sensor5 ))

(defmethod balboa_controller::irArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sensor1 __sensor1) 0)
    ((:sensor2 __sensor2) 0)
    ((:sensor4 __sensor4) 0)
    ((:sensor5 __sensor5) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _sensor1 (round __sensor1))
   (setq _sensor2 (round __sensor2))
   (setq _sensor4 (round __sensor4))
   (setq _sensor5 (round __sensor5))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:sensor1
   (&optional __sensor1)
   (if __sensor1 (setq _sensor1 __sensor1)) _sensor1)
  (:sensor2
   (&optional __sensor2)
   (if __sensor2 (setq _sensor2 __sensor2)) _sensor2)
  (:sensor4
   (&optional __sensor4)
   (if __sensor4 (setq _sensor4 __sensor4)) _sensor4)
  (:sensor5
   (&optional __sensor5)
   (if __sensor5 (setq _sensor5 __sensor5)) _sensor5)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _sensor1
    1
    ;; int8 _sensor2
    1
    ;; int8 _sensor4
    1
    ;; int8 _sensor5
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _sensor1
       (write-byte _sensor1 s)
     ;; int8 _sensor2
       (write-byte _sensor2 s)
     ;; int8 _sensor4
       (write-byte _sensor4 s)
     ;; int8 _sensor5
       (write-byte _sensor5 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _sensor1
     (setq _sensor1 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _sensor1 127) (setq _sensor1 (- _sensor1 256)))
   ;; int8 _sensor2
     (setq _sensor2 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _sensor2 127) (setq _sensor2 (- _sensor2 256)))
   ;; int8 _sensor4
     (setq _sensor4 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _sensor4 127) (setq _sensor4 (- _sensor4 256)))
   ;; int8 _sensor5
     (setq _sensor5 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _sensor5 127) (setq _sensor5 (- _sensor5 256)))
   ;;
   self)
  )

(setf (get balboa_controller::irArray :md5sum-) "71fa43eb942c785a9beda432cf89109d")
(setf (get balboa_controller::irArray :datatype-) "balboa_controller/irArray")
(setf (get balboa_controller::irArray :definition-)
      "Header header

int8 sensor1
int8 sensor2
int8 sensor4
int8 sensor5
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



(provide :balboa_controller/irArray "71fa43eb942c785a9beda432cf89109d")


