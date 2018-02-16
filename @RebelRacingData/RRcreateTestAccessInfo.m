function RRcreateTestAccessInfo(obj)
%RRcreateTestAccessStruct will create the data structure that will allow
%MATLAB to more easily distinguish which tests will be allowed to run based
%on the variables provided by the input file.
    %This struct will hold all the standard names for specific variables about
    %the car. This will help to maintain continuity among all differrent data
    %sets, some of which, may have 'interesting' naming choices. This will
    %allow for a standard among publications from these tools.


%% Create the Empty Struct with Standard Field Names
%MATLAB will not allow for this to be broken up on individual lines so this
%is the only (easiest) solution for the issue. 

tempStruct = struct('Interval',[],'UTC',[],'Analog1',[],'Battery',[],'AccelerationX',[],'AccelerationY',[],'AccelerationZ',[],'Yaw',[],'Pitch',[],'Roll',[],'EngineRPM',[],'AxleRPM',[],'Latitude',[],'Longitude',[],'Speed',[],'Distance',[],'Altitude',[],'GPSSatillites',[],'GPSQuality',[],'GPSDOP',[],'LapCount',[],'LapTime',[],'Sector',[],'SectorTime',[],'PredictedTime',[],'ElapsedTime',[],'CurrentLap',[]);

%% Add Standard Items to the RRtestAccess Field
%setfield - introduced before R2006a

%This struct will hold all the standard names for specific variables about
%the car. This will help to maintain continuity among all differrent data
%sets, some of which, may have 'interesting' naming choices. This will
%allow for a standard among publications from these tools. The standards
%will change over time to become more inclusive. Shall take suggestions for
%new standard fields on the RebelRacing Github.

tempStruct = setfield(tempStruct,'Interval',struct('StandardName','Interval','VariableName',[],'Valid',0)); %#ok<*SFLD>
tempStruct = setfield(tempStruct,'UTC',struct('StandardName','UTC','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Analog1',struct('StandardName','Analog1','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Battery',struct('StandardName','Battery','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'AccelerationX',struct('StandardName','Acceleration_X','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'AccelerationY',struct('StandardName','Acceleration_Y','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'AccelerationZ',struct('StandardName','Acceleration_Z','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Yaw',struct('StandardName','Yaw','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Pitch',struct('StandardName','Pitch','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Roll',struct('StandardName','Roll','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'EngineRPM',struct('StandardName','Engine_RPM','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'AxleRPM',struct('StandardName','Axle_RPM','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Latitude',struct('StandardName','Latitude','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Longitude',struct('StandardName','Longitude','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Speed',struct('StandardName','Speed','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Distance',struct('StandardName','Distance','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Altitude',struct('StandardName','Altitude','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'GPSSatillites',struct('StandardName','GPS_Satillites','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'GPSQuality',struct('StandardName','GPS_Quality','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'GPSDOP',struct('StandardName','GPS_DOP','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'LapCount',struct('StandardName','Lap_Count','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'LapTime',struct('StandardName','Lap_Time','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Sector',struct('StandardName','Sector','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'SectorTime',struct('StandardName','Sector_Time','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'PredictedTime',struct('StandardName','Predicted_Time','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'ElapsedTime',struct('StandardName','Elapsed_Time','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'CurrentLap',struct('StandardName','Current_Lap','VariableName',[],'Valid',0));

%Assign the fields to the RRtestAccess property
obj.RRtestAccess = tempStruct;

end

