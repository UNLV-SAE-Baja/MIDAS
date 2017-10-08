function obj = RRimportData(obj, filename)
           
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
     unitArray = cell(length(tempData.textdata));
            
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
                        obj.RRdataTable.(columnName) = zeros(0);
                    
                    case 3
                        strtPos = j + 1;
                    
                    case 4 %save units to the cell array
                        endPos = j - 1;
                        if endPos - strtPos <= 1
                            unitArray{i} = '';
                        else
                            unitArray{i} = char(cellContents(strtPos:endPos));
                        end
                end
            end
        end 
     end
     
     %Populate variable units information
     obj.RRdataTable.Properties.VariableUnits = unitArray; %This line doesnt work!
            
end