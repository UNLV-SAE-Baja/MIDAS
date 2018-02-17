classdef (ConstructOnLoad = true) RebelRacingData < handle
    %RebelRacingData - Rebel Racing Data Object   
    
    properties (Access = public)
        RRname
        RRdataTable
        RRdataProperties
        RRinputFile
        RRtestAccess
        RRdictionary
        %RRinputFileMetadata
        %RRinputFileDirectory
        %RRtempFileDirectory = '@RebelRacingData\temp-files';
    end
    
    properties (Access = private)
      %  RRdictionary
      % RRtestAccess
    end
    
    %Public Methods
    methods (Access = public)
        %RebelRacingData Constructor
        function obj = RebelRacingData()     
            %Initialize all non-immediate class variables
            obj.RRdataTable = table();
            %Create variable map
            obj.RRcreateDictionary;
        end
        %End of Constructor Function
        
        %Function Signatures
        RRselectFile(obj)
        RRcleanData(obj)
        RRprocessData(obj)
        RRvalidateVariables(obj)
    end
    
    %Private Methods
    methods (Access = private)
       
        %Function Signatures
        RRimportData(obj,filename)
        RRcreateDictionary(obj)
        RRcreateTestAccessInfo(obj)
        
    end
    
end

