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

class gameStats {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.totalPassesCompleated = null;
      this.totalPassesDropped = null;
      this.totalRushingYards = null;
      this.totalPassingYards = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('totalPassesCompleated')) {
        this.totalPassesCompleated = initObj.totalPassesCompleated
      }
      else {
        this.totalPassesCompleated = 0.0;
      }
      if (initObj.hasOwnProperty('totalPassesDropped')) {
        this.totalPassesDropped = initObj.totalPassesDropped
      }
      else {
        this.totalPassesDropped = 0.0;
      }
      if (initObj.hasOwnProperty('totalRushingYards')) {
        this.totalRushingYards = initObj.totalRushingYards
      }
      else {
        this.totalRushingYards = 0.0;
      }
      if (initObj.hasOwnProperty('totalPassingYards')) {
        this.totalPassingYards = initObj.totalPassingYards
      }
      else {
        this.totalPassingYards = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gameStats
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [totalPassesCompleated]
    bufferOffset = _serializer.float32(obj.totalPassesCompleated, buffer, bufferOffset);
    // Serialize message field [totalPassesDropped]
    bufferOffset = _serializer.float32(obj.totalPassesDropped, buffer, bufferOffset);
    // Serialize message field [totalRushingYards]
    bufferOffset = _serializer.float32(obj.totalRushingYards, buffer, bufferOffset);
    // Serialize message field [totalPassingYards]
    bufferOffset = _serializer.float32(obj.totalPassingYards, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gameStats
    let len;
    let data = new gameStats(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [totalPassesCompleated]
    data.totalPassesCompleated = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [totalPassesDropped]
    data.totalPassesDropped = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [totalRushingYards]
    data.totalRushingYards = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [totalPassingYards]
    data.totalPassingYards = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hw2stats/gameStats';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '57bf136d85d37d3a97009a7864929896';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gameStats(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.totalPassesCompleated !== undefined) {
      resolved.totalPassesCompleated = msg.totalPassesCompleated;
    }
    else {
      resolved.totalPassesCompleated = 0.0
    }

    if (msg.totalPassesDropped !== undefined) {
      resolved.totalPassesDropped = msg.totalPassesDropped;
    }
    else {
      resolved.totalPassesDropped = 0.0
    }

    if (msg.totalRushingYards !== undefined) {
      resolved.totalRushingYards = msg.totalRushingYards;
    }
    else {
      resolved.totalRushingYards = 0.0
    }

    if (msg.totalPassingYards !== undefined) {
      resolved.totalPassingYards = msg.totalPassingYards;
    }
    else {
      resolved.totalPassingYards = 0.0
    }

    return resolved;
    }
};

module.exports = gameStats;
