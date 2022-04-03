function xZero = getZeroNewtonRaphson(f, df, x0, tol)
    x = x0;
    err = f(x)/df(x);
    
    n = 1;
    while abs(err) > abs(tol)

        if n >= 20
            fprintf('Surpassed %i steps, error: %e\n', n, err);
            break
        end
        
        err = f(x)/df(x);
        x = x0 - err;
        x0 = x;
        
        n = n+1;
    end
    
    xZero = x;
end