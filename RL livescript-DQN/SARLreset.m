%% Edit which flight data to introduce to the RL network

function in = SARLreset(in)
    % data = load('C:\Users\Ethan\OneDrive - University of the Philippines\PENDING\THESIS\MATLAB\FINAL RESULTS\May 19-151 flights\fp_in.mat');
    % data = load('C:\Users\Ethan\OneDrive - University of the Philippines\PENDING\THESIS\MATLAB\FINAL RESULTS\Nov 1-77 flights\fp_in.mat');
    data = load('C:\Users\Ethan\OneDrive - University of the Philippines\PENDING\THESIS\MATLAB\FINAL RESULTS\July 14-119 flights\fp_in.mat');

    fp_in = data.fp_in;
    
    v0 = 0;
    in = setVariable(in,'fp_in',fp_in);
    in = setVariable(in,'v0',v0);



end