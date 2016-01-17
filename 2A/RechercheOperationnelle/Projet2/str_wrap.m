function x = wrap(numpart,tx,ty,gx,gy)

global nbr;
global vostr;

[x, str] = str_aluminium(numpart, tx, ty, gx, gy);

ostr = '';

if numpart ~= 1
    numpart = numpart - 1;
    [ox, ostr] = str_aluminium(numpart, tx, ty, gx, gy);
end

if strcmp(str, ostr)
    n = numel(vostr);
    for k = 1:(n+1)
        fprintf('\b');
    end
    nbr = nbr + 1;
    vostr = [str ' * ' int2str(nbr)];
    fprintf('%s\n', vostr);
else
    nbr = 1;
    vostr = str;
    fprintf('%s\n', str);
end

end