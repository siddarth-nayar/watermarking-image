 
%% clear memory & command window
clc
clear
close all 
%% load data
wm_sz     = 20000;                        % watermark size
px_sz     = wm_sz/8;                      % number of pixels
im_sz     = sqrt(px_sz);                  % image size
host_new  = audioread ('host_sid.wav');   % new (watermarked) host signal
host_new  = uint8(255*(host_new + 0.5));  % double [-0.5 +0.5] to 'uint8'
%% prepare host
host_bin  = dec2bin(host_new, 8);         % binary host
%% extract watermark
wm_bin_str = host_bin(1:wm_sz, 8);
wm_bin    = reshape(wm_bin_str, px_sz , 8);
wm_str    = zeros(px_sz, 1, 'uint8');
for i     = 1:px_sz                        % extract water mark from the first plane of host               
wm_str(i, :) = bin2dec(wm_bin(i, :));      % Least Significant Bit (LSB)
end
wm        = reshape(wm_str, im_sz , im_sz);
%% show image
imshow(wm)