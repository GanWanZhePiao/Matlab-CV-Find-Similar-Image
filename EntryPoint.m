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
if ~isfolder(folder)
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
    img_files{1,k} = full_filename; %#ok<SAGROW>
    img_files{2,k} = imread(full_filename); %#ok<SAGROW>
    
%     % Extract histogram of oriented gradients (HOG) features
%     fprintf(1, 'Now analyzing %s\n', fullFileName);
%     [featureVector,hogVisualization] = extractHOGFeatures(imageArray);
%     figure;
%     imshow(imageArray);  % Display image.
%     hold on;
%     plot(hogVisualization);
%     hold off;
%     drawnow; % Force display to update immediately.
end

% Saving all images to db
% save db_img

img_diff(img_files{2,6}, img_files{2,8});