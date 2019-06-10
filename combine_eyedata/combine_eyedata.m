clear;
input_file = 'E:\expdata\exp1\formal\eyecompute';
output_file = 'E:\expdata\exp1\formal\eyecompute_all\';

dirOutput = dir(fullfile(input_file,'*.xlsx'));
file_name_lists = {dirOutput.name};

%
blink_lists = [];
converge_lists = [];
fixation_lists = [];
microsac_lists = [];
pupil_lists = [];
steadiness_lists = [];
for i = 1:length(file_name_lists)
    t = regexp(file_name_lists{i}, '_', 'split');  % 分割文件名
    switch t{4}
        case 'blink.xlsx'
            blink_lists = [blink_lists file_name_lists(i)];
        case 'converge.xlsx'
            converge_lists = [converge_lists file_name_lists(i)];
        case 'fixation.xlsx'
            fixation_lists = [fixation_lists file_name_lists(i)];
        case 'microsac.xlsx'
            microsac_lists = [microsac_lists file_name_lists(i)];
        case 'pupil.xlsx'
            pupil_lists = [pupil_lists file_name_lists(i)];
        case 'steadiness.xlsx'
            steadiness_lists = [steadiness_lists file_name_lists(i)];
    end
end

% blink_all = [];
% converge_all = [];
% fixation_all= [];
% microsac_all = [];
% pupil_all= [];
% steadiness_all = [];

blink_all = combine_list(input_file, blink_lists);
converge_all = combine_list(input_file, converge_lists);
fixation_all = combine_list(input_file, fixation_lists);
microsac_all = combine_list(input_file, microsac_lists);
pupil_all = combine_list(input_file, pupil_lists);
steadiness_all = combine_list(input_file, steadiness_lists);

xlswrite([output_file 'blink_all.xlsx'], blink_all);
xlswrite([output_file 'converge_all.xlsx'], converge_all);
xlswrite([output_file 'fixation_all.xlsx'], fixation_all);
xlswrite([output_file 'microsac_all.xlsx'], microsac_all);
xlswrite([output_file 'pupil_all.xlsx'], pupil_all);
xlswrite([output_file 'steadiness.xlsx'], steadiness_all);
