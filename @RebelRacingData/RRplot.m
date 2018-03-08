function outFig = RRplot(obj, x, y)
%RRplot Will plot, label, and format a 2D plot with respect to UNLV SAE
%Baja Rebel Racing team standards.
%   This function should:
%   -accept variable names from the input file
%   -accept standard names
%   -in case of standard names passed, make sure linked
%   -accept any number of pairs of input (formatted in cell array)
%   -accept one x term and any number of y terms
%   -plot in professional/academic manner
%   -plot in scarlett and black
%   -create a legend for all plotted data

%% Error Handling

%RebelRacingData object
if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

%If X is passed as a cell array, but only has one member, convert to char
if iscell(x) && length(x) == 1
    x = x{1};
end

%If Y is passed as a cell array, but only has one member, convert to char
if iscell(y) && length(y) == 1
    y = y{1};
end

%Validate count and number of input arguments
%if (iscell(x) && iscell(y)) && (length(x) > length(y))
%    error('Input cell array for X has more elements than input cell array for Y');
%elseif (iscell(x) && length(x) ~= 1) && (class(y) == 'char')
%    error('Input cell array for X has more elements than input character vector Y');
%end

%Check that the first member of x is 
%Validate correct variable/standard inputs for variable 'x'
if iscell(x)
    for i = 1:length(x)
        if ~RRisVariable(obj, x{i}) && ~RRisStandard(obj, x{i})
            error('X argument is not a variable nor standard');
        elseif RRisStandard(obj, x{i}) && ~RRisLinked(obj, x{i})
            error('The standard provided is not linked to any variable in the current dataset');
        end
    end
end
        

end

