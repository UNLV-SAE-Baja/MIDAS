%% RRclearFiles
%Will clear the @RebelRacingData\temp-files directory of any extra files
%that are stored there from a previous software execution. I should
%probably have a function that checks whether or not you are using MATLAB
%on a Mac and adjust the directory from '\' to '/'... that will come a
%little later.
%Note: I'm thinking that these functions should be (boolean?) some sort of
%value returning so that when the application is developed I can return
%appropriate error messages to the user. Perhaps I can just use the
%'events' in MATLAB to accomplish this. 

%   Inputs: 1
%   obj - The RebelRacingData object that this function will interact with

%   Outputs: N/A

%   RebelRacingData Modifications:
%   @RebelRacingData\temp-files

function RRclearFiles(obj)
%dir - Introduced before R2006a
%warning - Introduced before R2006a

%Supress the warning for deletion of all files within a directory, so as to
%not scare the squirrely engineers
warning('off','MATLAB:DELETE:DirectoryDeletion');

files = dir(obj.RRtempFileDirectory);

for i = 1:length(files)
    delete(fullfile(obj.RRtempFileDirectory,files(i).name));
end

end

