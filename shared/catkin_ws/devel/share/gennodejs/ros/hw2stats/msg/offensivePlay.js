// Auto-generated. Do not edit!

// (in-package hw2stats.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class offensivePlay {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.isPass = null;
      this.passCompleted = null;
      this.yards = null;
      this.touchdown = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('isPass')) {
        this.isPass = initObj.isPass
      }
      else {
        this.isPass = false;
      }
      if (initObj.hasOwnProperty('passCompleted')) {
        this.passCompleted = initObj.passCompleted
      }
      else {
        this.passCompleted = false;
      }
      if (initObj.hasOwnProperty('yards')) {
        this.yards = initObj.yards
      }
      else {
        this.yards = 0;
      }
      if (initObj.hasOwnProperty('touchdown')) {
        this.touchdown = initObj.touchdown
      }
      else {
        this.touchdown = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type offensivePlay
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [isPass]
    bufferOffset = _serializer.bool(obj.isPass, buffer, bufferOffset);
    // Serialize message field [passCompleted]
    bufferOffset = _serializer.bool(obj.passCompleted, buffer, bufferOffset);
    // Serialize message field [yards]
    bufferOffset = _serializer.int32(obj.yards, buffer, bufferOffset);
    // Serialize message field [touchdown]
    bufferOffset = _serializer.bool(obj.touchdown, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type offensivePlay
    let len;
    let data = new offensivePlay(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [isPass]
    data.isPass = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [passCompleted]
    data.passCompleted = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [yards]
    data.yards = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [touchdown]
    data.touchdown = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 7;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hw2stats/offensivePlay';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4cc2e5218b4d02ce6aef8b26affe7470';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new offensivePlay(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.isPass !== undefined) {
      resolved.isPass = msg.isPass;
    }
    else {
      resolved.isPass = false
    }

    if (msg.passCompleted !== undefined) {
      resolved.passCompleted = msg.passCompleted;
    }
    else {
      resolved.passCompleted = false
    }

    if (msg.yards !== undefined) {
      resolved.yards = msg.yards;
    }
    else {
      resolved.yards = 0
    }

    if (msg.touchdown !== undefined) {
      resolved.touchdown = msg.touchdown;
    }
    else {
      resolved.touchdown = false
    }

    return resolved;
    }
};

module.exports = offensivePlay;
