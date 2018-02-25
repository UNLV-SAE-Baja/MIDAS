function RRcreateTestAccessInfo(obj)
%RRcreateTestAccessStruct will create the data structure that will allow
%MATLAB to more easily distinguish which tests will be allowed to run based
%on the variables provided by the input file.
%   This struct will hold all the standard names for specific variables about
%   the car. This will help to maintain continuity among all differrent data
%   sets, some of which, may have ambiguous naming choices. This will
%   allow for a standard among publications from these tools.


%% Create the Empty Struct with Standard Field Names

tempStruct = struct('Interval',[],...
                    'UTC',[],...
                    'Battery',[],...
                    'Acceleration_X',[],...
                    'Acceleration_Y',[],...
                    'Acceleration_Z',[],...
                    'Yaw',[],...
                    'Pitch',[],...
                    'Roll',[],...
                    'Engine_RPM',[],...
                    'Axle_RPM',[],...
                    'Latitude',[],...
                    'Longitude',[],...
                    'Speed',[],...
                    'Distance',[],...
                    'Altitude',[],...
                    'GPS_Satillites',[],...
                    'GPS_Quality',[],...
                    'GPS_DOP',[],...
                    'Lap_Count',[],...
                    'Lap_Time',[],...
                    'Sector',[],...
                    'Sector_Time',[],...
                    'Predicted_Time',[],...
                    'Elapsed_Time',[],...
                    'Current_Lap',[]);

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
tempStruct = setfield(tempStruct,'Battery',struct('StandardName','Battery','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Acceleration_X',struct('StandardName','Acceleration_X','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Acceleration_Y',struct('StandardName','Acceleration_Y','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Acceleration_Z',struct('StandardName','Acceleration_Z','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Yaw',struct('StandardName','Yaw','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Pitch',struct('StandardName','Pitch','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Roll',struct('StandardName','Roll','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Engine_RPM',struct('StandardName','Engine_RPM','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Axle_RPM',struct('StandardName','Axle_RPM','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Latitude',struct('StandardName','Latitude','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Longitude',struct('StandardName','Longitude','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Speed',struct('StandardName','Speed','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Distance',struct('StandardName','Distance','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Altitude',struct('StandardName','Altitude','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'GPS_Satillites',struct('StandardName','GPS_Satillites','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'GPS_Quality',struct('StandardName','GPS_Quality','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'GPS_DOP',struct('StandardName','GPS_DOP','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Lap_Count',struct('StandardName','Lap_Count','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Lap_Time',struct('StandardName','Lap_Time','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Sector',struct('StandardName','Sector','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Sector_Time',struct('StandardName','Sector_Time','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Predicted_Time',struct('StandardName','Predicted_Time','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Elapsed_Time',struct('StandardName','Elapsed_Time','VariableName',[],'Valid',0));
tempStruct = setfield(tempStruct,'Current_Lap',struct('StandardName','Current_Lap','VariableName',[],'Valid',0));

%Assign the fields to the RRtestAccess property
obj.RRtestAccess = tempStruct;

end
