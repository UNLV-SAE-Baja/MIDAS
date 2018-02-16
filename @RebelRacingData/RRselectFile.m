%% RRselectFile
%Will open a dialog box to select a single (1) file and populate the
%RebelRacingData object with the necessary information. This functionality
%is only available to the single RebelRacingData object.

%   Inputs : 1
%   obj - The RebelRacingData object that this function will interact with

%   Outputs: N/A

%   RebelRacingData Modifications: N/A
%   Any modifications to the object will occur within the RRimportData
%   function.

function RRselectFile(obj)
%% Launch Dialog Box
%uigetfile - Introduced before R2006a
    
%Save filenames and directory of files into class variables
if (nargin == 1)
    [InputFile, FileDirectory] = uigetfile({'*.log','RaceCapture File (*.log)';'*.csv','Comma Separated Value (*.csv)'},'Select Data File(s)', 'MultiSelect', 'off'); 
end

%% Make a Copy, Change Extension to '.csv', and Import Data
%copyfile - Introduced before R2006a
%fullfile - Introduced before R2006a
%length - Introduced before R2006a
%iscellstr - Introduced before R2006a
%pwd - Introduced before R2006a
    
%Create temporary '.csv' copy of the input file
tempLocation = pwd;
filename = fullfile(FileDirectory, InputFile);
[~, name, ~] = fileparts(filename);
newFile = fullfile(tempLocation, [name '.csv']);
copyfile(filename, newFile);

%Import
obj.RRimportData(newFile);

%Delete temporary input file
delete(newFile);