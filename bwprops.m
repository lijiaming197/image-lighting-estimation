function [center, radius, box_props] = bwprops(bw)
center = [];
radius = [];
box_props = [];
% obtain region properties every object
props = regionprops(bw, 'BoundingBox', 'Area', 'Centroid', ...
    'MajorAxisLength', 'MinorAxisLength');
for i = 1:size(props,1)
    center = [center; props(i).Centroid];
    diameter = mean([props(i).MajorAxisLength props(i).MinorAxisLength], 2);
    radius = [radius; diameter/2];
    box_props = [box_props; props(i).BoundingBox];
end

end