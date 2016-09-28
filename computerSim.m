classdef computerSim < handle
    %computer - this class simulates the role of a computer in a sensor
    %network
    %   Detailed explanation goes here
    
    properties
      ID                    %Each node will maintain an ID
      incomingNeighbors     %A list of all nodes that send info to this node
      outgoingNeighbors     %A list of all nodes that receive info from this node
      clockParams           %An array of params to feed into the clockSim function
      isMaster              %A flag to indicate if this is the master computer
      curTime               %the current time on the computer
      curOffset             %the current offset from some 'true' time 
      curDrift              %the current rate of drift for the computer clock
    end
    
    methods
              
        function obj = computerSim(ID, incomingNeighbors, outgoingNeighbors, clockParams, isMaster, curTime, curOffset, curDrift)
            obj.ID = ID;
            obj.incomingNeighbors = incomingNeighbors;
            obj.outgoingNeighbors = outgoingNeighbors;
            obj.clockParams = clockParams;
            obj.isMaster = isMaster;
            obj.curTime = curTime;
            obj.curOffset = curOffset;
            obj.curDrift = curDrift; 
        end
               
    end
    
end

