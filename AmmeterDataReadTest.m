%%
dataFileList = dir([pwd,'/data']);
dataFileNameList = {dataFileList.name};
%%
dataFileName = [pwd,'/data/',dataFileNameList{82}];
data = interpAmmeterData(dataFileName);