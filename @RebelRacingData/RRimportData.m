%RRimportData
%Will take the RebelRacingData object and populate the object's properties
%with appropriate values from the input file.
%   Inputs : 2
%   obj - The RebelRacingData object that this function will interact with
%   filename - The name of the input file that holds the data

%   Outputs: N/A

%   RebelRacingData Modifications:
%   RRdataTable
%   RRdataTable.Properties.Description
%   RRdataTable.Properties.VariableUnits

function RRimportData(obj, filename)
%% Preliminary
    %Check whether or not input file is char array
    if (~ischar(filename))
        error("Error: Not a file");
    end
            
    %Import the file into memory with readTable
    obj.RRdataTable = readtable(fullfile(obj.RRtempFileDirectory,filename));

%% Move Imported Data to RRdataTable
    
    %Set description of the RRdataTable
    obj.RRdataTable.Properties.Description = ['Data Table Generated From ',filename,'on',date]; 
    
%% Variable Names and Units

    tempVar = obj.RRdataTable.Properties.VariableNames;
    
    for i = 1:length(tempVar)
    
        cnt = 0;
        strtPos = 0;
        endPos = 0;
        columnName = ''; %#ok<NASGU>

        cellContents = tempVar{i};
                
        j = 1;
        while j <= length(cellContents)

            if (cellContents(j) <= 'z' && cellContents(j) >= 'a') || (cellContents(j) <= 'Z' && cellContents(j) >= 'A')
                cnt = cnt + 1;
                
                switch cnt
                    case 1
                        strtPos = j;
                        while (cellContents(j) <= 'z' && cellContents(j) >= 'a') || (cellContents(j) <= 'Z' && cellContents(j) >= 'A') || (cellContents(j) >= '0' && cellContents(j) <= '9')
                            j = j + 1;
                        end
                        endPos = j - 1;
                        columnName = cellContents(strtPos:endPos);
                        obj.RRdataTable.Properties.VariableNames{i} = columnName;
                        
                    case 2
                        strtPos = j;
                        while (cellContents(j) < 'z' && cellContents(j) > 'a') || (cellContents(j) < 'Z' && cellContents(j) > 'A') || (cellContents(j) > '0' && cellContents(j) < '9')
                            j = j + 1;
                        end
                        endPos = j - 1;
                        unitArray{i} = char(cellContents(strtPos:endPos));
                           
                end
            end
            
                %Check whether or not the Units were defined for the
                %variable
                if cnt < 2 && j == length(cellContents)
                    unitArray{i} = '';
                end
                
                j = j + 1;
                
        end 
    end
     
    %Populate variable units information
    obj.RRdataTable.Properties.VariableUnits = unitArray;
        
end