classdef (ConstructOnLoad = true) RebelRacingData < handle
    %RebelRacingData - Rebel Racing Data Object   
    
    properties (Access = public)
        RRname
        RRdataTable
        RRdataProperties
        RRinputFile
        %RRinputFileMetadata
        %RRinputFileDirectory
        %RRtempFileDirectory = '@RebelRacingData\temp-files';
    end
    
    properties (Access = private)
       RRdictionary
       RRtestAccess
       RRoutputFileDirectory
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
        %RRprocessData(obj)
        RRlinkVariable(obj, var, standard)
        RRlinkVariableGUI(obj)
  out = RRunlinked(obj)
  out = RRlinked(obj)
        RRsetOutputDirectory(obj)
  out = RRgetUnits(obj, standard)
  tf  = RRisStandard(obj, query)
  tf  = RRisVariable(obj, query)
  [tf, out]  = RRisLinked(obj, query)
        RRplot(obj, variable, var)
        
        %Plotting Functions
        RRbatteryVtime(obj)

    end
    
    %Private Methods
    methods (Access = private)
       
        %Function Signatures
        RRimportData(obj,filename)
        RRcreateDictionary(obj)
        RRcreateTestAccessInfo(obj)
        RRvalidateVariables(obj)
  out = RRtestAccessStatus(obj, status, fieldname)
  out = RRtestAccessVariable(obj, fieldname)

        

    end
    
end

