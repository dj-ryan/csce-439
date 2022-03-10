; Auto-generated. Do not edit!


(cl:in-package hw2stats-msg)


;//! \htmlinclude offensivePlay.msg.html

(cl:defclass <offensivePlay> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (isPass
    :reader isPass
    :initarg :isPass
    :type cl:boolean
    :initform cl:nil)
   (passCompleted
    :reader passCompleted
    :initarg :passCompleted
    :type cl:boolean
    :initform cl:nil)
   (yards
    :reader yards
    :initarg :yards
    :type cl:integer
    :initform 0)
   (touchdown
    :reader touchdown
    :initarg :touchdown
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass offensivePlay (<offensivePlay>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <offensivePlay>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'offensivePlay)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hw2stats-msg:<offensivePlay> is deprecated: use hw2stats-msg:offensivePlay instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <offensivePlay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw2stats-msg:header-val is deprecated.  Use hw2stats-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'isPass-val :lambda-list '(m))
(cl:defmethod isPass-val ((m <offensivePlay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw2stats-msg:isPass-val is deprecated.  Use hw2stats-msg:isPass instead.")
  (isPass m))

(cl:ensure-generic-function 'passCompleted-val :lambda-list '(m))
(cl:defmethod passCompleted-val ((m <offensivePlay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw2stats-msg:passCompleted-val is deprecated.  Use hw2stats-msg:passCompleted instead.")
  (passCompleted m))

(cl:ensure-generic-function 'yards-val :lambda-list '(m))
(cl:defmethod yards-val ((m <offensivePlay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw2stats-msg:yards-val is deprecated.  Use hw2stats-msg:yards instead.")
  (yards m))

(cl:ensure-generic-function 'touchdown-val :lambda-list '(m))
(cl:defmethod touchdown-val ((m <offensivePlay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw2stats-msg:touchdown-val is deprecated.  Use hw2stats-msg:touchdown instead.")
  (touchdown m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <offensivePlay>) ostream)
  "Serializes a message object of type '<offensivePlay>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isPass) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'passCompleted) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'yards)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'touchdown) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <offensivePlay>) istream)
  "Deserializes a message object of type '<offensivePlay>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'isPass) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'passCompleted) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yards) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'touchdown) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<offensivePlay>)))
  "Returns string type for a message object of type '<offensivePlay>"
  "hw2stats/offensivePlay")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'offensivePlay)))
  "Returns string type for a message object of type 'offensivePlay"
  "hw2stats/offensivePlay")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<offensivePlay>)))
  "Returns md5sum for a message object of type '<offensivePlay>"
  "4cc2e5218b4d02ce6aef8b26affe7470")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'offensivePlay)))
  "Returns md5sum for a message object of type 'offensivePlay"
  "4cc2e5218b4d02ce6aef8b26affe7470")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<offensivePlay>)))
  "Returns full string definition for message of type '<offensivePlay>"
  (cl:format cl:nil "Header header~%# true if the play was a pass, else it was a run~%bool isPass~%# if this was a pass, true if it was completed~%bool passCompleted~%# number of yards gained/lost from the play~%int32 yards~%# true if this play resulted in a touchdown~%bool touchdown~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'offensivePlay)))
  "Returns full string definition for message of type 'offensivePlay"
  (cl:format cl:nil "Header header~%# true if the play was a pass, else it was a run~%bool isPass~%# if this was a pass, true if it was completed~%bool passCompleted~%# number of yards gained/lost from the play~%int32 yards~%# true if this play resulted in a touchdown~%bool touchdown~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <offensivePlay>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <offensivePlay>))
  "Converts a ROS message object to a list"
  (cl:list 'offensivePlay
    (cl:cons ':header (header msg))
    (cl:cons ':isPass (isPass msg))
    (cl:cons ':passCompleted (passCompleted msg))
    (cl:cons ':yards (yards msg))
    (cl:cons ':touchdown (touchdown msg))
))
