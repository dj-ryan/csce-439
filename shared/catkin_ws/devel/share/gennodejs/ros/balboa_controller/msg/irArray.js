// Auto-generated. Do not edit!

// (in-package balboa_controller.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class irArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.sensor1 = null;
      this.sensor2 = null;
      this.sensor4 = null;
      this.sensor5 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('sensor1')) {
        this.sensor1 = initObj.sensor1
      }
      else {
        this.sensor1 = 0;
      }
      if (initObj.hasOwnProperty('sensor2')) {
        this.sensor2 = initObj.sensor2
      }
      else {
        this.sensor2 = 0;
      }
      if (initObj.hasOwnProperty('sensor4')) {
        this.sensor4 = initObj.sensor4
      }
      else {
        this.sensor4 = 0;
      }
      if (initObj.hasOwnProperty('sensor5')) {
        this.sensor5 = initObj.sensor5
      }
      else {
        this.sensor5 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type irArray
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [sensor1]
    bufferOffset = _serializer.int8(obj.sensor1, buffer, bufferOffset);
    // Serialize message field [sensor2]
    bufferOffset = _serializer.int8(obj.sensor2, buffer, bufferOffset);
    // Serialize message field [sensor4]
    bufferOffset = _serializer.int8(obj.sensor4, buffer, bufferOffset);
    // Serialize message field [sensor5]
    bufferOffset = _serializer.int8(obj.sensor5, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type irArray
    let len;
    let data = new irArray(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [sensor1]
    data.sensor1 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [sensor2]
    data.sensor2 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [sensor4]
    data.sensor4 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [sensor5]
    data.sensor5 = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'balboa_controller/irArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '71fa43eb942c785a9beda432cf89109d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new irArray(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.sensor1 !== undefined) {
      resolved.sensor1 = msg.sensor1;
    }
    else {
      resolved.sensor1 = 0
    }

    if (msg.sensor2 !== undefined) {
      resolved.sensor2 = msg.sensor2;
    }
    else {
      resolved.sensor2 = 0
    }

    if (msg.sensor4 !== undefined) {
      resolved.sensor4 = msg.sensor4;
    }
    else {
      resolved.sensor4 = 0
    }

    if (msg.sensor5 !== undefined) {
      resolved.sensor5 = msg.sensor5;
    }
    else {
      resolved.sensor5 = 0
    }

    return resolved;
    }
};

module.exports = irArray;
