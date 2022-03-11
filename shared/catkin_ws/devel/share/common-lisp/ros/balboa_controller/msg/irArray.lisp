; Auto-generated. Do not edit!


(cl:in-package balboa_controller-msg)


;//! \htmlinclude irArray.msg.html

(cl:defclass <irArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (sensor1
    :reader sensor1
    :initarg :sensor1
    :type cl:fixnum
    :initform 0)
   (sensor2
    :reader sensor2
    :initarg :sensor2
    :type cl:fixnum
    :initform 0)
   (sensor4
    :reader sensor4
    :initarg :sensor4
    :type cl:fixnum
    :initform 0)
   (sensor5
    :reader sensor5
    :initarg :sensor5
    :type cl:fixnum
    :initform 0))
)

(cl:defclass irArray (<irArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <irArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'irArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name balboa_controller-msg:<irArray> is deprecated: use balboa_controller-msg:irArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <irArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader balboa_controller-msg:header-val is deprecated.  Use balboa_controller-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensor1-val :lambda-list '(m))
(cl:defmethod sensor1-val ((m <irArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader balboa_controller-msg:sensor1-val is deprecated.  Use balboa_controller-msg:sensor1 instead.")
  (sensor1 m))

(cl:ensure-generic-function 'sensor2-val :lambda-list '(m))
(cl:defmethod sensor2-val ((m <irArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader balboa_controller-msg:sensor2-val is deprecated.  Use balboa_controller-msg:sensor2 instead.")
  (sensor2 m))

(cl:ensure-generic-function 'sensor4-val :lambda-list '(m))
(cl:defmethod sensor4-val ((m <irArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader balboa_controller-msg:sensor4-val is deprecated.  Use balboa_controller-msg:sensor4 instead.")
  (sensor4 m))

(cl:ensure-generic-function 'sensor5-val :lambda-list '(m))
(cl:defmethod sensor5-val ((m <irArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader balboa_controller-msg:sensor5-val is deprecated.  Use balboa_controller-msg:sensor5 instead.")
  (sensor5 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <irArray>) ostream)
  "Serializes a message object of type '<irArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'sensor1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sensor2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sensor4)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sensor5)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <irArray>) istream)
  "Deserializes a message object of type '<irArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor1) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor2) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor4) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor5) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<irArray>)))
  "Returns string type for a message object of type '<irArray>"
  "balboa_controller/irArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'irArray)))
  "Returns string type for a message object of type 'irArray"
  "balboa_controller/irArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<irArray>)))
  "Returns md5sum for a message object of type '<irArray>"
  "71fa43eb942c785a9beda432cf89109d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'irArray)))
  "Returns md5sum for a message object of type 'irArray"
  "71fa43eb942c785a9beda432cf89109d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<irArray>)))
  "Returns full string definition for message of type '<irArray>"
  (cl:format cl:nil "Header header~%~%int8 sensor1~%int8 sensor2~%int8 sensor4~%int8 sensor5~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'irArray)))
  "Returns full string definition for message of type 'irArray"
  (cl:format cl:nil "Header header~%~%int8 sensor1~%int8 sensor2~%int8 sensor4~%int8 sensor5~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <irArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <irArray>))
  "Converts a ROS message object to a list"
  (cl:list 'irArray
    (cl:cons ':header (header msg))
    (cl:cons ':sensor1 (sensor1 msg))
    (cl:cons ':sensor2 (sensor2 msg))
    (cl:cons ':sensor4 (sensor4 msg))
    (cl:cons ':sensor5 (sensor5 msg))
))
