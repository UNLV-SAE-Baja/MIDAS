%% RRselectFiles
%Will take the RebelRacingData object and populate file descriptor
%information. This function will open a dialog box where the user can select the files
%that they wish to import.

%   Inputs : 1
%   obj - The RebelRacingData object that this function will interact with

%   Outputs: N/A

%   RebelRacingData Modifications:
%   RRinputFileName
%   RRinputFileDirectory
%   @RebelRacingData\temp-files

function RRselectFiles(obj)
%% Launch Dialog Box
%uigetfile - Introduced before R2006a
    
%Save filenames and directory of files into class variables
if (nargin == 1)
    [obj.RRinputFileName, obj.RRinputFileDirectory] = uigetfile({'*.log','RaceCapture File (*.log)';'*.csv','Comma Separated Value (*.csv)'},'Select Data File(s)', 'MultiSelect', 'on'); 
end

%% Clear All Current Files in @RebelRacingData/temp-files
%To ensure that processing only occurs on files that are user specified

obj.RRclearFiles;

%% Copy All Relevant Files to @RebelRacingData/temp-files
%copyfile - Introduced before R2006a
%fullfile - Introduced before R2006a
%length - Introduced before R2006a
    
%Loop through all selected data and copy those files to temp directory. The
%if statment checks whether or not the length == 1 because if so, and you
%attempt to access RRinputFileName as a cell array with {i}, you will get
%an error.
%NewExtension = '.csv';

%Error: Need to find a way to differentiate between character vector and
%array of vectors. Maybe don't use size().
len = size(obj.RRinputFileName);
if len(1) == 1
    len = 1;
else
len = len(2);
end

for i = 1:len
    if len == 1
        filename = fullfile(obj.RRinputFileDirectory,obj.RRinputFileName);
    else
        filename = fullfile(obj.RRinputFileDirectory,obj.RRinputFileName{i});
    end
    copyfile(filename,obj.RRtempFileDirectory);
end
    
end