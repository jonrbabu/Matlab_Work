function [x,y] = projectileSimple(x_0,y_0,v_x0,v_y0,t)
    g = 9.80665
    y = y_0 + v_y0.*t - .5*g*t.^2
    x = x_0 + v_x0.*t
end