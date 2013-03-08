function [status, msg] = restoreResult(data)

fileName = 'result.xlsx';

f = fieldnames(data{1});
c = cell( length(data), length(f) );
for ix = 1 : length(data)
    try
        c(ix, :) = struct2cell(data{ix})';
    catch e
        % data read error 
    end
end
[status, msg] = xlswrite(fileName,c);
end