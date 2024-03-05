%% Edit which flight data to introduce to the RL network

% data = load('C:\Users\Ethan\OneDrive - University of the Philippines\PENDING\THESIS\MATLAB\FINAL RESULTS\May 19-151 flights\fp_in.mat');
% data = load('C:\Users\Ethan\OneDrive - University of the Philippines\PENDING\THESIS\MATLAB\FINAL RESULTS\Nov 1-77 flights\fp_in.mat');
data = load('C:\Users\Ethan\OneDrive - University of the Philippines\PENDING\THESIS\MATLAB\FINAL RESULTS\July 14-119 flights\fp_in.mat');


fp_in = data.fp_in;
v0 = 0;

[tot_row, tot_col] = size(fp_in);
num_of_flight = tot_col/6;

% step_per_episode = num_of_flight*tot_row;

step_per_episode = 0;
col = 1;
while col <= num_of_flight
    row = 1;
    while row <= tot_row
        if fp_in(row,(col*6)-5) ~= 0 
            step_per_episode = step_per_episode + 1;
        else
            step_per_episode = step_per_episode + 0;
        end
        row = row + 1;
    end
    col = col + 1;
end

v0_log_int = zeros(step_per_episode+1,1);
v0_log_int(1,1) = 1;

R_trig_int = zeros(1,7);