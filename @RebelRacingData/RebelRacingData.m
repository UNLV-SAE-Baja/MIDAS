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
        
        %Function Signatures
        obj = RRimportData(obj,filename)
        
    end
    %End of Methods Section
end

