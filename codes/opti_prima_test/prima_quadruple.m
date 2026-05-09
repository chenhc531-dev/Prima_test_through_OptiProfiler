function x = prima_quadruple(fun, x0, varargin)
    p = [varargin, cell(1,8)];
    nl = [];                                      
    if ~isempty(p{7}) || ~isempty(p{8})
        nl = @(x) deal(p{7}(x), p{8}(x));         
    end
    [x, ~] = prima(fun, x0, p{3},p{4},p{5},p{6},p{1},p{2}, nl, struct('precision','quadruple'));
end