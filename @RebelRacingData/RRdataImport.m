%RRdataImport
%Will take the RebelRacingData object and populate the object's properties
%with appropriate values from the input file.
%   Inputs : 2
%   obj - The RebelRacingData object that this function will interact with
%   filename - The name of the input file that holds the data

%   Outputs: N/A

%   RebelRacingData Modifications:
%   RRinputfileName
%   RRdataTable
%   RRdataTable.Properties.Description
%   RRdataTable.Properties.VariableUnits

function RRdataImport(obj, filename)
%% Introduction
    %Check whether or not input file is char array
    if (~ischar(filename))
        error("Error: Not a file");
    end
            
    %Save input file name
    obj.RRinputfileName = filename;
    
    %Create temporary dataset
    tempData = importdata(filename, ",", 1);
            
    %Preallocate empty cell array to size of the input file 
    %in order to save variable units
    unitArray = cell(length(tempData.textdata),1);

%% Move Imported Data to RRdataTable

    obj.RRdataTable = array2table(tempData.data);
    
    %Set description of the RRdataTable
    obj.RRdataTable.Properties.Description = ['Data Table Generated From ',filename]; 
    
%% Variable Names and Units
     for i = 1:length(tempData.textdata)
    
        cnt = 0;
        strtPos = 0;
        endPos = 0; %#ok<NASGU>
        columnName = ''; %#ok<NASGU>

        cellContents = tempData.textdata{i};
                
        for j = 1:length(cellContents)
            %Count the number of double quotes to separate the variable
            %name from the variable units
            if cellContents(j) == '"'
                cnt = cnt + 1;
                    
                switch cnt
                    case 1
                        strtPos = j + 1; 
                    
                    case 2
                        endPos = j - 1;
                        columnName = cellContents(strtPos:endPos);
                        obj.RRdataTable.Properties.VariableNames{i} = columnName;
                    
                    case 3
                        strtPos = j + 1;
                    
                    case 4 %save units to the cell array
                        endPos = j - 1;
                        unitArray{i} = char(cellContents(strtPos:endPos));
                        
                end
            end
        end 
    end
     
    %Populate variable units information
    obj.RRdataTable.Properties.VariableUnits = unitArray;
            
end