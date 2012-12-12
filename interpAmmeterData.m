function [ ammeterData ] = interpAmmeterData( dataFilename )
%INTERPAMMETERDATA Summary of this function goes here
%   Detailed explanation goes here

% check if empty
finfo = dir(dataFilename);
fsize = finfo.bytes;
assert(fsize>0,'File is empty');

fid = fopen(dataFilename);
% regulate data, data structure only follows action, property, value, address
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

    dataCluster.action = data{1};
    dataCluster.property = data{2};
    dataCluster.value = str2double(data{3});
    dataCluster.address = data{4};

function data = separateStr(str)
    ix = 1;
    remain = str;
    while(~isempty(remain))
        [token, remain] = strtok(remain,0);
        data{ix} = token;
        ix = ix + 1;
    end