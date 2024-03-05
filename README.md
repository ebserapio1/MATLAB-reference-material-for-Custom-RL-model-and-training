# MATLAB-reference-material-for-Custom-RL-model-and-training
This repository consists of the files of the developed model in MATLAB utilized in the study "OPTIMIZING AIR TRAFFIC CONTROL: LEVERAGING MARKOV DECISION PROCESS AND REINFORCEMENT LEARNING WITH DEEP Q-NETWORK AND CONVOLUTION NEURAL NETWORK"

The Waypoints preprocessing folder consists of:
  1. Waypoints_data.xlsx excel file. This file contains the DMS and DD coordinates of the waypoints used in the model in reference to the cited material in the dissertation. This file also includes the IAS limitation in each waypoint.
  2. Waypoints_data_table.mat is the converted version of the previously mentioned excel file into .mat for MATLAB access.
  3. Waypoints_preprocessing.mlx is a MATLAB livescript processing the waypoints data into the 30 routes formed within the concerned area for the model's environment. This livescript takes the previously mentioned .mat file and converts the DD coordinates of each waypoint into Cartesian coordinate system with respect to RNW 24. The sequencing of waypoints forming each route are tabulated in file. The coordinates are then interpolated and the respective IAS limitations per reference waypoint are transfered to the interpolated data. This data for the routes are saved in a nested cell with each cell corresponding to each route. This matrix is saved as Routes.mat
  4. Routes.mat contains the data for each of the 30 generated interpolated routes.

The Initial data preprocessing folder consists of:
  1. Routes.mat copied from the Waypoints preprocessing folder.
  2. Initial data for the observation periods July 14, 2023, May 19, 2023, and November 1, 2023 in .mat format. This matrix contains relevant information regarding the observed flights within the observation period of each respective dates. The data includes the flight name, route taken, IAS at arrival at the entry points, time of arrival at the entry point, etc.
  3. Initialdata_preprocessing.mlx is a MATLAB livescript incorporating the Routes.mat data into the initial data. This livescript also modifies the configuration of the initial data. The resulting file in this livescript are flight_data.mat, obs.mat, and fp_in.mat. Per observation period, the fp_in varies in terms of its contents and dimensions. This file will be used in the training livescript as the initial configuration of the state of the environment.

The RL livescript-DQN folder consists of:
  1. RLlivescript.mlx livescript contains the agent and training configuration.
  2. rlParams.m containing the initial variable such as the fp_in of the current simulation to be trained.
  3. SARLreset.m contains the reset function. This function resets the state of the environment per episode termination.
  4. SARLsimulink2.slx is a MATLAB Simulink model representing the environment of the model. This model processes the decision of the agent and its interaction with the environment. This model updates the state and locates the next observable for the agent. This model also evaluates the reward of the agent's action as well as determines the termination of an episode.
  5. SARLsimulink.slx connects the previously mentioned Simulink model to the agent.

The Results folder consists of 3 other folder with similar content but varying data. Each folder corresponds to each simulation period which contains:
  1. The Excel file containing the raw data of the observed flight within the observation period.
  2. The converted Excel file into .mat format
  3. The resulting folder containing data per observed flight, flight_testing.mat, and obs.mat when the converted excel file was runned into the Initialdata_preprocessing.mlx livescript along with fp_in.
  4. fp_in to be used as the initial input to the algorithm as the reference for the state of the environment at its initial stage.
  5. results folder cosisting the following files:
    a. trainOpts.mat is a matrix containing the agent and algorithm configuration determined in RLlivescript.mlx livescript.
    b. trainResults.mat is a matrix containing the average reward, episode reward, Q0, and other data per episode of training.
    c. png images of the plotted results for Q0 and reward.
    d. mp4 animation of a randomly chosen episode for evaluation refered in the dissertation.
  
