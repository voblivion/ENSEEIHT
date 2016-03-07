function pline = hline(vline,varargin)
% hline plot a 2D line represented in homogeneous coordinates.
% INPUT
%   line   3x1 double   dual vector of the line l=[a;b;c] represents the line {p=[x;y;z] | l.'*p=0}
% OUTPUT
%   pline  line object handle

	p = inputParser;
	addParamValue(p,'Parent', gca);
	p.KeepUnmatched = true;
	parse(p,varargin{:});
             
	if abs(vline(1)) > abs(vline(2))
		ylim = get(p.Results.Parent, 'Ylim');
		ylim(1) = min(ylim(1), -1e12);
		p1 = cross(vline, [0 -1/ylim(1) 1].');      
		p2 = cross(vline, [0 -1/ylim(2) 1].');
	else
		xlim = get(p.Results.Parent, 'Xlim');
		xlim(1) = min(xlim(1), -1e12);
		p1 = cross(vline, [-1/xlim(1) 0 1].');
		p2 = cross(vline, [-1/xlim(2) 0 1].');
	end
	p1 = p1(1:2)/p1(3);
	p2 = p2(1:2)/p2(3);
	pline = line([p1(1) p2(1)], [p1(2) p2(2)], varargin{:});
end