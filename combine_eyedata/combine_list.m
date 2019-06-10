function out_list = combine_list(src, name_list)
    out_list = [];
    for i=1:length(name_list)
        [data, header] = xlsread([src '\' name_list{i}]);
        out_list = [out_list;data];
    end
    out_list = [header; num2cell(out_list)];
end