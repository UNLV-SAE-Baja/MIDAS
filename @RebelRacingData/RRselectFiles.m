%% RRselectFiles
%Will take the RebelRacingData object and populate file descriptor
%information. This function will open a dialog box where the user can select the files
%that they wish to import.

%   Inputs : 1
%   obj - The RebelRacingData object that this function will interact with

%   Outputs: N/A

%   RebelRacingData Modifications:
%   RRinputFiles
%   RRinputFileMetadata
%   RRinputFileDirectory
%   @RebelRacingData\temp-files

function RRselectFiles(obj)
%% Launch Dialog Box
%uigetfile - Introduced before R2006a
    
%Save filenames and directory of files into class variables
if (nargin == 1)
    [obj.RRinputFiles, obj.RRinputFileDirectory] = uigetfile({'*.log','RaceCapture File (*.log)';'*.csv','Comma Separated Value (*.csv)'},'Select Data File(s)', 'MultiSelect', 'on'); 
end

%% Clear All Current Files in @RebelRacingData/temp-files
%To ensure that processing only occurs on files that are user specified

obj.RRclearFiles;

%% Copy All Relevant Files to @RebelRacingData/temp-files
%copyfile - Introduced before R2006a
%fullfile - Introduced before R2006a
%length - Introduced before R2006a
%iscellstr - Introduced before R2006a
    
%If the input from user is a cell array. Loop through all selected data 
%and copy those files to temp directory.
%NewExtension = '.csv';

cellarray = iscellstr(obj.RRinputFiles);

if cellarray
    len = length(obj.RRinputFiles);
    for i = 1:len
        filename = fullfile(obj.RRinputFileDirectory,obj.RRinputFiles{i});
        copyfile(filename,obj.RRtempFileDirectory);
    end
else
    filename = fullfile(obj.RRinputFileDirectory,obj.RRinputFiles);
    copyfile(filename,obj.RRtempFileDirectory);
end

%% Update RRinputFileMetadata with File Information
%dir - Introduced before R2006a
%movefile - Introduced before R2006a

%Will replace the current cell array with directory information which will
%help to consolidate all file information into one place. RRinputFiles will
%now include fields for name, folder, date, bytes, isdir, and datenum. This
%is important information that we will want to have for the future after
%the extension of the files are changed to .csv

obj.RRinputFileMetadata = dir(obj.RRtempFileDirectory);
len = length(obj.RRinputFileMetadata);

if cellarray
    cnt = 0;
    for i = 1:len
        if ~obj.RRinputFileMetadata(i).isdir
            cnt = cnt + 1;
            filename = fullfile(obj.RRinputFileMetadata(i).folder, obj.RRinputFileMetadata(i).name);
            [path, name, ~] = fileparts(filename);
            obj.RRinputFiles{cnt} = fullfile(path, [name '.csv']);
            movefile(filename,fullfile(path, [name '.csv']));
        end
    end
else
    for i = 1:len
        if ~obj.RRinputFileMetadata(i).isdir
            filename = fullfile(obj.RRinputFileMetadata(i).folder, obj.RRinputFileMetadata(i).name);
            [path, name, ~] = fileparts(filename);
            obj.RRinputFiles = fullfile(path, [name '.csv']);
            movefile(filename,fullfile(path, [name '.csv']));
        end
    end
end