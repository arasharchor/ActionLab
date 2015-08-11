function PreData()
% prepare the list_train_data and list_test_data for the MSR.m to use
% in MSR Action3D Dataset, subject 1,3,5,7,9 is for training while 2,4,6,8,10 is for testing
% by Jacket, 08/11/2015
	
	fid = fopen('skeleton_data\MSR_ske\dataList.txt', 'r');
	if fid == 0
		error('Can not find the dataList.txt');
	end
	
end