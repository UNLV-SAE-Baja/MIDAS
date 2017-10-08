classdef (ConstructOnLoad = true) RebelRacingData
    %RRDATA - Rebel Racing Data Object
    %   
    
    properties
        RRdataTable
        
       % enumeration
       %    ALL, NONE, ENGINE, CVT, SUSPENSION, CHASSIS, RACE, HILLCLIMB,
       %    DYNAMICS, SLEDPULL, ACCELERATION
       % end
        
        RRengineStartStop
        RRcvtStartStop
        RRsuspensionStartStop
        RRchassisStartStop
        RRraceStartStop
        RRhillclimbStartStop
        RRdynamicsStartStop
        RRaccelerationStartStop
        RRinputfileName
        
    end
    
    methods
        
        %RebelRacingData Constructor
        function obj = RebelRacingData
                
                %Initialize all non-immediate class variables
                obj.RRengineStartStop = 0; %#ok<*NASGU>
                obj.RRcvtStartStop = 0;
                obj.RRsuspensionStartStop = 0;
                obj.RRchassisStartStop = 0;
                obj.RRraceStartStop = 0;
                obj.RRhillclimbStartStop = 0;
                obj.RRdynamicsStartStop = 0;
                obj.RRaccelerationStartStop = 0;
                obj.RRdataTable = table();
                obj.RRinputfileName = '';
       
        end
        %End of Constructor Function
        
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
                endPos = 0;
                columnName = '';

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
        %End of function
        
    end
    %End of Methods Section
end

