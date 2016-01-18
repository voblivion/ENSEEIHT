%%
%   f(x) = 0 pour f = ║s║² et s : x -> - Somme(beta_i / (lambda_i + x))
%
%
%
function x = newtonNonLineaire(beta, lambda, delta, xmin, xmax)

epsilon = 10^-10;
fmin = f(beta, lambda, delta, xmin);
fmax = f(beta, lambda, delta, xmax);

x = xmax;
fx = fmax;
dfx = df(beta, lambda, x);
round = 0;

while abs(fmin) > epsilon && abs(fmax) > epsilon
    xn = x - fx/dfx;
    fxn = f(beta, lambda, delta, xn);
    
    if xmin <= xn && xn <= xmax && abs(fxn) < abs(fx) / 2
        x = xn;
        fx = fxn;
        dfx = df(beta, lambda, x);
    else
        xd = (xmin + xmax) / 2;
        fxd = f(beta, lambda, delta, xd);
        if fmin * fxd < 0
            xmax = xd;
            fmax = fxd;
            x = xd;
        else
            xmin = xd;
            fmin = fxd;
            x = xd;
        end
        fx = f(beta, lambda, delta, x);
        dfx = df(beta, lambda, x);
    end
    round = round + 1;
end

if abs(fmin) <= epsilon
    x = xmin;
else
    x = xmax;
end

disp(round);

end