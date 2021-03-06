% EntryPoint.m
% The entrypoint of this CV program.
% Read All the files in a subfolder of the current directory.
% author: hxp<hxp201406@gmail.com>

% Specify the folder where the files live.
% Note that you had better use English folder name, in order to avoid
% encoding errors
clc
clear
folder = './shorts/';

% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isdir(folder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', folder);
    uiwait(warndlg(errorMessage));
    return;
end

% Get a list of all jpg files in the folder.
file_pattern = fullfile(folder, '*.jpg');
files = dir(file_pattern);
img_files = {};
for k = 1 : length(files)
    base_filename = files(k).name;
    full_filename = fullfile(folder, base_filename);
    fprintf(1, 'Now reading %s\n', full_filename);
    img_files{1,k} = full_filename;
    img_files{2,k} = imread(full_filename);
end

% Saving all images to db
% save db_img

% Select an Image
[filename,filepath]=uigetfile({'*.jpg'},'Select and image');
current_img = imread(strcat(filepath, filename));

img_files_sorted = find_similar(current_img, img_files);

for j = 3:10
    figure
    subplot(2,2,1);
    imshow(current_img);
    title('Selected Figure')
    subplot(2,2,2);
    imshow(img_files_sorted{2,j});
    title('Figure No.' + string(j))
    subplot(2,2,[3,4]);
    showMatchedFeatures(rgb2gray(current_img),rgb2gray(img_files_sorted{2,j}),img_files_sorted{3,j},img_files_sorted{4,j});
    legend('matched points 1','matched points 2')
    title('Matched Points Count:' + string(img_files_sorted{5,j}));
end