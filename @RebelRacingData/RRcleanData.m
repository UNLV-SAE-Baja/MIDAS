%RRcleanData
%Will take the RebelRacingData object and make the data more user friendly.
%This will use MATLAB's fillmissing().
%   Inputs : 1
%   obj - The RebelRacingData object that this function will interact with

%   Outputs: N/A

%   RebelRacingData Modifications:
%   RRdataTable

function RRcleanData(obj)

    %Complete removal of all NaN values from data table
    obj.RRdataTable = fillmissing(obj.RRdataTable, 'previous');
    obj.RRdataTable = fillmissing(obj.RRdataTable, 'nearest');
    
end

