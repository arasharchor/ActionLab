function MSR()
% frame level descriptor v0.00 = original skeleton data
% by jacket, 08/11/2015

	load('list_train_data');
	[train_label, train_data] = ReadData(list_train_data);
	model = svmtrain(train_label, train_data, '-b 1');
	save('data/model');

	load('list_test_data');
	testCase = size(list_test_data, 1);
	prediction = zeros(testCase, 1);
	result = zeros(testCase, 1);
	for action = 1 : testCase
		[test_label, test_data] = ReadData(list_test_data(action, :));
		[~, ~, decision] = svmpredict(test_label, test_data, model, '-b 1');
		[~, pre_label] = max(sum(decision));
		prediction(action) = pre_label;
		result(action) = ( pre_label == list_test_data(action, 1) );
	end

	accuracy = sum(result) / testCase;
	disp( sprintf('MSR accuracy is: %f%%\n', accuracy * 100) );
	save('data/accuracy', 'accuracy');
	save('data/prediction', 'prediction');
	save('data/result', 'result');
end