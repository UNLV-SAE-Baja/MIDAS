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

tempDictionary1 = containers.Map(keySet, valueSet);
tempDictionary2 = containers.Map;

%Move all duplicates to tempDictionary2, when the single keys are added to
%the dictionary afterwards, they will not be overwritten.
for i = 1:length(keySet)
    for j = (i+1):length(keySet)
        str1 = tempDictionary1(keySet{i});
        str2 = tempDictionary1(keySet{j});
        if strcmp(str1,str2)
            tempDictionary2(keySet{i}) = valueSet{i};
            tempDictionary2(keySet{j}) = tempDictionary2(keySet{i});
        end
    end
end

%Add all the single key value pairs to the tempDictionary2
for i = 1:length(keySet)
    tempDictionary2(keySet{i}) = valueSet{i};
end

obj.RRdictionary = tempDictionary2;
end

