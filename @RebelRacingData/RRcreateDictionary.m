function RRcreateDictionary (obj)
%RRcreateDictionary constructs the dictionary from the file KeyValues.txt 
%which will determine which variable names are supported
%   The KeyValues.txt file will continuously be a work in progress and
%   suggestions for new variable names shall be taken on the github issues.

%% Read the KeyValues.txt File

tempTable = readtable('@RebelRacingData\ConfigurationFiles\KeyValues.txt');

%Transpose the individual column vectors to create the cell array that will
%be passed to the object.
keySet = tempTable.Key';
valueSet = tempTable.Value';

%% Populate the Map Container

obj.RRdictionary = containers.Map(keySet, valueSet);

end

