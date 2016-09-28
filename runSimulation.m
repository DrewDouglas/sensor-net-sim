function runSimulation(duration)
%runSimulation - models the sensor network behavior for 'duration' seconds
%   Inputs:
%       duration - the number of simulated seconds to run for 

%ComputerSim(ID, incomingNeighbors, outgoingNeighbors, clockParams, isMaster, curTime, curOffset, curDrift)

%**************************** Configuration *******************************

cpu1 = computerSim(2, [4], [2], [0, (1/32768), .001, 0, .0001, .0000000001], 'true', -1, -1, -1);
cpu2 = computerSim(4, [2], [2], [0, (1/32768), .001, 0, .0001, .0000000001], 'false', -1, -1, -1);

%The cpus array stores all of the computer simulator objects
%It also stores how many 'ticks' of the simulation must pass for one clock
%tick to occur on the computer (as well as the current number of ticks)

cpus(1) = cpu1;
cpus(2) = cpu2;

%sensors
freqs = zeros(2, 3);
%obtain the frequency of all clocks in the simulation 
for i=1:length(cpus)
    freqs(i, 1) = 1 / cpus(i).clockParams(2);
    freqs(i, 2) = 0;
    freqs(i, 3) = 0;
end

%determine the frequency that the simulaton has to run at by finding the
%lcm of all of the clock frequencies 
simulationFreq = lcms(freqs);
iterations = duration * simulationFreq; 

for i=1:length(cpus)
    freqs(i, 2) = simulationFreq / freqs(i, 1);
end



for i=1:iterations
    for j=1:length(cpus)
        [cpus, sensors] = updateComputer(cpus(j), cpus, sensors);
    end
    
    for k=1:length(sensors)
        [cpus, sensors] = updateSensor(sensors(k), cpus, sensors);
    end
end
    
    %This function updates an individual computer's time and also handles
    %transmitting its timing information to neighbors
    function [cpus, sensors] = updateComputer(obj, cpus, sensors)
        %update time on this obj
        
        %send (or queue sending) of info to peers
        
        %update knowlege about peers based off of information received
        
    end

    %This function updates an individual sensor's and also handles
    %transmission of information to neighbors
    function [cpus, sensors] = updateSensors(obj, cpus, sensors)
        
    end


end

