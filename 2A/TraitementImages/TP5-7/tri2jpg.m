% tri2jpg
%
lecshowtrimago;
new_path = [path(1:find(path == '.')), 'jpg'];
imwrite(image / 255, new_path, 'jpg', 'Comment', etiquette);
f = dir(path);
old_size = f.bytes;
f = dir(new_path);
new_size = f.bytes;
fprintf('Compression : %0.2fx\n', old_size/new_size);