classdef sensorSim < handle
    %sensorSim -This class simulates the role of a sensor is a sensor
    %network
    %   Detailed explanation goes here
    
    properties
      ID                    %Each node will maintain an ID
      incomingNeighbors     %A list of all nodes that send info to this node
      outgoingNeighbors     %A list of all nodes that receive info from this node
      hasClock              %A flag to indicate if the sensor has a clock or not 
      clockParams           %An array of params to feed into the clockSim function
      curTime               %the current time on the computer
      curOffset             %the current offset from some 'true' time 
      curDrift              %the current rate of drift for the computer clock
    end
    
    methods
        
        function obj=SensorSim(ID, incomingNeighbors, outgoingNeighbors, clockParams, isMaster, curTime)
            obj.ID = ID;
            obj.incomingNeighbors = incomingNeighbors;
            obj.outgoingNeighbors = outgoingNeighbors;
            obj.hasClock = hasClock;
            obj.clockParams = clockParams;
            obj.isMaster = isMaster;
            obj.curTime = curTime;
        end
        
    end
    
end

