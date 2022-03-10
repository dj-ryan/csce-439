; Auto-generated. Do not edit!


(cl:in-package hw2stats-msg)


;//! \htmlinclude gameStats.msg.html

(cl:defclass <gameStats> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (totalPassesCompleated
    :reader totalPassesCompleated
    :initarg :totalPassesCompleated
    :type cl:float
    :initform 0.0)
   (totalPassesDropped
    :reader totalPassesDropped
    :initarg :totalPassesDropped
    :type cl:float
    :initform 0.0)
   (totalRushingYards
    :reader totalRushingYards
    :initarg :totalRushingYards
    :type cl:float
    :initform 0.0)
   (totalPassingYards
    :reader totalPassingYards
    :initarg :totalPassingYards
    :type cl:float
    :initform 0.0))
)

(cl:defclass gameStats (<gameStats>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gameStats>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gameStats)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hw2stats-msg:<gameStats> is deprecated: use hw2stats-msg:gameStats instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <gameStats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw2stats-msg:header-val is deprecated.  Use hw2stats-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'totalPassesCompleated-val :lambda-list '(m))
(cl:defmethod totalPassesCompleated-val ((m <gameStats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw2stats-msg:totalPassesCompleated-val is deprecated.  Use hw2stats-msg:totalPassesCompleated instead.")
  (totalPassesCompleated m))

(cl:ensure-generic-function 'totalPassesDropped-val :lambda-list '(m))
(cl:defmethod totalPassesDropped-val ((m <gameStats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw2stats-msg:totalPassesDropped-val is deprecated.  Use hw2stats-msg:totalPassesDropped instead.")
  (totalPassesDropped m))

(cl:ensure-generic-function 'totalRushingYards-val :lambda-list '(m))
(cl:defmethod totalRushingYards-val ((m <gameStats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw2stats-msg:totalRushingYards-val is deprecated.  Use hw2stats-msg:totalRushingYards instead.")
  (totalRushingYards m))

(cl:ensure-generic-function 'totalPassingYards-val :lambda-list '(m))
(cl:defmethod totalPassingYards-val ((m <gameStats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw2stats-msg:totalPassingYards-val is deprecated.  Use hw2stats-msg:totalPassingYards instead.")
  (totalPassingYards m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gameStats>) ostream)
  "Serializes a message object of type '<gameStats>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'totalPassesCompleated))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'totalPassesDropped))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'totalRushingYards))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'totalPassingYards))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gameStats>) istream)
  "Deserializes a message object of type '<gameStats>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'totalPassesCompleated) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'totalPassesDropped) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'totalRushingYards) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'totalPassingYards) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gameStats>)))
  "Returns string type for a message object of type '<gameStats>"
  "hw2stats/gameStats")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gameStats)))
  "Returns string type for a message object of type 'gameStats"
  "hw2stats/gameStats")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gameStats>)))
  "Returns md5sum for a message object of type '<gameStats>"
  "57bf136d85d37d3a97009a7864929896")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gameStats)))
  "Returns md5sum for a message object of type 'gameStats"
  "57bf136d85d37d3a97009a7864929896")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gameStats>)))
  "Returns full string definition for message of type '<gameStats>"
  (cl:format cl:nil "Header header~%~%float32 totalPassesCompleated~%float32 totalPassesDropped~%float32 totalRushingYards~%float32 totalPassingYards~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gameStats)))
  "Returns full string definition for message of type 'gameStats"
  (cl:format cl:nil "Header header~%~%float32 totalPassesCompleated~%float32 totalPassesDropped~%float32 totalRushingYards~%float32 totalPassingYards~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gameStats>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gameStats>))
  "Converts a ROS message object to a list"
  (cl:list 'gameStats
    (cl:cons ':header (header msg))
    (cl:cons ':totalPassesCompleated (totalPassesCompleated msg))
    (cl:cons ':totalPassesDropped (totalPassesDropped msg))
    (cl:cons ':totalRushingYards (totalRushingYards msg))
    (cl:cons ':totalPassingYards (totalPassingYards msg))
))
