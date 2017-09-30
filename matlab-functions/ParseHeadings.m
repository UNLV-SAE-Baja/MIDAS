function [] = ParseHeadings

clear T;
T = dataset;

for i = 1:length(D.textdata)
    
    cnt = 0;
    strtPos = 0;
    endPos = 0;
    
    cellContents = D.textdata{i};
    
    for j = 1:length(cellContents);
        if cellContents(j) == '"'
            cnt = cnt + 1;
            if cnt == 1
               strtPos = j + 1; 
            end
            if cnt == 2
                endPos = j - 1;
            end
        end
    end 
    
   % modifiedString = cellContents(strtPos:endPos);
   % T = set(T, 'VarNames', modifiedString);
      %T.string(cellContents(strtPos:endPos)) = 0;
      T.(cellContents(strtPos:endPos)) = i;
      %  T.Properties.VarNames{'modifiedString'} = char(cellContents(strtPos:endPos));
end
    

clear cnt;
clear endPos;
clear strtPos;
end