%%
dataFileList = dir([pwd,'/data']);
dataFileNameList = {dataFileList.name};
%%
dataFileName = dataFileNameList{3};
data = interpAmmeterData(dataFileName);