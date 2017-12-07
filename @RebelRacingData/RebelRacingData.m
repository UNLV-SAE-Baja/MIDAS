classdef (ConstructOnLoad = true) RebelRacingData < handle
    %RRDATA - Rebel Racing Data Object   
    
    properties
        RRdataTable
        
       % enumeration
       %    ALL, NONE, ENGINE, CVT, SUSPENSION, CHASSIS, RACE, HILLCLIMB,
       %    DYNAMICS, SLEDPULL, ACCELERATION
       % end
       
        RRinputFileName
        RRinputFileDirectory
        RRtempFileDirectory = '@RebelRacingData\temp-files';
        
    end
    
    %Public Methods
    methods (Access = public)
        
        %RebelRacingData Constructor
        function obj = RebelRacingData()
                
                %Initialize all non-immediate class variables
                obj.RRdataTable = table();
                obj.RRinputFileName = {};
                obj.RRinputFileDirectory = '';

        end
        %End of Constructor Function
        
        %Function Signatures
        RRselectFiles(obj)
        RRcleanData(obj)
        RRprocessData(obj)
        RRclearFiles(obj)
        
    end
    
    %Private Methods
    methods (Access = private)
       
        %Function Signatures
        RRimportData(obj,filename)
        
    end
    
end
