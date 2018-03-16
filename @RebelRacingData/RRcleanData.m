%RRcleanData
%Will take the RebelRacingData object and make the data more user friendly.
%This will use MATLAB's fillmissing() and filloutliers().
%   Inputs : 1
%   obj - The RebelRacingData object that this function will interact with

%   Outputs: N/A

%   RebelRacingData Modifications:
%   RRdataTable

function RRcleanData(obj)
    %fillmissing - introduced in R2016b
    %filloutliers - introduced in R2017a
    
    %Complete removal of all NaN values from data table
    obj.RRdataTable = fillmissing(obj.RRdataTable, 'previous');
    obj.RRdataTable = fillmissing(obj.RRdataTable, 'nearest');
    
    %Reset interval
    Initial = obj.RRdataTable{1,1};
    obj.RRdataTable.Interval = obj.RRdataTable.Interval - Initial;
    
    %Fill outliers with previous 'valid' information. According to MATLAB
    %documentation, "an outlier is a value that is more than three scaled
    %median absolute deviations (MAD) away from the median".
    obj.RRdataTable = filloutliers(obj.RRdataTable, 'previous');
    
end

