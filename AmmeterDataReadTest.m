%%
dataFileList = dir([pwd,'/data']);
dataFileNameList = {dataFileList.name};
%%
for ix = 3 : 4 %length(dataFileNameList)                     % index starts by 3 because the first two of a dir is '.' and '..' which lead to upper folder.
    dataFileName = [pwd,'/data/',dataFileNameList{ix}];
    data = interpAmmeterData(dataFileName);
    [status, msg] = restoreResult(data);
end