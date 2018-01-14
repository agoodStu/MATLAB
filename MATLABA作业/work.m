% 读入文件
[num, txt, raw] = xlsread('mingxi');
% 获取行列数
[row, column] = size(num);

%**************************************************%
%                                 问题1                                 %
%**************************************************%
% 提示并获取用户输入月份，同时检测输入是否正确，如果不正确，提示用户继续输入
while 1
    month_input = input('Please enter a month(7 - 12) to get  gross expenditure and gross earnings: ', 's');
    month_input_numeric= str2double(month_input);
    if isnumeric(month_input_numeric) && (month_input_numeric > 6 && month_input_numeric < 13)
        if str2double(month_input) < 10
        month_input = strcat('0', month_input);
        end
    break;
    else
        disp('Please enter a right interger in 7 ~ 12! ');
    end
end

expenditure = 0;
earnings = 0;

% 计算该月总收入和总支出
 for i = 1 : row
    month_num = num2str(num(i, 1));
    num_exact = month_num(5:6);
    if num_exact == month_input
        if ~isnan(num(i, 3))
            earnings = earnings + num(i, 3);
        end
        if ~isnan(num(i, 4))
            expenditure = expenditure + num(i, 4);
        end
    end
 end
 
 % 在屏幕上输出该月总收入和总支出
first_output = strcat('2017-', month_input, 32, 'your gross expenditure is', 32,...
    num2str(expenditure), ' and gross earnings is', 32, num2str(earnings), '.');
disp(first_output);

%**************************************************%
%                                 问题2                                 %
%**************************************************%
% 提示并获取用户输入区间段，同时检测输入是否在区间内，如果不在，提示用户继续输入
while 1
    range_input = input('Please enter a date range (e.g. 20170801-20171101) to get a list of balance: ', 's');
    range_input_split = regexp(range_input, '-', 'split');
    startDate = cell2mat(range_input_split(1));
    endDate = cell2mat(range_input_split(2));
    if num(1, 1) > str2double(startDate) || num(row, 1) < str2double(endDate)
        disp('Please enter data in range of 20170701-20171230!');
        continue;
    else
        break;
    end
end

% 获取起始位置
for i = 1:row
    if num(i, 1) >= str2double(startDate)
        startPosition = i;
        break;
    end
end

% 获取结束位置
for i = 1:row
    if num(i, 1) >= str2double(endDate)
        endPosition = i;
        break;
    end
end

% 获取用户输入区间段数据，并写入新数组
list_of_balance = [];
k = 1;
for i = startPosition:endPosition
    list_of_balance(k, 1) = num(i, 1);
    list_of_balance(k, 2) = num(i, 5);
    k = k + 1;
end

% 将数组输出到txt文件
fid = fopen('list_of_balance.txt','wt');
[x, y] = size(list_of_balance);
for i = 1:x
    for j = 1:y
        if j == 1
            fprintf(fid, '%d\t', list_of_balance(i, j));
        else
            fprintf(fid, '%8.1f\t', list_of_balance(i, j));
        end
    end
    fprintf(fid, '\n');
end
fclose(fid);
disp('List of balance is generated!');


