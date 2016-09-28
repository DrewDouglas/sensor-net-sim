function [y, newOffset, newDrift] = clockSim(gtt, discrete, noise, offset, drift, driftChange)
%Clock simulates the function of a clock
%   Inputs:
%   Ground Truth Time - The actual time at which an event occurs
%   Discretization - The limit of the clock's ability to approximate
%                    continuous time
%   Noise - The standard deviation of white noise
%   Offset - The currrent offset form ground truth time
%   Drift - The rate at which the clock drifts away from ground truth time

%   White noise is randomly selcted from a zero-centered gaussian
%   distribution with the deviation passed as an input 
whiteNoise = normrnd(0, noise);

% Calculates the clock time by adding the offset to the ground truth time,
% adding in a randomly generated delay due to the discretization, and adding
% in the random white noise factor.
y = gtt + offset + (discrete * rand) + whiteNoise;

% Since the above calculation of time is a instantaneous process, drift is
% accounted for by factoring it into the future clock offset. The offset of
% the estimated time from the ground truth time is computed and then the
% drift is factored in. 
newOffset = (y - gtt) + drift; 
newDrift = drift + driftChange; 

end

