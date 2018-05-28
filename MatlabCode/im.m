function varargout = im( I, range, extraInf )
% Function for displaying grayscale images.
%
% Handy function for showing a grayscale or color image with a colorbar.
%
% USAGE
%  h = im( I, [range], [extraInf] )
%
% INPUTS
%  I        - image in a valid format for imagesc
%  range    - [] minval/maxval for imagesc
%  extraInf - [1] if 1 then colorbar is shown as well as tick marks
%
% OUTPUTS
%  h        - handle for image graphics object
%
% EXAMPLE
%  load clown; im( X )
%
% See also imshow, imview, impixelinfo, imtool, imagesc, imchan
%
% Piotr's Image&Video Toolbox      Version 2.41
% Copyright 2012 Piotr Dollar.  [pdollar-at-caltech.edu]
% Please email me if you find bugs, or have suggestions or questions!
% Licensed under the Simplified BSD License [see external/bsd.txt]
if( nargin<1 || isempty(I)); I=0; end;
if( nargin<2 || isempty(range)), range=[]; end
if( nargin<3 || isempty(extraInf)); extraInf=1; end;
if size(I,3)==3 && max(I(:))>1, I = uint8(I); end;  %color images with values > 1 should be in range 0 to 255 and uint8 -- dm 2015-05-09
% display image using imagesc
if(isempty(range)), h=imagesc(I); else h=imagesc(I,range); end
% set basic and optional properties
colormap(gray); title(inputname(1)); axis('image');
if( extraInf ), colorbar; else set(gca,'XTick',[],'YTick',[]); end
% output h only if output argument explicitly requested
if(nargout>0), varargout={h}; end
end

% whitebg('black'); set(gcf,'color', [0 0 0]); %black background
% set(gcf,'menubar','none'); % no menu