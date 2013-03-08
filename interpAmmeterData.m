function [ ammeterData ] = interpAmmeterData( dataFilename )
%INTERPAMMETERDATA Summary of this function goes here
%   Detailed explanation goes here

% check if empty
finfo = dir(dataFilename);
assert(finfo.bytes>0,'File is empty');

fid = fopen(dataFilename);
% regulate data, data structure order follows action, property, value,
% address, time, unit.
% data structure can be changed.
tline = fgetl(fid);
ix = 1;
while ischar(tline)
    ammeterData{ix} = getCluster(tline);
    tline = fgetl(fid);
    ix = ix + 1;
end

function dataCluster = getCluster(str)
    data = separateStr(str);

    try
        dataCluster.action = data{1};
        dataCluster.property = data{2};
        dataCluster.value = str2double(data{3});
        dataCluster.address = data{4};
        dataCluster.time = data{5};
        dataCluster.unit = data{6};
    catch e
        return;
    end

function data = separateStr(str)
    ix = 1;
    remain = regulateString(str);
    while(~isempty(remain))
        [token, remain] = strtok(remain,' ');
        data{ix} = token;
        ix = ix + 1;
    end
    
function regStr = regulateString(str)
    charNum = uint16(str);
    charNum(charNum < 32) = 32;
    regStr = char(charNum);
    