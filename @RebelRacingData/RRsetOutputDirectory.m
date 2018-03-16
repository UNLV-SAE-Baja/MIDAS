function RRsetOutputDirectory (obj)
%RRsetOutputDirectory Will open dialog box to browse locations in which to
%save output figures.

%% Error Handling

if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

%% Open Dialog Box

outDir = uigetdir();

if outDir == 0
    error('User did not select an output directory');
end

obj.RRoutputFileDirectory = outDir;

end

