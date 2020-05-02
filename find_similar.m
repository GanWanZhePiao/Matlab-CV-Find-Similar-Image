% find_similar.m
% Find the similarist images using img_diff and sort by decending order.
% author: hxp<hxp201406@gmail.com>

function img_files_sorted=find_similar(image, img_files)
    for i = 1:length(img_files)
        [matchedPoints1, matchedPoints2, matchedPointsCount] = img_diff(image, img_files{2,i});
        img_files{3,i} = matchedPoints1;
        img_files{4,i} = matchedPoints2;
        img_files{5,i} = matchedPointsCount;
    end
    img_files_sorted = sortrows(img_files',-5)';
end